/**
 * \file    R_RTOS_system.c
 * \author  Christian Neuberger (NeubergerCh50344@th-nuernberg.de)
 * \date    12.01.2016
 *
 * \brief Functions for system functionality (system maintenance).
 */

#include "MKL05Z4.h"

#include "PortFunc.h"
#include "TimerFunc.h"
#include "InterruptFunc.h"
//#include "LPFunc.h"

#include "R_RTOS_system.h"
#include "R_RTOS_inc.h"

#include "R_RTOS_task.h"
#include "R_RTOS_stack.h"
#include "R_RTOS_scheduler.h"
#include "R_RTOS_sem.h"
#include "R_RTOS_timer.h"
#include "R_RTOS_SysTickTMR.h"
#include "R_RTOS_memMngr.h"
#include "R_RTOS_services.h"
#include "R_RTOS_events.h"
#include "R_RTOS_monitor.h"
#include "R_RTOS_msgQueuing.h"

extern void OS_START( void );

extern void updateTimersAfterSleep( void );

extern PTskTCB const pIDLETsk;    // address of IDLE Tsk -> also the start node of the XORed linked list!
extern TskTCB tsk_AR[NR_OF_TSKS];

extern volatile PTskTCB p_cur_tsk_tcb;
extern volatile PTskTCB p_nxt_tsk_tcb;
extern volatile BitsOSFlags gOS_FLAGS;
extern volatile TimerFlags gTMRFlags;

#ifdef __LP__MODE__
extern uint16_t timeToWake;
#endif

const uint8_t offsetOfTskState = OFFSETOF( TskTCB, tskState );

/** \var sys_SysFkt
 *  \brief System function array to hold various kinds of system functions.
 *  System functions can be referenced by their index in this array.
 *
 */
SysFkt sys_SysFkt[AMOUNT_SYS_FKT ];

/** \var svc_EXCReturn
 *  \brief EXC_RETURN value for the SVC Call.
 *
 *  The return of the SVC Call can be influenced by setting this variable.
 *  According to its value the stack pointer used for unstacking and the mode to return to are altered.
 *
 *  Possible Values:
 *
 *  VALUE       |   MEANING
 *  ----------- |  -------------------------------------------------------
 *  0xFFFFFFF1  |   Return to Handler mode ( e.g. for nested exceptions )
 *  0xFFFFFFF9  |   Return to Thread mode using Main Stack Pointer
 *  0xFFFFFFFD  |   Return to Thread mode using Process Stack Pointer
 *
 *
 */
volatile uint32_t svc_EXCReturn;

RetCode __initOS( void )
{
    /* INITIALIZE MEMORY */
    initMEM();
    os_INIT_Scheduler();
    // ALWAYS INIT TIMER FIRST
    __initTMRFlags();    //ALWAYS INIT TIMERFLAGS FIRST BEFORE INITIALIZING OR USING ANY TIMER
    __init_PIT();
    __init_TPM( 0x1u );

    enableIRQ( TPM1_IRQn );
    setIRQPrio( TPM1_IRQn, 0 );
    __enable_irq();
    calibratePITWithTPM( (uint8_t) 0x3u );
    __disable_irq();
    disableIRQ( TPM1_IRQn );

    /* SVC prio = 0 */
    SCB->SHP[0] = (uint32_t) ( 0x00000000u );
    //NVIC_SetPriority( SVCall_IRQn, 0x0u );
    /* SysTick prio = 1; PendSV prio = 2*/
    SCB->SHP[1] = (uint32_t) ( 0x40C00000u );
    //NVIC_SetPriority( SysTick_IRQn, 0x1u );
    //NVIC_SetPriority( PendSV_IRQn, 0x2u );

    /* INIT OS FLAGS */
    gOS_FLAGS.g_DispatchFlag = 0x0;
    gOS_FLAGS.g_tskCriticalExecution = 0x0;
    gOS_FLAGS.gLPExit = (uint8_t) 0x0;
    gOS_FLAGS.gWokenUp = (uint8_t) 0x1u;
    gOS_FLAGS.g_needsScheduling = (uint8_t) 0x0u;

    /* INIT TASKS */
    tsk_initTsks();

    /* INIT IDLE TASK */
    os_IDLETskInit( &tskIdle );

    /* INITIALIZE SEMAPHORES */
    sem_InitSems();

    /* INITIALIZE TIMERS */
    tmr_INIT();

    /* INITIALIZE EVENTS */
    evt_INIT();
    /* INITIALIZE MONITORS */
    //mntr_INIT();
    /* INITIALIZE MESSAGE QUEUING */
    //ToDO
    /* CONFIGURE SYSTICK TIMER */
    sysTck_resetSysTicks();
    sysTck_SetTimeSlice(
            (const SysTime) ( (uint64_t) ( (uint64_t) SystemCoreClock
                    * (uint64_t) TIME_SLICE_AMOUNT )
                              / (uint64_t) 1000 ) );
    sysTck_INIT();
    return RET_OK;
}

void tskIdle( void )
{
    __asm volatile( "mov r5, lr \n": : : );
    // SAVE LINK REGISTER INTO R5(subroutines only alter lower registers r0-r3) (containing the start address of the IDLETsk)
    //while ( 1 )
    //{
#ifdef __LP__MODE__
    // SVC CALL -- LP ENTER
    svc_lp_EnterLPMode();

    while ( !gOS_FLAGS.gWokenUp )
    {
        __NOP();
    }
    gOS_FLAGS.gWokenUp = (uint8_t) 0x0u;
#else
    //TOGGLE_PIN( PIN_LED0 );
    uint16_t i = (uint16_t) 0xFFFFu;
    while ( i-- )
    {
        __NOP();
    }
#endif
    //}
    // IDLE TASK IS MUST NOT BE 'TERMINATED'
    // HAS TO STAY READY
    __asm volatile( "mov lr, r5 \n": : : );
    // RESTORE PREVIOUS VALUE OF LINK REGISTER FROM R5 TO THE LINK REGISTER (subroutines only alter r0-r3) (containing the start address of the IDLETsk)
    // THIS WILL GENERATE AN ENDLESS LOOP FOR THE IDLE TASK WHICH CANNOT BE ENDED!
    // -> LESS PRONE TO FAILURE ( failing while, compiler optimization etc. )
    // -> LESS CODE ( no while loop due to exploitation of stacking and unstacking in subroutine calls )
}

void tsk_EndTheTask( void )
{
    while ( 1 )
    {
        ;
    }
}

RetCode SVC_HandlerMain( uint32_t *svc_args )
{
    switch ( ( (uint8_t *) svc_args[6] )[-2] )
    // Extract the svc code
    {
        case SVC_OS_START:    //START OS
            /* CALL USER PROVIDED OS_START() FUNCTION */
            OS_START();

            //Configure and start SysTick timer
            SysTick_Config( sysTck_GetTimeSlice() );

            /* SET CURRENT TASK TO IDLE TASK */
            p_cur_tsk_tcb = pIDLETsk;
            /* DO A MANUAL CONTEXT SWITCH */
            p_cur_tsk_tcb->tskState = TSK_STATE_ACTIVE_RUNNING;
            pIDLETsk->pStckPtr += (uint32_t) 0x8u;    // throw away 'saved' R11-R4
            __set_PSP( (uint32_t) pIDLETsk->pStckPtr );
            svc_EXCReturn = (uint32_t) 0xFFFFFFFDu;    // EXIT TO THREAD MODE WITH PSP
            __set_CONTROL( (uint32_t) 0x2u );
            __DSB();    // SYNCHRONIZE DATA BUFFER
            __ISB();    // SYNCHRONIZE INSTRUCTION BUFFER
            break;
        case SVC_TSK_INIT:    // INITIALIZE TASK
            if ( tsk_tskInit( (TskID) svc_args[0],    // Task ID
                    (TskStartAddr) svc_args[1],    // Start address of the task
                    (TskEndAddr) svc_args[2],    // Function to call after task's execution
                    (StackSize) svc_args[3] )    // Desired stack size for the task
                 != RET_OK )
            {
                return RET_NOK;
            }
            break;
        case SVC_TSK_SETPRIO:
            tsk_ChngePrio(
                    (TskTCB * const ) ( &tsk_AR[(TskID) svc_args[0]] ),
                    (TskPrio) svc_args[1] );
            os_SCHEDULE();
            break;
        case SVC_TSK_ACTV:    // ACTIVATE TASK
            if ( tsk_ActvTsk(
                    (TskTCB * const ) &( tsk_AR[(TskID) svc_args[0]] ) )
                 != RET_OK )
            {
                return RET_NOK;
            }
            gOS_FLAGS.g_needsScheduling = (uint8_t) 0x1u;
            os_SCHEDULE();
            break;
        case SVC_TSK_KILL:    // KILL THE TASK
            if ( tsk_tskDestroy( (PTskTCB) svc_args[0] ) != RET_OK )
            {
                return RET_NOK;
            }
//            ( (TskTCB*) svc_args[0] )->tskInfo.taskState =
//                    TSK_STATE_UNINIT_ENDED;
            gOS_FLAGS.g_needsScheduling = (uint8_t) 0x1u;
            //p_cur_tsk_tcb = (TskTCB*) NULL;
            os_SCHEDULE();
            break;
        case SVC_TSK_SET_CRIT:
            // NO ContextSwitching SHALL TAKE PLACE AS LONG AS THIS FLAG IS SET
            gOS_FLAGS.g_tskCriticalExecution = (uint8_t) 0x1u;
            break;
        case SVC_TSK_RESET_CRIT:
            // ContextSwitching REENABLED
            gOS_FLAGS.g_tskCriticalExecution = (uint8_t) 0x0u;
            break;

        case SVC_SEM_TAKE:    // TAKE/GIVE Semaphor
            if ( sem_TakeSem(
                    (TskTCB* const ) svc_args[1], (const SemNr) svc_args[0],
                    (const SysTicks) svc_args[2] )
                 != RET_OK )
            {
                return RET_NOK;
            }
            os_SCHEDULE();
            break;
        case SVC_SEM_GIVE:
            if ( sem_GiveSem(
                    (TskTCB* const ) svc_args[1], (const SemNr) svc_args[0] )
                 != RET_OK )
            {
                return RET_NOK;
            }
            os_SCHEDULE();
            break;
        case SVC_EVT_SEND:
            if ( evt_SendEvt( (EvtNr) svc_args[0] ) != RET_OK )
                return RET_NOK;
            os_SCHEDULE();
            break;
        case SVC_EVT_RECV:
            if ( evt_WaitForEvts(
                    (PTskTCB const) svc_args[0], (EVTQSlots) svc_args[1],
                    (const SysTicks) svc_args[2] )
                 != RET_OK )
            {
                return RET_NOK;
            }

            os_SCHEDULE();
            break;
        case SVC_TMR_SET:    // SET A TIMER
            if ( tmr_setTskTimer(
                    (TskTCB* const ) svc_args[1], (const WaitTime) svc_args[0] )
                 != RET_OK )
            {
                return RET_NOK;
            }
            os_SCHEDULE();
            break;
        case SVC_SYSTCK_SET:
            if ( sysTck_setSysTckTMR( (const SysTicks) svc_args[0], (SysTckEleType)SysTckObj_TskWait,
                    (TskID const ) svc_args[1] )
                 != RET_OK )
            {
                return RET_NOK;
            }
            os_SCHEDULE();
            break;
        case SVC_MSGQ_CRT_Q:
            if ( msgQ_initQueue( (QID) svc_args[0]/*, (QPrio) svc_args[1] */) != RET_OK )
            {
                return RET_NOK;
            }
            break;
        case SVC_MSGQ_DEL_Q:
            if ( msgQ_delQueue( (QID) svc_args[0] ) != RET_OK )
            {
                return RET_NOK;
            }
            break;
        case SVC_MSGQ_REG_PUB:
            if ( msgQ_regTskPub(
                    (TskTCB * const ) svc_args[0], (QID) svc_args[1] )
                 != RET_OK )
            {
                return RET_NOK;
            }
            break;
        case SVC_MSGQ_REG_TSK_SUB:
            if ( msgQ_regTskSub(
                    (PTskTCB const) svc_args[0], (const QID) svc_args[1] )
                 != RET_OK )
            {
                return RET_NOK;
            }
            break;
        case SVC_MSGQ_REG_SYS_SUB:
            if ( msgQ_regSysSub(
                    (const SysFktID) svc_args[0], (const QID) svc_args[1] )
                 != RET_OK )
            {
                return RET_NOK;
            }
            break;
        case SVC_MSGQ_MSG_PUB:
            if ( msgQ_pubDataToQ(
                    (const QID) svc_args[0], (const uint8_t) svc_args[1],
                    (const DataType) svc_args[2], (CData const) svc_args[3] )
                 != RET_OK )
            {
                return RET_NOK;
            }
            break;
        case SVC_MSGQ_MSG_READ:
            if ( ( msgQ_readDataFrmQ(
                    (const QID) svc_args[0], (const TskID) svc_args[1],
                    ( (PMQData *) svc_args[2] ) ) )
                 != RET_OK )
            {
                return RET_NOK;
            }
            break;
        case SVC_MSGQ_MSG_READALLNEW:
            break;
        case SVC_MSGQ_MSG_READALL:
            break;
        case SVC_MSGQ_MSG_TAKE:
            if ( ( msgQ_takeDataFrmQ(
                    (const QID) svc_args[0], (const TskID) svc_args[1],
                    ( (PMQData *) svc_args[2] ) ) )
                 != RET_OK )
            {
                return RET_NOK;
            }
            break;
            break;
        case SVC_MSGQ_MSG_TAKEALLNEW:
            break;
        case SVC_MSGQ_MSG_TAKEALL:
            break;
        case SVC_OS_SCHEDULE:    // CALL os_SCHEDULE from tasks
            os_SCHEDULE();
            break;
        case SVC_CALL_FKT_PRIV:
            ( *( (FktCall) svc_args[0] ) )();
            break;
        case SVC_LP_ENTER:    // LP MODE ENTER
#ifdef __LP__MODE__
#ifdef _PITUSED_
        DISABLE_PIT()
        ;
#endif
        // check for the shortest timer (TPMChannel[5:0] or SysTick)
        uint16_t nxtSysTick =
        (uint16_t) ( ( (uint64_t) ( (uint64_t) 1000u
                                * (uint64_t) SysTick->VAL )
                        / (uint64_t) SystemCoreClock ) );
        SysTick->CTRL &= ~SysTick_CTRL_ENABLE_Msk;
#ifdef _TPMUSED_
        __disableTPMTimers();
        timeToWake = findShortesTPM();
        timeToWake = ( timeToWake > nxtSysTick ) ? nxtSysTick : timeToWake;
#else
        timeToWake = nxtSysTick;
#endif
        if ( timeToWake > 20 )
        {
            __init_LPTMR();
            setLPTMR( (uint16_t) ( timeToWake - (uint16_t) 10 ) );
#ifndef __LP__DEBUG__
            NVIC_SetPriority( SVCall_IRQn, (uint32_t) 0x3u );    // LOWER SVCall priority, hence LLWU ISR CAN Execute before switching back to SVCall ISR
            NVIC_EnableIRQ( LLWU_IRQn );
            NVIC_SetPriority( LLWU_IRQn, (uint32_t) 0x0u );
            SET_PIN_LOW( PIN_LED0 );// DEBUG --- TIME MEASUREMENT
            enter_lls();
            updateTimersAfterSleep();
            SET_PIN_HIGH( PIN_LED0 );// DEBUG
            NVIC_SetPriority( SVCall_IRQn, 0x0u );
#else
            installIrq(
                    &updateTimersAfterSleep, LPTMR0_IRQ_INDEX,
                    (uint8_t) 0x0u );
            //NVIC_SetPriority( SVCall_IRQn, 0x1u );    // LOWER SVCall priority, hence LLWU ISR CAN Execute before switching back to SVCall ISR
            SET_PIN_LOW( PIN_LED1 );// DEBUG --- TIME MEASUREMENT
//                while ( !gOS_FLAGS.gLPExit )
//                {
//                    __asm("nop");
//                }
//                gOS_FLAGS.gLPExit = 0x0u;
//                NVIC_DisableIRQ( LPTMR0_IRQn );
            //NVIC_SetPriority(SVCall_IRQn, 0x0u);
#endif
        }
        else
        {
            ENABLE_PIT()
            ;
            __enableTPMTimers();
            SysTick->CTRL |= SysTick_CTRL_ENABLE_Msk;
        }
#endif
            break;
        case SVC_TRC_OUPUT:    // writeToConsole
            break;
        default:
            __NOP();
    }
    return RET_OK;
}

#ifdef _TIMERUSED_
#ifdef __LP__MODE__
void updateTimersAfterSleep( void )
{
#ifdef _PITUSED_
    //update PIT timer
    ENABLE_PIT()
    ;
    resetPIT(
            (uint32_t) ( ~( READ_PIT() + (uint32_t) ( timeToWake - (uint16_t) 10 ) ) ) );
    WAIT_MS( 1u );
#endif
#ifdef _TPMUSED_
    // update TPM timer
    __enableTPMTimers();
    if ( gTMRFlags.g_TPM1TimerInitialized )
    correctTPMChannel(
            (uint8_t) 0x1u,
            (uint16_t) ( (uint16_t) ( timeToWake - (uint16_t) 9 ) ) );
    if ( gTMRFlags.g_TPM0TimerInitialized )
    correctTPMChannel(
            (uint8_t) 0x0u,
            (uint16_t) ( (uint16_t) ( timeToWake - (uint16_t) 9 ) ) );
#endif
    SysTick_Config(
            SysTick->VAL - (uint32_t) ( (uint64_t) ( (uint64_t) SystemCoreClock
                            * (uint64_t) ( timeToWake - (uint16_t) 10u ) )
                    / (uint64_t) 1000u ) );
    gOS_FLAGS.gLPExit = 0x1u;
}
#endif
#endif
