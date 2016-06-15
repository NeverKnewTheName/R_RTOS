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

/** \fn RetCode sem_InitSems( void );
 *  \brief Initialize the semaphore functionality.
 *
 *  \return                      Return the success of the operation
 *
 *  \warning Semaphores need to be initialized before usage! Usually this takes place during initialization of the OS.
 *
 */
RetCode sem_InitSems( void );

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
