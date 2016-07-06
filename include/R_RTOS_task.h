/**
 * \file    R_RTOS_task.h
 * \author  Christian Neuberger (NeubergerCh50344@th-nuernberg.de)
 * \date    23.11.2015
 *
 * \addtogroup TskMngmnt Task Management
 * \{
 * \brief Functions for creating, maintaining and handling tasks.
 *
 */

#ifndef HEADERS_R_RTOS_TASK_H_
#define HEADERS_R_RTOS_TASK_H_

#include "R_RTOS_inc.h"

RetCode tsk_initTsks( void );

/** \fn RetCode tsk_tskInit( const TskID tskID, const TskStartAddr const strtAddr, const TskEndAddr const endAddr, const StackSize stkSze );
 *  \brief Creates a task according to the provided input parameters.
 *
 *  \param [in]     tskID       ID of the task to be created
 *  \param [in]     strtAddr    Address of the task's function
 *  \param [in]     endAddr     Optional address of a function to which the task shall return to after its execution (provide NULL for default behavior)
 *  \param [in]     stkSze      desired size of the task's stack
 *  \return         RetCode     Return the success of the operation
 *
 *  Creates a task by allocating space for its tskTCB and filling it with the provided and computed informations.
 *  Also allocates the stack for the task.
 *
 *  \note Task is not activated yet!
 */
RetCode tsk_tskInit(
                     const TskID tskID,
                     const TskStartAddr const strtAddr,
                     const TskEndAddr const endAddr,
                     const StackSize stkSze );

/** \fn RetCode os_IDLETskInit( const TskStartAddr const strtAddr );
 *  \brief Creates the IDLE Task
 *
 *  \param [in]     strtAddr    Address of the IDLE Task's function
 *  \return         RetCode     Return the success of the operation
 *
 *  Create the IDLE Task and provide its tskTCB with information.
 *
 */
RetCode os_IDLETskInit( const TskStartAddr const strtAddr );

//RetCode tsk_setInactvTskPrio( const TskID tskID, const TskPrio tskPrio );

/** \fn RetCode tsk_tskDestroy( TskTCB * tsk );
 *  \brief Destroy the given task.
 *
 *  \param [in]     tsk         Pointer to the tskTCB of the task to be destroyed
 *  \return         RetCode     Return the success of the operation
 *
 *  Release all resources used by the task and delete it from the queue.
 *
 *  This does not trigger the scheduler!
 */
RetCode tsk_tskDestroy( PTskTCB const tsk );

/** \fn RetCode tsk_GetNxtActvTsk( TskTCB **readyNode );
 *  \brief Retrieve the task with the highest priority, which is ready to run, from the queue.
 *
 *  \param [in]     readyNode   Pointer to a pointer to a tskTCB, which shall contain the ready node (usually p_nxt_tsk_tcb)
 *  \return         RetCode     Return the success of the operation
 *
 *  Search through the task queue for the task with the highest priority, which is ready to run. Return the IDLE Task if no task matching the criteria is found.
 *
 *  \post readyNode contains the ready task with the highest priority.
 */
//RetCode tsk_GetNxtActvTsk( TskTCB **readyNode );
//RetCode tsk_SetEvt( TskTCB * const tsk, TskEvtNr evtNr );
RetCode tsk_SetEvt( PTskTCB const tsk, PSyncEle const syncEle );
RetCode tsk_ClrEvt( PTskTCB const tsk, PSyncEle const syncEle );

RetCode tsk_SetInactive( PTskTCB const tsk, TskState tskInactvState );

/** \fn RetCode tsk_ActvTsk( TskTCB * const tsk );
 *  \brief Retrieve the task with the highest priority, which is ready to run, from the queue.
 *
 *  \param [in]     tsk         Pointer to the tskTCB of the task to be activated and thus inserted into the active task queue.
 *  \return         RetCode     Return the success of the operation
 *
 *  Insert the provided task into the task queue according to its priority setting and adjust the task queue.
 *  If task(s) with the same priority already exist in the queue, the new task will be appended.
 *
 */
RetCode tsk_ActvTsk( PTskTCB const tsk );

RetCode tsk_ChngePrio( PTskTCB const tsk, const TskPrio newTskPrio );
/**
 * \}
 */
#endif /* HEADERS_R_RTOS_TASK_H_ */
