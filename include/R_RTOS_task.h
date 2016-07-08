/**
 * \file    R_RTOS_task.h
 * \author  Christian Neuberger (NeubergerCh50344@th-nuernberg.de)
 * \date    23.11.2015
 *
 * \addtogroup TskMngmnt Task Management
 * \{
 * \addtogroup tsk Tasks
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
 *  \param [in]     tskID       \ref TskID of the task to be created
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
 *  \param [in]     tsk         Pointer to the \ref TskTCB of the task to be destroyed
 *  \return         RetCode     Return the success of the operation
 *
 *  Release all resources used by the task and delete it from the queue.
 *
 *  This does not trigger the scheduler!
 */
RetCode tsk_tskDestroy( PTskTCB const tsk );


/**
 * \fn RetCode tsk_SetEvt( PTskTCB const tsk, PSyncEle const syncEle)
 * \brief Set the event described by syncEle for the specified task
 *
 * \param[in] tsk Pointer to the \ref TskTCB to set the event for
 * \param[in] syncEle Pointer to the \ref SyncEle set up for the event
 *
 * \return RetCode
 * \returns RET_OK
 * \returns RET_NOK
 *
 * \pre Task must be active and in the active task list.
 * \post Task is set inactive and taken out of the active task list.
 */
RetCode tsk_SetEvt( PTskTCB const tsk, PSyncEle const syncEle );

/**
 * \fn RetCode tsk_ClrEvt( PTskTCB const tsk, PSyncEle const syncEle )
 * \brief Clear the event that currently blocks the task
 *
 * \param[in] tsk Pointer to the \ref TskTCB to clear the event for
 * \param[in] syncEle Pointer to the \ref SyncEle set up for the event
 *
 * \return RetCode
 * \returns RET_OK
 * \returns RET_NOK
 *
 * \pre Task must be inactive and blocked by the event specified by syncEle.
 * \post Task is put into the active task list.
 */
RetCode tsk_ClrEvt( PTskTCB const tsk, PSyncEle const syncEle );

/**
 * \fn RetCode tsk_SetInactive( PTskTCB const tsk, TskState tskInactvState)
 * \brief Set the specified task inactive, remove from active wait queue and set the specified new task state.
 *
 * \param[in] tsk Pointer to the \ref TskTCB to set inactive
 * \param[in] tskInactvState State to set the task to
 *
 * \return RetCode
 * \returns RET_OK
 * \returns RET_NOK
 */
RetCode tsk_SetInactive( PTskTCB const tsk, TskState tskInactvState );

/** \fn RetCode tsk_ActvTsk( TskTCB * const tsk );
 *  \brief Retrieve the task with the highest priority, which is ready to run, from the queue.
 *
 *  \param [in]     tsk         Pointer to the \ref TskTCB of the task to be activated and thus inserted into the active task queue.
 *  \return         RetCode     Return the success of the operation
 *
 *  Insert the provided task into the task queue according to its priority setting and adjust the task queue.
 *  If task(s) with the same priority already exist in the queue, the new task will be appended.
 *
 */
RetCode tsk_ActvTsk( PTskTCB const tsk );

/**
 * \fn RetCode tsk_ChngePrio( PTskTCB const tsk, const TskPrio newTskPrio )
 * \brief
 *
 * \param[in] tsk Pointer to the \ref TskTCB of the task to change the priority of
 * \param[in] newTskPrio \ref TskPrio to set the task to
 *
 * \return RetCode
 * \returns RET_OK
 * \returns RET_NOK
 *
 */
RetCode tsk_ChngePrio( PTskTCB const tsk, const TskPrio newTskPrio );
/**
 * \}
 * \}
 */
#endif /* HEADERS_R_RTOS_TASK_H_ */
