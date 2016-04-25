/**
 * \file    R_RTOS_timer.c
 * \author  Christian Neuberger (NeubergerCh50344@th-nuernberg.de)
 * \date    16.12.2015
 *
 * \brief Functions for creating, initializing, maintaining and handling a task timers.
 */

#ifdef _TPMUSED_

#include "TimerFunc.h"
#include "InterruptFunc.h"

#include "R_RTOS_timer.h"

#include "R_RTOS_task.h"
#include "R_RTOS_memMngr.h"

#ifdef __DEBUG__
#include <string.h>
#include "DevFunc.h"
extern char gSysMsg[SYS_MSG_LEN ];
#endif

extern void os_SCHEDULE( void );
extern TskTCB tsk_AR[];
extern SysFkt sys_SysFkt[];

static MemPoolID memPoolID_TMR;

/** \var startTMRNode
 *  \brief The start node for the task Timer queue.
 *
 *  Initialized to NULL.
 */
static Timer tskTMR;

/** \var startSysTMRNode
 *  \brief The start node for the system Timer queue.
 *
 *  Initialized to NULL.
 *
 */
static Timer sysTMR;

static void BREAK( void )
{
    while ( 1 )
    {
        ;
    };
}
// /** \fn RetCode tmr_updateStrtTMR( Timer **strt );
// *  \brief Delete and free the StartNode and then set the StartNode to the next next.
// *
// *  \param [in]     strt                Pointer to the Pointer to the current start of the Timer queue
// *  \return         RetCode             Return the success of the operation
// *
// *  Adjust the startTMRNode to the next node in the list. Freeing of ressouces is done automatically.
// *
// */
//static inline RetCode tmr_updateStrtTMR( Timer **strt )
//{
//    Timer * nxtNode = ( *strt )->ptrNxtTmr;
//    //free( *strt );
//    memMngr_MemPoolFree( *strt, memPoolID_TMR );
//    ( *strt ) = nxtNode;
//    return RET_OK;
//}

static RetCode tmr_InsertSysTmrQ( TmrFktCall * sysFktTmr, LifeTime expires )
{
    //Note: the first case is more likely to happen in most system, since system timers are likely to include task activation timers which are usually perdiodically triggered
    if ( ( sysTMR.expirationTime > expires ) || ( sysTMR.specTimer.sysTimer.sysFktIDQStrt
            == SYSFKT_INVALID_SYSFKT_ID ) )
    {
        sysFktTmr->nxtFktCall = sysTMR.specTimer.sysTimer.sysFktIDQStrt;
        sysTMR.specTimer.sysTimer.sysFktIDQStrt = sysFktTmr->fktID;
        sysTMR.expirationTime = expires;
    }
    else
    {
        TmrFktCall * curSysFktTmr =
                &( sys_SysFkt[sysTMR.specTimer.sysTimer.sysFktIDQStrt].fktCallType.tmrFktCall );    // get start of queue
        if ( curSysFktTmr->nxtFktCall != SYSFKT_INVALID_SYSFKT_ID )
        {
            TmrFktCall * nxtSysFktTmr =
                    &( sys_SysFkt[curSysFktTmr->nxtFktCall].fktCallType.tmrFktCall );    // get start of queue

            while ( nxtSysFktTmr->expirationTime <= expires )
            {
                curSysFktTmr = nxtSysFktTmr;
                if ( nxtSysFktTmr->nxtFktCall == SYSFKT_INVALID_SYSFKT_ID )
                    break;
                nxtSysFktTmr =
                        &sys_SysFkt[nxtSysFktTmr->nxtFktCall].fktCallType.tmrFktCall;
            }
        }
        sysFktTmr->nxtFktCall = curSysFktTmr->nxtFktCall;
        curSysFktTmr->nxtFktCall = sysFktTmr->fktID;

    }
    return RET_OK;
}

/*
 * ENTRIES ARE SORTED ACCORDING TO THEIR ASCENDING TIMER DURATION
 */
static RetCode tmr_InsertTskTmrQ( PTskTCB tsk, LifeTime expires )
{
    if ( ( tskTMR.expirationTime > expires ) || ( tskTMR.specTimer.tskTimer.tskIDQStrt
            == TSK_ID_NO_TSK ) )
    {
        tsk->nxtTsk = tskTMR.specTimer.tskTimer.tskIDQStrt;
        if ( tsk->nxtTsk != TSK_ID_NO_TSK )
        {
            // Adjust the current start of the list
            tsk_AR[tsk->nxtTsk].prvTsk = tsk->tskID;
        }
        tsk->prvTsk = TSK_ID_NO_TSK;
        tskTMR.specTimer.tskTimer.tskIDQStrt = tsk->tskID;
        tskTMR.expirationTime = expires;
    }
    else
    {
        // Get start of the task timer queue
        PTskTCB curTsk = &tsk_AR[tskTMR.specTimer.tskTimer.tskIDQStrt];
        if ( curTsk->nxtTsk != TSK_ID_NO_TSK )
        {
            PTskTCB nxtTsk = &tsk_AR[curTsk->nxtTsk];

            while ( nxtTsk->tskSync->SyncEleHandle.TmrSyncEle.expireTime <= expires )
            {
                curTsk = nxtTsk;
                if ( nxtTsk->nxtTsk == TSK_ID_NO_TSK )
                    break;

                nxtTsk = &tsk_AR[nxtTsk->nxtTsk];
            }
        }
        tsk->nxtTsk = curTsk->nxtTsk;
        tsk->prvTsk = curTsk->tskID;
        if ( tsk->nxtTsk != TSK_ID_NO_TSK )
        {
            tsk_AR[tsk->nxtTsk].prvTsk = tsk->tskID;
        }
        curTsk->nxtTsk = tsk->tskID;
    }
    return RET_OK;
}

RetCode tmr_INIT( void )
{
    __init_TPM( (uint8_t) 0x1u );

    sysTMR.timerType = SysTimerType;
    sysTMR.expirationTime = TMR_INVALID_TIME;
    sysTMR.specTimer.sysTimer.sysFktIDQStrt = SYSFKT_INVALID_SYSFKT_ID;
    installIrq( &tmr_SysTimerElapsed, TPM1_IRQ_INDEX, (uint8_t) 0x0u );

    tskTMR.timerType = TskTimerType;
    tskTMR.expirationTime = TMR_INVALID_TIME;
    tskTMR.specTimer.tskTimer.tskIDQStrt = TSK_ID_NO_TSK;
    installIrq( &tmr_TskTimerElapsed, TPM1_IRQ_INDEX, (uint8_t) 0x1u );

    enableIRQ( TPM1_IRQn );
    setIRQPrio( TPM1_IRQn, 2 );

    memMngr_CreateMemPool( sizeof(SyncEle), MEM_OBJECTS_TMR, &memPoolID_TMR );

    return RET_OK;
}

RetCode tmr_setSysTimer( SysFktID fktID, TmrTime msToWait, uint8_t periodicity )
{
    //ToDo replace READ_PIT with a getLifeTime fkt for portability!
    LifeTime expires = (LifeTime) READ_PIT() + (LifeTime) msToWait;
    TmrFktCall * sysFktTmr = &sys_SysFkt[fktID].fktCallType.tmrFktCall;
    if ( (uint32_t) sysFktTmr->sysFktCall != (uint32_t) NULL )
    {
        sysFktTmr->fktID = fktID;
        sysFktTmr->expirationTime = expires;
        if ( periodicity )
        {
            sysFktTmr->reloadTime = msToWait;
        }
        else
        {
            sysFktTmr->reloadTime = (TmrTime) 0x0u;
        }
        if ( tmr_InsertSysTmrQ( sysFktTmr, expires ) != RET_OK )
            return RET_NOK;
        if ( READ_PIT() < sysTMR.expirationTime )
        {
            //ToDo replace UPDATE_TPM_CH with a more portable fkt
            UPDATE_TPM_CH(
                    (uint8_t ) 0x1u, (uint8_t ) 0x0u,
                    ( (uint16_t) ( sysTMR.expirationTime - READ_PIT() ) ) );
        }
        else
        {
            tmr_SysTimerElapsed();
        }
        return RET_OK;
    }
    return RET_NOK;
}

RetCode tmr_setTskTimer( PTskTCB const tsk, TmrTime msToWait )
{
    //ToDo replace READ_PIT with a getLifeTime fkt for portability!
    LifeTime expires = (LifeTime) READ_PIT();
    expires += (LifeTime) msToWait;
    // CHECK IF THE SPECIFIED TASK IS NOT ALREADY WAITING FOR ANOTHER SYNC MECHA
    if ( ( (uint32_t) tsk == (uint32_t) NULL ) || ( (uint32_t) tsk->tskSync
            != (uint32_t) NULL ) )
        return RET_NOK;

    PSyncEle tmrSync;
    memMngr_MemPoolMalloc( &tmrSync, memPoolID_TMR );
    if ( (uint32_t) tmrSync != (uint32_t) NULL )    // MALLOC FAILED ?
    {
        //ToDO
//        tmrSync->maxBlckTime = (SysTicks) 0x0u;
        tmrSync->syncEleType = SyncEle_TYPE_TMR;
        tmrSync->syncEleID = (SyncEleID) TskTimerType;
        tmrSync->SyncEleHandle.TmrSyncEle.expireTime = expires;

        tsk->tskSync = tmrSync;

        tsk_SetEvt( tsk, tmrSync );

        if ( tskTMR.specTimer.tskTimer.tskIDQStrt == TSK_ID_NO_TSK )    // IS THERE ALREADY A START NODE FOR THE TMR LST ?
        {
            // THERE IS NO TIMER QUEUE YET
            tskTMR.expirationTime = expires;    // GET TIME TO WAIT AND SAVE IN LST
            tskTMR.specTimer.tskTimer.tskIDQStrt = tsk->tskID;    // SAVE TASK IN LST
            tsk->nxtTsk = TSK_ID_NO_TSK;
            tsk->prvTsk = TSK_ID_NO_TSK;
        }
        else
        {
            // THERE IS ALREADY A TIMER QUEUE
            if ( tmr_InsertTskTmrQ( tsk, expires ) != RET_OK )    // QUEUE TMR INTO TMR LST
                return RET_NOK;
        }
        //ToDO
        /*
         * PROBLEM!!!
         * Somehow the interrupt is not triggered correctly
         * resulting in the expiration time being smaller than the current time.
         *
         */
        if ( READ_PIT() < tskTMR.expirationTime )
        {
            //ToDo replace UPDATE_TPM_CH with a more portable fkt
            UPDATE_TPM_CH(
                    (uint8_t ) 0x1u, (uint8_t ) 0x1u,
                    ( (uint16_t) ( tskTMR.expirationTime - READ_PIT() ) ) );
        }
        else
        {
            tmr_TskTimerElapsed();
        }
        return RET_OK;
    }
    BREAK();
    tsk->tskState = TSK_STATE_ERROR;
    return RET_NOK;
}

void tmr_SysTimerElapsed( void )
{
    __disable_irq();
    //ToDO REPLACE WITH MORE PORTABLE FUNCTION
    stopTPMChannel( (uint8_t) 0x1u, (uint8_t) 0x0u );
    if ( sysTMR.specTimer.sysTimer.sysFktIDQStrt != SYSFKT_INVALID_SYSFKT_ID )    // FAIL SAFE IN CASE A TIMER WAS STARTED/RESTARTED INCORRECTLY
    {
        TmrFktCall * fkt;
        do
        {
            // RETRIEVE FUNCTION
            fkt = &sys_SysFkt[sysTMR.specTimer.sysTimer.sysFktIDQStrt].fktCallType.tmrFktCall;
            // CALL FUNCTION
            ( fkt->sysFktCall )();

            // ADJUST sysTMR
            sysTMR.specTimer.sysTimer.sysFktIDQStrt = fkt->nxtFktCall;

            if ( sysTMR.specTimer.sysTimer.sysFktIDQStrt == SYSFKT_INVALID_SYSFKT_ID )
            {
                sysTMR.expirationTime = TMR_INVALID_TIME;
                /*
                 * cannot use break here, because if a timer restart is
                 * handled in the next if statement and the current
                 * timer expiration time is needed for the timer queuing mechanism.
                 */
                //break;
            }
            else
            {
                sysTMR.expirationTime =
                        sys_SysFkt[fkt->nxtFktCall].fktCallType.tmrFktCall.expirationTime;
            }
            if ( fkt->reloadTime )    // AUTOMATIC RESTART
            {
                fkt->expirationTime = (LifeTime) READ_PIT()
                        + (LifeTime) fkt->reloadTime;
                tmr_InsertSysTmrQ( fkt, fkt->expirationTime );
                fkt = &sys_SysFkt[sysTMR.specTimer.sysTimer.sysFktIDQStrt].fktCallType.tmrFktCall;
                sysTMR.expirationTime = fkt->expirationTime;
            }
        } while ( sysTMR.expirationTime <= ( READ_PIT() + TMR_PIT_DELAY ) );    // SYSTEM TIME SHALL NEVER EXCEED TMR_INVALID_TIME

        if ( sysTMR.expirationTime != TMR_INVALID_TIME )
        {
            UPDATE_TPM_CH(
                    (uint8_t ) 0x1u, (uint8_t ) 0x0u,
                    ( (uint16_t) ( sysTMR.expirationTime - READ_PIT() ) ) );
        }
    }
    else
    {
        BREAK();
    }
    __enable_irq();
}

void tmr_TskTimerElapsed( void )
{
    __disable_irq();
    /*
     * Stop timer to prevent another interrupt for very short timer periods.
     */
    stopTPMChannel( (uint8_t) 0x1u, (uint8_t) 0x1u );
    if ( tskTMR.specTimer.sysTimer.sysFktIDQStrt != TSK_ID_NO_TSK )    // FAIL SAFE => CHECK startTMRNode for validity...
    {
        PTskTCB tsk;
        // CORRECT ALL TIMERS IN TMR LST
        //do// MINIMUM DO CLEAR startTMRNode... TPM AND PIT TIMER DRIFT AWAY FORM EACH OTHER SOMEHOW...
        do
        {
            //Retrieve current task
            tsk = &tsk_AR[tskTMR.specTimer.tskTimer.tskIDQStrt];
            //Set next task as next to expire
            tskTMR.specTimer.tskTimer.tskIDQStrt = tsk->nxtTsk;

            /*
             * clear timer event from task reinserting the task into the active task queue
             */
            tsk_ClrEvt( tsk, tsk->tskSync );
            /*
             * free resources for the sync element
             */
            memMngr_MemPoolFree( tsk->tskSync, memPoolID_TMR );
            tsk->tskSync = (PSyncEle) NULL;

            if ( tskTMR.specTimer.tskTimer.tskIDQStrt == TSK_ID_NO_TSK )
            {
                tskTMR.expirationTime = TMR_INVALID_TIME;
                break;
            }
            else
            {
                tsk = &tsk_AR[tskTMR.specTimer.tskTimer.tskIDQStrt];
                tskTMR.expirationTime =
                        tsk->tskSync->SyncEleHandle.TmrSyncEle.expireTime;
                tsk->prvTsk = TSK_ID_NO_TSK;
            }
        } while ( tskTMR.expirationTime <= ( READ_PIT() + TMR_PIT_DELAY ) );    // allow TMR_PIT_DELAY delay...

        if ( READ_PIT() > tskTMR.expirationTime )
        {
            BREAK();
        }

        if ( tskTMR.expirationTime != TMR_INVALID_TIME )
        {
            UPDATE_TPM_CH(
                    (uint8_t ) 0x1u, (uint8_t ) 0x1u,
                    ( (uint16_t) ( tskTMR.expirationTime - READ_PIT() ) ) );
        }
    }
    else
    {
        BREAK();
    }
    os_SCHEDULE();
    __enable_irq();
}

// CAUTION! CALL THIS FUNCTION ONLY IF YOU ARE SURE THAT THE SYNC ELE IS A TSK TIMER!
RetCode tmr_GiveUpOnTMR( PTskTCB const tsk )
{
    /*
     * Task has/was ended unexpectedly
     *      delete task from timer wait queue
     */
    if ( tskTMR.specTimer.tskTimer.tskIDQStrt == TSK_ID_NO_TSK )
        return RET_NOK;

    if ( tsk->tskID == tskTMR.specTimer.tskTimer.tskIDQStrt )
    {
        /*
         * Task is the start of the timer wait queue
         */
        tskTMR.specTimer.tskTimer.tskIDQStrt = tsk->nxtTsk;
        if ( tsk->nxtTsk == TSK_ID_NO_TSK )
        {
            /*
             * Task was the only element in the timer wait queue
             *
             * Stop the timer and invalidate its expiration time
             */
            tskTMR.expirationTime = TMR_INVALID_TIME;
            stopTPMChannel( (uint8_t) 0x1u, (uint8_t) 0x1u );
        }
        else
        {
            /*
             * Set next task as the new start of the timer wait queue
             */
            PTskTCB curTsk = &tsk_AR[tsk->nxtTsk];
            curTsk->prvTsk = TSK_ID_NO_TSK;    // there is no preceding task
            /*
             * adjust timer expiration time
             */
            tskTMR.expirationTime =
                    curTsk->tskSync->SyncEleHandle.TmrSyncEle.expireTime;
            /*
             * Update HW timer with new expiration time
             */
            UPDATE_TPM_CH(
                    (uint8_t ) 0x1u, (uint8_t ) 0x1u,
                    ( (uint16_t) ( tskTMR.expirationTime - READ_PIT() ) ) );
        }
    }
    else
    {
        /*
         * Task is not the start of the timer wait queue
         */
        if ( tsk->nxtTsk != TSK_ID_NO_TSK )
        {
            /*
             * there is a successor to the task in the timer wait queue
             * thus adjust its prvTsk index
             */
            tsk_AR[tsk->nxtTsk].prvTsk = tsk->prvTsk;
        }
        if ( tsk->prvTsk != TSK_ID_NO_TSK )
        {
            /*
             * there is a predecessor to the task in the timer wait queue,
             * thus adjust its nxtTsk index
             *
             */
            tsk_AR[tsk->prvTsk].nxtTsk = tsk->nxtTsk;
        }
    }
    /*
     * invalidate timer queue indices
     */
    tsk->nxtTsk = TSK_ID_NO_TSK;
    tsk->prvTsk = TSK_ID_NO_TSK;
    /*
     * clear the event from the task
     */
    tsk_ClrEvt( tsk, tsk->tskSync );
    /*
     * free resources for the sync element
     */
    memMngr_MemPoolFree( tsk->tskSync, memPoolID_TMR );
    tsk->tskSync = (PSyncEle) NULL;
    return RET_OK;
}

#endif
