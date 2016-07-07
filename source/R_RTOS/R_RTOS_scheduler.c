/**
 * \file    R_RTOS_scheduler.c
 * \author  Christian Neuberger (NeubergerCh50344@th-nuernberg.de)
 * \date    23.11.2015
 *
 * \addtogroup sched
 * \{
 *
 */

#include "MKL05Z4.h"

#include "R_RTOS_inc.h"
#include "R_RTOS_scheduler.h"
#include "R_RTOS_task.h"

#include "R_RTOS_BitMagic.h"


extern PTskTCB pIDLETsk;    // address of IDLE Tsk -> also the start node of the XORed linked list!
extern uint8_t numTsks;
extern TskTCB tsk_AR[NR_OF_TSKS];

/** \var p_cur_tsk_tcb
 *  \brief Pointer to currently running task's tskTCB.
 *
 *  To keep track of the currently running task this pointer stores it.
 *  Is set to NULL when the currently running task is ended/killed,
 *  which is then acknowledged by the context switch (No saving of the current task's context).
 *
 *  Initialized to NULL
 *
 */
volatile PTskTCB p_cur_tsk_tcb = NULL;
extern volatile PTskTCB p_cur_tsk_tcb;

/** \var p_nxt_tsk_tcb
 *  \brief Pointer to task's tskTCB, which is scheduled to run next.
 *
 *  The scheduler sets this pointer to the task which is to be run after the context switch.
 *  The context switch automatically assigns its value to p_cur_tst_tcb once the context is switched.
 *
 *  Initialized to NULL
 *
 */
volatile PTskTCB p_nxt_tsk_tcb = NULL;
extern volatile PTskTCB p_nxt_tsk_tcb;
/** \var gOS_FLAGS
 *  \brief Flags used for maintaining the OS.
 *
 *  Contains various flags for the operation of the OS.
 *
 *  might be obsolete
 *
 */
volatile BitsOSFlags gOS_FLAGS;

// keep track of the priorities of the tasks in the task active list
static volatile PrioARFlgs prioSlots = 0x0u;

// sorted array of containers for lists of active tasks with equal priorities
static TskPrioArEle ar_TskActvPrioSorted[TSK_PRIO_LEVELS_NR ];

static void BREAK( void )
{
    while ( 1 )
    {
        ;
    }
}

static RetCode tsk_GetNxtActvTsk( PTskTCB *readyNode )
{

    *readyNode = &tsk_AR[pIDLETsk->nxtTsk];

    return RET_OK;
}

RetCode tsk_rmvTskActvTskLst( PTskTCB const tsk )
{
    // priority of the task to delete
    TskPrio tskPrio = tsk->tskPrio.visibleTskPrio;
    // task id of the task to delete
    TskID tskID = tsk->tskID;
//     priority helper
//    TskPrio prioHelper;

    // priority container the task's priority corresponds to
    TskPrioArEle *curPrioArElmnt = &ar_TskActvPrioSorted[tskPrio];

    if ( curPrioArElmnt->fstTsk == tskID )
    {
        /*
         * The current task is the first element of the corresponding priority container list
         *
         * Its previous task therefore has reside in the next higher priority container.
         */
        if ( tsk_AR[tsk->nxtTsk].tskPrio.visibleTskPrio != tskPrio )
        {
            /*
             * The next task does not belong to this priority container.
             * Therefore invalidate the fstTsk property of the priority container.
             */
            curPrioArElmnt->fstTsk = TSK_ID_NO_TSK;

            /*
             *  This also implies that the lstTsk is invalid,
             *  since the task should have pointed to at least the end of the list.
             */
            curPrioArElmnt->lstTsk = TSK_ID_NO_TSK;

            /*
             * The priority container is empty.
             * Unset its corresponding bit in prioSlots.
             */
            prioSlots &= (PrioARFlgs) ( ~( (PrioARFlgs) 0x1u << tskPrio ) );
        }
        else
        {
            /*
             * The next task belongs to this priority container.
             * Therefore set the fstTsk to the nxtTsk of the task.
             */
            curPrioArElmnt->fstTsk = tsk->nxtTsk;
        }

    }
    else if ( curPrioArElmnt->lstTsk == tskID )
    {
        /*
         * The current task is the last element of the corresponding priority container
         *
         * The task being the first element of the priority container has already been examined to be false,
         * therefore there has to be a previous task which belongs to the priority container since the prvTsk
         * has to at least be the fstTsk of the priority container.
         * fstTsk and lstTsk being the same has also already been examined to be negative.
         */
        curPrioArElmnt->lstTsk = tsk->prvTsk;
    }

    /*
     * Adjust next task's previous task if there is a next task
     */
    tsk_AR[tsk->nxtTsk].prvTsk = tsk->prvTsk;
    /*
     * Since the IDLE Task is always present there is always a previous task
     */
    tsk_AR[tsk->prvTsk].nxtTsk = tsk->nxtTsk;

    // invalidate task by resetting its nxtTsk and prvTsk pointer
    tsk->nxtTsk = TSK_ID_NO_TSK;
    tsk->prvTsk = TSK_ID_NO_TSK;

    return RET_OK;
}

RetCode tsk_insrtTskActvTskLst( PTskTCB const tsk )
{
    // temporary task storage
    PTskTCB tmpTsk;
    // priority of the task to insert
    TskPrio tskPrio = tsk->tskPrio.visibleTskPrio;
    // pointer to temporary priority container initialized to
    // priority container corresponding to the task's priority
    PTskPrioArEle tmpPrioArElmnt = &ar_TskActvPrioSorted[tskPrio];
    // task id of the task to insert
    TskID tskID = tsk->tskID;
    // bitmask with one bit set at the position corresponding to the task's priority
    PrioARFlgs curPrioPos = (PrioARFlgs) ( (PrioARFlgs) 0x1u << tskPrio );
    // multipurpose helper variable
    PrioARFlgs bitFiddlyPrioSlotHelper;

    /*
     * The retrieved priority container can never be the priority container
     * for IDLE priority, because the IDLE task must neither be inserted nor deleted
     * from the active task list.
     * Therefore comparing the fstTsk id to TSK_ID_NO_TSK is a legitimate way
     * of examining whether the container is currently empty or already
     * holds a list of active tasks of variable length yet unequal zero.
     *
     * Additionally if there is a fstTsk there must be a lstTsk.
     * Examining the lstTsk property is therefore not necessary.
     * This functionality could be added for improved fail safety though.
     */
    if ( tmpPrioArElmnt->fstTsk != TSK_ID_NO_TSK )
    {
        /*
         * The container already contains a list of active tasks.
         * Hence the new task will be appended to the end of the list
         * inheriting the nxtTsk property of the current end of the list.
         *
         * The nxtTsk property of the task compromising the end of a
         * priority container list hints at the first task of the
         * priority container with the next lower priority.
         */
        // Retrieve task at the current end of the priority container list
        tmpTsk = &tsk_AR[tmpPrioArElmnt->lstTsk];
        // set current task prvTsk to current end of the list
        tsk->prvTsk = tmpTsk->tskID;
        // set next task to former next task of the former end of the list
        tsk->nxtTsk = tmpTsk->nxtTsk;
        tsk_AR[tsk->nxtTsk].prvTsk = tskID;
        // former end of the list next task is now the current task
        tmpTsk->nxtTsk = tskID;
        // finally adjust the current end of the priority container list
        tmpPrioArElmnt->lstTsk = tskID;
    }
    else
    {
        /*
         * The container corresponding to the task's priority is currently empty.
         * The task will therefore be the fstTsk and lstTsk.
         * Additionally the id of the last task in the next higher priority container
         * as well as the id of the first task of the next lower priority container
         * have to be queried.
         *
         * The task's nxtTsk will be the id of the next lower priority container's fstTsk.
         * The task's prvTsk will be the id of the next higher priority container's lstTsk.
         *
         * Additionally the next lower priority container's fstTsk's nxtTsk has to be adjusted
         * to the current task id.
         * The next higher priority container's lstTsk's nxtTsk has to be adjusted
         * to the current task id.
         *
         */
        // set fstTsk of priority container to current task's id
        tmpPrioArElmnt->fstTsk = tskID;
        // set lstTsk of priority container to current task's id
        tmpPrioArElmnt->lstTsk = tskID;

        /*
         * Compute next higher priority to retrieve the previous priority container
         * Fit current priority container between next higher priority and its next lower priority container
         */
        /*
         * Bit fiddly goodness
         * Create a mask with all bits set above the bit corresponding to the current priority
         * Further on apply an AND operation to the current prioSlots and the created mask to check whether there are higher bits set, or not.
         *
         * If the result is FALSE, there is no current task with higher priority in the ready task queue.
         *
         * If the result is TRUE, there is a task with higher priority in the queue.
         * Thus the task with next higher priority to the current task has to be determined.
         * to do so we take the prioSlots AND current priority mask and apply the ISOLATE method on the result.
         * the bit corresponding to the next higher task will remain set, whereas the rest will be cleared.
         *
         * bitFiddlyPrioSlotHelper is a temporary variable holding the temporary result of each
         * bit fiddling operation.
         */
        /*
         * Create a mask with all bits set above the current bit set
         */
        bitFiddlyPrioSlotHelper = (PrioARFlgs) ( curPrioPos | -curPrioPos );
        /*
         * Apply AND operation on the current prioSlots with the generated mask
         * this will mask out every bit set in prioSlots
         * with corresponding priority lower than (or equal) to the current priority.
         */
        bitFiddlyPrioSlotHelper = prioSlots & bitFiddlyPrioSlotHelper;
        /*
         * All bits corresponding to lower priority are now masked out
         * leaving only bits set corresponding to higher priority.
         * Since the IDLE Task has the highest possible priority (IDLE PRIORITY)
         * this bit will remain set in all cases.
         * Thus at least the idle priority container can be retrieved
         * calculating the position of remaining rightmost bit set.
         */

        /*
         * Extract task with next higher priority
         * To achieve this, mask out all bits except for the rightmost bit set.
         * This bit corresponds to the next higher priority (at least IDLE priority).
         * Retrieve the bit position to get the corresponding priority.
         */
        // mask out all bits except the rightmost set bit
        bitFiddlyPrioSlotHelper = (PrioARFlgs) ( bitFiddlyPrioSlotHelper
                & -bitFiddlyPrioSlotHelper );
        // compute the priority from the bit set in prioSlots
        TskPrio nxtHghrPrio = bitM_bitPos( bitFiddlyPrioSlotHelper );
        // get corresponding TskPrioArEle to the next higher priority
        tmpPrioArElmnt = &ar_TskActvPrioSorted[nxtHghrPrio];
        tsk->nxtTsk = tsk_AR[tmpPrioArElmnt->lstTsk].nxtTsk;    // SAFE, BECAUSE AT LEAST IDLE TASK
        tsk_AR[tsk->nxtTsk].prvTsk = tskID;
        tsk_AR[tmpPrioArElmnt->lstTsk].nxtTsk = tskID;
        tsk->prvTsk = tmpPrioArElmnt->lstTsk;

        // adjust prioSlots to include bit corresponding to the new priority container
        prioSlots |= curPrioPos;
    }
    //os_SCHEDULE();
    return RET_OK;
}

void os_INIT_Scheduler( void )
{
    uint8_t cntr = TSK_PRIO_LEVELS_NR;
    while ( cntr-- )
    {
        ar_TskActvPrioSorted[cntr].fstTsk = TSK_ID_NO_TSK;
        ar_TskActvPrioSorted[cntr].lstTsk = TSK_ID_NO_TSK;
    }
    prioSlots = 0x1u << 0xFu;    // IDLE TASK WILL ALWAYS BE THERE
}

void os_SCHEDULE( void )
{
    if ( gOS_FLAGS.g_tskCriticalExecution )    // One task is in a critical part of its execution which has to be concurrend... do not kill it
    {
        return;
    }

    //if ( gOS_FLAGS.g_needsScheduling == (uint8_t) 0x1u )    // scheduling needed according to interrupt nesting level?
    {
        if ( ( (uint32_t) p_cur_tsk_tcb != (uint32_t) NULL ) && ( p_cur_tsk_tcb->tskState
                == TSK_STATE_ACTIVE_RUNNING ) )
        {
            p_cur_tsk_tcb->tskState = TSK_STATE_ACTIVE_SUSPENDED;
        }

        tsk_GetNxtActvTsk( (PTskTCB *) &p_nxt_tsk_tcb );
        if ( !TSK_STATE_IS_ACTIVE( p_nxt_tsk_tcb ) )
        {
            BREAK();
        }
        //p_nxt_tsk_tcb->tskState = TSK_STATE_ACTIVE_RUNNING;    // set to running, because it will be scheduled next task anyway.

        // check if there is a current task or if it was already deleted; then check if the next task is also the current task
        if ( /*( p_cur_tsk_tcb == (TskTCB *) NULL ) || */( p_nxt_tsk_tcb
                != p_cur_tsk_tcb ) )
        {
            gOS_FLAGS.g_DispatchFlag = (uint8_t) ( OS_DISPATCH_NEEDED & 0x3u );
            SCB->ICSR |= SCB_ICSR_PENDSVSET_Msk;    // do it by hand
        }
    }
    gOS_FLAGS.g_needsScheduling = 0x0u;    // reset scheduling flag
}

/**
 * \}
 */
