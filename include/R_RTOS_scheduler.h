/**
 * \file    R_RTOS_scheduler.h
 * \author  Christian Neuberger (NeubergerCh50344@th-nuernberg.de)
 * \date    26.11.2015
 *
 * \brief Scheduler and related functions.
 */

#ifndef HEADERS_R_RTOS_SCHEDULER_H_
#define HEADERS_R_RTOS_SCHEDULER_H_

#include "R_RTOS_inc.h"

/** \struct tskPrioArEle
 *  \brief Task priority element for the second dimension of the scheduler.
 */
/** \typedef TskPrioArEle
 *  \brief tskPrioArEle
 */
/** \typedef PTskPrioArEle
 *  \brief Pointer to a tskPrioArEle
 */
typedef struct tskPrioArEle
{
    TskID fstTsk; //!< TskID of the first task in the priority container
    TskID lstTsk; //!< TskID of the last task in the priority container
} TskPrioArEle, *PTskPrioArEle;

/** \typedef PrioARFlgs
 *  \brief Used for priority array flags.
 */
typedef uint16_t PrioARFlgs;

/** \fn RetCode tsk_rmvTskActvTskLst( PTskTCB const tsk );
 *  \brief Delete a Task from the active task list.
 *
 *  \param [in] tsk Task to delete from the active task list
 *  \return Return the success of the operation
 */
RetCode tsk_rmvTskActvTskLst( PTskTCB const tsk );

/** \fn RetCode tsk_insrtTskActvTskLst( PTskTCB const tsk );
 *  \brief Insert a task into the active task list.
 *
 *  \param [in] tsk Task to insert into the active task list
 *  \return Return the success of the operation
 *
 *  \pre The task has to be ready to be run when queued into the active task list.
 *  \warning The task must not already be in the active task list.
 *  \note The active task list is always started by the IDLE task as the root node. THIS MUST NOT CHANGE.
 */
RetCode tsk_insrtTskActvTskLst( PTskTCB const tsk );

/** \fn void os_INIT_Scheduler( void );
 *  \brief Initialize the Scheduler mechanism.
 *
 *  \warning MUST BE CALLED BEFORE THE SCHEDULER CAN BE USED!
 */
void os_INIT_Scheduler( void );

/** \fn void os_SCHEDULE( void );
 *  \brief Schedules the next ready task according to its priority.
 *
 *  The task queue is scanned until a task ready to run is found. The queue is sorted according to the tasks' priority beforehand.
 *  \post   p_nxt_tsk_tcb     A pointer to the chosen task's tskTCB is stored to this global variable.
 *  \post   If the next task does not equal the current task a context switch is initiated by setting PendSV to pending
 *
 */
void os_SCHEDULE( void );

#endif /* HEADERS_R_RTOS_SCHEDULER_H_ */
