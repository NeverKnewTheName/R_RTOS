/*
 * R_RTOS_SysTickTMR.c
 *
 *  Created on: 06.04.2016
 *      Author: neubergerch50344
 */

#include "PortFunc.h"

#include "R_RTOS_SysTickTMR.h"
#include "R_RTOS_memMngr.h"

#include "R_RTOS_scheduler.h"

#include "MKL05Z4.h"

extern TskTCB tsk_AR[];
extern SysFkt sys_SysFkt[];

extern void os_SCHEDULE( void );

/** \var os_SysTicks
 *  \brief Counts the number of SysTicks.
 *
 *  Holds the current number of SysTicks. The interval of SysTicks is influenced by the time slice.
 *
 */
static volatile SysTime os_SysTicks;

/** \var os_TimeSlice
 *  \brief Current time slice in ms.
 *
 *  Holds the current value of the time slice.
 *
 */
static volatile SysTime os_TimeSlice;

static volatile PSysTickTMR ar_PSysTickTMR[SYSTCK_AR_RES ];

static MemPoolID memPoolID_SysTckTMR;

static RetCode sysTck_UpdateSysTckTMRs( SysTicks sysTcksDecr )
{
    PSysTickTMR tmpSysTckTMR = ar_PSysTickTMR[sysTcksDecr];
    // Invalidate slot, because repeated timers or non expired timers will be queue back nevertheless
    ar_PSysTickTMR[sysTcksDecr] = (PSysTickTMR) NULL;
    PSysTickTMR tmpNxtSysTckTMR;
    while ( (uint32_t) tmpSysTckTMR != (uint32_t) NULL )
    {
        // advance one node formally
        tmpNxtSysTckTMR = tmpSysTckTMR->nxtSysTickTMR;
        /*
         * decrement system ticks from remSysTicks counter
         * cases:
         *
         *      timer expired
         *          unblock object
         *
         *      timer not expired
         *          remaining ticks match current slot modulo
         *              do nothing than decrease remSysTicks
         *          remaining ticks do not match slot anymore
         *              remove from current slot and place in matching slot
         */

        // save remaining SysTicks for future comparison if not equal zero
        //SysTicks remSysTcks = tmpSysTckTMR->remSysTicks;
        /*
         * Decrement = sysTcksDecr - insertion time & SYSTCK_AR_RES_MSK
         * e.g.:
         * +-------+------+--------+------+--------------
         * | insrt | cur  |  exprs | decr | remain
         * +-------+------+--------+------+--------------
         * | 3     | 5    |  2     | 2    | 0  -> expired
         * +-------+------+--------+------+--------------
         * | 5     | 2    |  5     | 5    | 0  -> expired
         * +-------+------+--------+------+--------------
         * | 0     | 1    |  17    | 1    | 16 -> place in different container
         * | 1     | 1    |  16    | 8    | 8  -> keep in container
         * | 1     | 1    |  8     | 8    | 0  -> expired
         * +-------+------+--------+------+--------------
         */

        SysTicks tckDecr = (SysTicks) ( ( sysTcksDecr
                - tmpSysTckTMR->insrtnSysTicksTime )
                                        & SYSTCK_AR_RES_MSK );
        tmpSysTckTMR->remSysTicks -= tckDecr ? tckDecr : (SysTicks) 0x8u;
        // delete sysTckTMR from list, because it gets queued in after processing anyway.
        if ( (uint32_t) tmpSysTckTMR->nxtSysTickTMR != (uint32_t) NULL )
        {
            tmpSysTckTMR->nxtSysTickTMR->prvSysTickTMR =
                    tmpSysTckTMR->prvSysTickTMR;
        }
        if ( (uint32_t) tmpSysTckTMR->prvSysTickTMR != (uint32_t) NULL )
        {
            tmpSysTckTMR->prvSysTickTMR->nxtSysTickTMR =
                    tmpSysTckTMR->nxtSysTickTMR;
        }

        if ( !tmpSysTckTMR->remSysTicks )
        {
            /*
             * timer has expired -> unblock object according to given context
             */
            if ( tmpSysTckTMR->sysTckObjType & SysTckObj_Tsk )
            {
                /*
                 * sysTck object is a task object
                 * place task back into active list
                 */

                // get pointer to corresponding task
                PTskTCB tmpTsk =
                        &tsk_AR[(TskID) tmpSysTckTMR->sysTckObjID.tskID];
                if ( tmpSysTckTMR->sysTckObjType == SysTckObj_TskWait )
                {
                    /*
                     * SysTckObj indicates that it is a wait timer for the task
                     */
                    tmpTsk->tskState = TSK_STATE_ACTIVE_SUSPENDED;
                    tsk_insrtTskActvTskLst( tmpTsk );
                }
                else if ( tmpSysTckTMR->sysTckObjType == SysTckObj_TskBlck )
                {
                    /*
                     * SysTckObj indicates that it is a timer for a blocking synchronization mechanism
                     * give up on blocking event
                     */
                    // evaluate which synchronization mechanism keeps blocking the task
                    switch ( tmpTsk->tskSync->syncEleID )
                    {
                        case SyncEle_TYPE_EVT:
                            evt_GiveUpOnEvts( tmpTsk );
                            break;
                        case SyncEle_TYPE_SEM:
                            sem_GiveUpOnSem( tmpTsk );
                            break;
                        case SyncEle_TYPE_TMR:
                            tmr_GiveUpOnTMR( tmpTsk );
                            break;
                        case SyncEle_TYPE_MNTR:
                            //ToDO
                            //mntr_GiveUpOnMNTR(tmpTsk);
                            break;
                        case SyncEle_TYPE_NOID:
                            // ERROR?
                            break;
                        default:
                            // ERROR?
                            break;
                    }
                }

                // free resources for the allocated sysTickTMR object in the task
                memMngr_MemPoolFree( tmpSysTckTMR, memPoolID_SysTckTMR );
                tmpTsk->sysTckTmr = (PSysTickTMR) NULL;
            }
            else if ( tmpSysTckTMR->sysTckObjType & SysTckObj_SysFkt )
            {
                /*
                 * sysTck object is a sysFkt object
                 */
                PSysTckFktCall sysTckFktCall =
                        &sys_SysFkt[(SysFktID) tmpSysTckTMR->sysTckObjID.sysFktID].fktCallType.sysTckFktCall;
                if ( tmpSysTckTMR->sysTckObjType == SysTckObj_SysFktWait )
                {
                    /*
                     * sysFkt was timed by the sysTckTMR
                     * call its function
                     */
                    ( *sysTckFktCall->sysFktCall )();
                }
                else if ( tmpSysTckTMR->sysTckObjType == SysTckObj_SysFktBlck )
                {
                    //ToDO
                }

                //ToDO
                if ( sysTckFktCall->reloadTime )
                {
                    tmpSysTckTMR->remSysTicks = sysTckFktCall->reloadTime;
                    tmpSysTckTMR->insrtnSysTicksTime = sysTcksDecr;

                    tmpSysTckTMR->nxtSysTickTMR =
                            ar_PSysTickTMR[( os_SysTicks
                                    + tmpSysTckTMR->remSysTicks )
                                           & SYSTCK_AR_RES_MSK ];
                    if ( (uint32_t) tmpSysTckTMR->nxtSysTickTMR != (uint32_t) NULL )
                    {
                        tmpSysTckTMR->nxtSysTickTMR->prvSysTickTMR =
                                tmpSysTckTMR;
                    }
                    tmpSysTckTMR->prvSysTickTMR = (PSysTickTMR) NULL;
                    ar_PSysTickTMR[( os_SysTicks + tmpSysTckTMR->remSysTicks )
                            & SYSTCK_AR_RES_MSK ] = tmpSysTckTMR;
                }
                else
                {
                    // free resources for the allocated sysTickTMR object in the task
                    memMngr_MemPoolFree( tmpSysTckTMR, memPoolID_SysTckTMR );
                    sysTckFktCall->sysTckTmr = (PSysTickTMR) NULL;
                }
            }
        }
        else
        {
            //ToDO
            /*
             * PUT INTO ANOTHER SYSTICKSLOT!
             */
            tmpSysTckTMR->insrtnSysTicksTime = sysTcksDecr;
            tmpSysTckTMR->nxtSysTickTMR = ar_PSysTickTMR[( os_SysTicks
                    + tmpSysTckTMR->remSysTicks )
                                                         & SYSTCK_AR_RES_MSK ];
            if ( (uint32_t) tmpSysTckTMR->nxtSysTickTMR != (uint32_t) NULL )
                tmpSysTckTMR->nxtSysTickTMR->prvSysTickTMR = tmpSysTckTMR;
            tmpSysTckTMR->prvSysTickTMR = (PSysTickTMR) NULL;
            ar_PSysTickTMR[( os_SysTicks + tmpSysTckTMR->remSysTicks )
                    & SYSTCK_AR_RES_MSK ] = tmpSysTckTMR;
        }
        tmpSysTckTMR = tmpNxtSysTckTMR;
    }
}

/*
 * SysTick Handler ---> scheduler
 */
void SysTick_Handler( void )
{
    __disable_irq();    // disable interrupts // no need to look for nested interrupts, because this is an interrupt..
    ++os_SysTicks;
    //TOGGLE_PIN( PIN_LED3 );
    sysTck_UpdateSysTckTMRs( os_SysTicks & SYSTCK_AR_RES_MSK );

    SysTick_Config( (uint32_t) os_TimeSlice );
#ifdef __DEBUG__
#ifdef __DEBUG__FLOW__
    WRITE_TO_MSG_BUFF( gSysMsg, "TCK" );
#endif
#endif
//#ifdef _RTOSUSED_
//    gOS_FLAGS.gWokenUp = 0x1u;
//#endif
    os_SCHEDULE();
    __enable_irq();
}

/*
 * initialize the system tick timer functionality
 * allocate a memory pool for SysTickTMR objects
 */
RetCode sysTck_INIT( void )
{
    uint8_t cntr = SYSTCK_AR_RES;
    while ( cntr-- )
    {
        ar_PSysTickTMR[cntr] = (PSysTickTMR) NULL;
    }

    return memMngr_CreateMemPool(
            sizeof(SysTickTMR), MEM_OBJECTS_SysTckTMR, &memPoolID_SysTckTMR );
}

/*
 * set a system tick timer for a given object referenced by its objID and specified by its objType
 */
RetCode sysTck_setSysTckTMR(
                             const SysTicks sysTcksToWait,
                             const SysTckEleType objType,
                             const uint8_t objID )
{
    PSysTickTMR tmpSysTckTMR;
    memMngr_MemPoolMalloc( &tmpSysTckTMR, memPoolID_SysTckTMR );
    if ( (uint32_t) tmpSysTckTMR != (uint32_t) NULL )
    {
        tmpSysTckTMR->sysTckObjType = objType;
        tmpSysTckTMR->remSysTicks = sysTcksToWait;
        tmpSysTckTMR->insrtnSysTicksTime = os_SysTicks & SYSTCK_AR_RES_MSK;
        tmpSysTckTMR->nxtSysTickTMR = ar_PSysTickTMR[( os_SysTicks
                + sysTcksToWait )
                                                     & SYSTCK_AR_RES_MSK ];
        if ( (uint32_t) tmpSysTckTMR->nxtSysTickTMR != (uint32_t) NULL )
            tmpSysTckTMR->nxtSysTickTMR->prvSysTickTMR = tmpSysTckTMR;
        tmpSysTckTMR->prvSysTickTMR = (PSysTickTMR) NULL;
        ar_PSysTickTMR[( os_SysTicks + sysTcksToWait ) & SYSTCK_AR_RES_MSK ] =
                tmpSysTckTMR;

        if ( objType & SysTckObj_Tsk )
        {
            tsk_AR[(TskID) objID].sysTckTmr = tmpSysTckTMR;
            tmpSysTckTMR->sysTckObjID.tskID = (TskID) objID;
            if ( objType == SysTckObj_TskWait )
            {
                return tsk_SetInactive(
                        &tsk_AR[(TskID) objID], TSK_STATE_WAITING );
            }
            else if ( objType == SysTckObj_TskBlck )
            {
                // THERE IS NOTHING ELESE TO DO
            }
        }
        else if ( objType & SysTckObj_SysFkt )
        {
            tmpSysTckTMR->sysTckObjID.sysFktID = (SysFktID) objID;
            if ( objType == SysTckObj_SysFktWait )
            {
                //ToDO
            }
            else if ( objType == SysTckObj_SysFktBlck )
            {
                //ToDO
            }
        }
        else
        {
            return RET_NOK;
        }
    }
    else
    {
        return RET_NOK;
    }
    return RET_OK;
}

/*
 * get current global system ticks passed since start of the system tick timer
 */
SysTime sysTck_getSysTicks( void )
{
    return (const SysTime) os_SysTicks;
}

// USE WITH CAUTION!
SysTime sysTck_resetSysTicks( void )
{
    return os_SysTicks = (SysTime) 0x0u;
}

/*
 * Retrieve the current time slice
 */
SysTime sysTck_GetTimeSlice( void )
{
    return (const SysTime) os_TimeSlice;
}

/*
 * set a new time slice, resetting the old one
 */
SysTime sysTck_SetTimeSlice( const SysTime newTimeSlice )
{
    return os_TimeSlice = newTimeSlice;
}
