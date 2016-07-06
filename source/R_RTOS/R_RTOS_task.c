/**
 * \file    R_RTOS_task.c
 * \author  Christian Neuberger (NeubergerCh50344@th-nuernberg.de)
 * \date    23.11.2015
 *
 * \addtogroup TskMngmnt
 * \{
 *
 */

#include "R_RTOS_scheduler.h"
#include "R_RTOS_task.h"
#include "R_RTOS_stack.h"
#include "R_RTOS_sem.h"
#include "R_RTOS_timer.h"
#include "R_RTOS_events.h"

#include "R_RTOS_memMngr.h"


extern void os_SCHEDULE( void );

extern BitsOSFlags gOS_FLAGS;
extern TskTCB *p_cur_tsk_tcb;

TskTCB tsk_AR[NR_OF_TSKS];
uint8_t IDLE_TSK_STCK[IDLE_TSK_STACK_SIZE];

static void BREAK( void )
{
    while ( 1 )
    {
        ;
    }
}

/** \var pIDLETsk
 *  \brief Constant pointer to the IDLE Task's tskTCB.
 *
 *  Since the IDLE Task is not allocated dynamically its location in the memory will not change during runtime.
 *  This Pointer is used to always reference the IDLE Task and thus the start of the list containing all tasks in the System.
 *
 *  Initialized to the address of the IDLE Task's tskTCB.
 *
 */
PTskTCB const pIDLETsk = &( tsk_AR[0] );    // Array of task TCBs; contains at least the IDLE-TASK

/*
 * Initialize all tasks to a default state
 * Set task state to TSK_STATE_UNINIT_UNINIT
 * Set default task priority to TSK_PRIO_MED
 */
RetCode tsk_initTsks( void )
{
    TskID tskCntr = NR_OF_TSKS;
    while ( tskCntr-- )
    {
        // set TaskID
        tsk_AR[tskCntr].tskID = tskCntr;
        // set information about the task
        tsk_AR[tskCntr].tskState = TSK_STATE_UNINIT_UNINIT;
        tsk_AR[tskCntr].tskPrio.visibleTskPrio = TSK_PRIO_MED;    // DEFAULT PRIORITY
        tsk_AR[tskCntr].tskPrio.actualTskPrio = TSK_PRIO_MED;    // DEFAULT PRIORITY
        // init stack struct
        tsk_AR[tskCntr].pStckPtr = (StackPtrT) NULL;
        tsk_AR[tskCntr].pStckTop = (StackPtrT) NULL;
        tsk_AR[tskCntr].stckSze = (StackSize) 0x0u;
        // set addresses of task functions
        tsk_AR[tskCntr].pTskStrt = (TskStartAddr) NULL;
        tsk_AR[tskCntr].pTskEnd = (TskEndAddr) NULL;
        // init mailbox
        tsk_AR[tskCntr].tskMailBox = (PTskMB) NULL;
        // init events
        tsk_AR[tskCntr].tskSync = (PSyncEle) NULL;
        // init list elements
        tsk_AR[tskCntr].nxtTsk = TSK_ID_NO_TSK;
        tsk_AR[tskCntr].prvTsk = TSK_ID_NO_TSK;
    }
    return RET_OK;
}

RetCode tsk_tskInit(
                     const TskID tskID,
                     const TskStartAddr const strtAddr,
                     const TskEndAddr const endAddr,
                     const StackSize stkSze )
{
    // Task id not in range // Separate function to initialize IDLE task
    if ( ( tskID >= NR_OF_TSKS ) || ( tskID == (TskID) 0x0u ) )
        return RET_NOK;

    PTskTCB tsk = &tsk_AR[tskID];

    // if the task is already active... restart the task
    if ( !TSK_STATE_IS_UNINIT( tsk ) )
    {
        tsk_tskDestroy( tsk );
    }

    tsk->tskState = TSK_STATE_WAITING;
    tsk->pTskStrt = strtAddr;
    tsk->pTskEnd = endAddr;
    tsk->tskMailBox = (PTskMB) NULL;
    tsk->tskSync = (PSyncEle) NULL;
    // initialize stack for the task
    if ( stk_StackCreate( tsk, stkSze ) == RET_OK )
    {
        // initialize stack for the task
        if ( stk_StackInit( tsk, NULL ) == RET_NOK )
        {
            BREAK();
            return RET_MEM_ALLOC_FAIL_STACK;
        }
    }
    else
    {
        BREAK();
        return RET_MEM_ALLOC_FAIL_STACK;
    }

    return RET_OK;
}


RetCode os_IDLETskInit( const TskStartAddr const strtAddr )
{
    pIDLETsk->pStckPtr = (volatile StackPtrT) ( (uint32_t) IDLE_TSK_STCK
            + (uint32_t) IDLE_TSK_STACK_SIZE );
    pIDLETsk->pStckTop = (StackPtrT) pIDLETsk->pStckPtr;
    pIDLETsk->stckSze = IDLE_TSK_STACK_SIZE;

    pIDLETsk->tskPrio.visibleTskPrio = TSK_PRIO_IDLE;    // set TaskPriority
    pIDLETsk->tskPrio.actualTskPrio = TSK_PRIO_IDLE;    // set TaskPriority
    pIDLETsk->tskState = TSK_STATE_ACTIVE_READY;    // set TaskState --- per default a Task is waiting after its creation
    pIDLETsk->pTskStrt = strtAddr;
    pIDLETsk->pTskEnd = strtAddr;
    pIDLETsk->nxtTsk = TSK_ID_NO_TSK;
    pIDLETsk->prvTsk = TSK_ID_NO_TSK;

    if ( stk_StackInit( pIDLETsk, NULL ) == RET_NOK )    // initialize stack for the task
    {
        return RET_MEM_ALLOC_FAIL_STACK;
    }
    return RET_OK;
}

RetCode tsk_tskDestroy( TskTCB * const tsk )
{
    if ( TSK_STATE_IS_UNINIT_UNINIT( tsk ) )
    {
        BREAK();
        return RET_NOK;
    }

    if ( TSK_STATE_IS_WAITING( tsk ) )
    {
        if ( TSK_STATE_IS_WAITING_EVT( tsk ) )
        {
            evt_GiveUpOnEvts( tsk );
        }
        //ToDO
//        else if ( TSK_STATE_IS_WAITING_SEM( tsk ) )
//        {
//            sem_GiveUpOnSem( tsk );
//        }
#ifdef _TPMUSED_
        else if ( TSK_STATE_IS_WAITING_TMR( tsk ) )
        {
            tmr_GiveUpOnTMR( tsk );
        }
#endif
    }

    if ( TSK_STATE_IS_ACTIVE( tsk ) )
    {
        tsk_SetInactive( tsk, TSK_STATE_UNINIT_UNINIT );
    }

    if ( stk_StackDestroy( tsk ) != RET_OK )
    {
        return RET_NOK;
    }

    if ( (uint32_t) tsk == (uint32_t) p_cur_tsk_tcb )
    {
        p_cur_tsk_tcb = (TskTCB*) NULL;
        tsk->tskState = TSK_STATE_UNINIT_UNINIT;
    }

    return RET_OK;
}

//DEPRECATED
RetCode tsk_ClrEvt( PTskTCB const tsk, PSyncEle const syncEle )
{
    if ( (uint32_t) tsk == (uint32_t) NULL )
        return RET_NOK;

    if ( tsk->tskState != ( TSK_STATE_WAITING_SYNC | syncEle->syncEleType ) )
        return RET_NOK;

    tsk->tskState = TSK_STATE_ACTIVE_SUSPENDED;
    return tsk_insrtTskActvTskLst( tsk );
}

//DEPRECATED
RetCode tsk_SetEvt( PTskTCB const tsk, PSyncEle const syncEle )
{
    return tsk_SetInactive( tsk, TSK_STATE_WAITING_SYNC | syncEle->syncEleType );
}

RetCode tsk_SetInactive( PTskTCB const tsk, TskState tskInactvState )
{
    if ( (uint32_t) tsk == (uint32_t) NULL )
        return RET_NOK;
    // Check if task is active
    if ( !( TSK_STATE_IS_ACTIVE( tsk ) ) )
        return RET_NOK;

    tsk->tskState = tskInactvState;
    // delete task from active task list
    return tsk_rmvTskActvTskLst( tsk );
}

RetCode tsk_ActvTsk( PTskTCB const tsk )
{
    if ( (uint32_t) tsk == (uint32_t) NULL )
        return RET_NOK;
    // a Task can only be activated, when it is in a waiting state (hence not active, no error nor uninitialized)
    if ( !( TSK_STATE_IS_WAITING( tsk ) ) )
        return RET_NOK;

    // Task has to be in a waiting state
    if ( tsk->tskState == TSK_STATE_WAITING )    // If the task is not waiting on an event it was not suspended, thus it is now active_ready
        tsk->tskState = TSK_STATE_ACTIVE_READY;
    else
        // Task was running before and put to waiting state by an event, thus it is now active_suspended
        tsk->tskState = TSK_STATE_ACTIVE_SUSPENDED;

    return tsk_insrtTskActvTskLst( tsk );
}

RetCode tsk_ChngePrio( PTskTCB const tsk, const TskPrio newTskPrio )
{
    if ( (uint32_t) tsk == (uint32_t) NULL )
        return RET_NOK;

    if ( tsk->tskPrio.visibleTskPrio == newTskPrio )
        return RET_NOK;

    if ( TSK_STATE_IS_ACTIVE( tsk ) )
    {
        //remove from list
        tsk_rmvTskActvTskLst( tsk );    // deleting the task from the list will reset its nxtTsk and prvTsk
        tsk->tskPrio.visibleTskPrio = newTskPrio;
        tsk_insrtTskActvTskLst( tsk );
        return RET_OK;
    }
    else if ( TSK_STATE_IS_WAITING( tsk ) )
    {
        tsk->tskPrio.visibleTskPrio = newTskPrio;
        return RET_OK;
    }
    return RET_NOK;
}
/**
 * \}
 */
