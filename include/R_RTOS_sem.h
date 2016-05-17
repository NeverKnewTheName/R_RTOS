/**
 * \file    R_RTOS_sem.h
 * \author  Christian Neuberger (NeubergerCh50344@th-nuernberg.de)
 * \date    15.12.2015
 *
 * \brief Functions for creating, initializing, maintaining and handling Semaphores.
 */

#ifndef HEADERS_R_RTOS_SEM_H_
#define HEADERS_R_RTOS_SEM_H_

#include "R_RTOS_inc.h"

/** \def MEM_OBJECTS_SEM
 *  \brief Number of objects for the semaphore memory pool
 *
 *  \note User defined
 */
#define MEM_OBJECTS_SEM (uint8_t)0x4u
#define MEM_OBJECTS_MTX (uint8_t)0x4u

#define AMOUNT_OF_MTXS (uint8_t)0x4u

/** \fn RetCode sem_InitSems( void );
 *  \brief Initialize the semaphore functionality.
 *
 *  \return                      Return the success of the operation
 *
 *  \warning Semaphores need to be initialized before usage! Usually this takes place during initialization of the OS.
 *
 */
RetCode sem_InitSems( void );

/** \fn RetCode sem_TakeSem( PTskTCB const tsk, const SemNr semNr, const SysTicks maxSysTicksToWait );
 *  \brief Attempts to take the semaphore with the given number for the specified task.
 *
 *  \param [in]     tsk                 Pointer to the task's TskTcb
 *  \param [in]     semNr               Number of the semaphore to be taken
 *  \param [in]     maxSysTicksToWait   Maximum number of SysTicks to wait until the task is unblocked.
 *  \return                      Return the success of the operation
 *
 *  If the semaphore is not yet taken, the task requesting this semaphore is now occupying the semaphore.
 *  The execution of the task is continued.
 *
 *  If the semaphore is already taken when the task tries to take it, the task is queued into the semaphore queue.
 *  If its priority is higher than the task's occupying the semaphore priority, the task's occupying the semaphore priority is adjusted.
 *  => priority inheritance.
 *
 *  The mechanism ensures that no lower priority task, whose priority is still higher than the task's occupying the semaphore priority,
 *  is executed as long as the high priority task is waiting on the semaphore.
 *  Further tasks trying to take the semaphore are queued into the semaphore list according to their priority.
 */
RetCode sem_TakeSem(
                     PTskTCB const tsk,
                     const SemNr semNr,
                     const SysTicks maxSysTicksToWait );

/** \fn RetCode sem_GiveSem( PTskTCB const tsk, SemNr semNr );
 *  \brief Releases the semaphore with the given number.
 *
 *  \param [in]     tsk                 Pointer to the task's TskTcb
 *  \param [in]     semNr               Number of the semaphore to be released
 *  \return                      Return the success of the operation
 *
 *  The original priority of the task is restored.
 *  The next task in the semaphore queue (if any) is given the semaphore and set to the suspended task state.
 *  The semaphore queue is adjusted automatically.
 */
RetCode sem_GiveSem( PTskTCB const tsk, const SemNr semNr );

/** \fn RetCode sem_GiveUpOnSem( TskTCB * tsk );
 *  \brief Forces a giving back of all semaphores the specified task has taken (not necessarily occupied).
 *
 *  \param [in]     tsk                 Pointer to the task's TskTcb
 *  \return                      Return the success of the operation
 *
 *  If a task gets destroyed but still has one ore more semaphores or is waiting on one or more semaphores, these semaphores need to be given back.
 *  If the task is not currently the task occupying any of the semaphores it is simply deleted from the semaphore queue.
 */
RetCode sem_GiveUpOnSem( PTskTCB const tsk );

/** \fn RetCode sem_DeleteTskSemQ( PTskTCB const tsk );
 *  \brief Delete a SemLst entry from the semaphore queue.
 *
 *  \param [in]     tsk          Task to be deleted from the semaphore's queue it is currently queued into
 *  \return                      Return the success of the operation
 *
 */
RetCode sem_DeleteTskSemQ( PTskTCB const tsk );

#endif /* HEADERS_R_RTOS_SEM_H_ */
