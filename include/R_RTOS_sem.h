/**
 * \file    R_RTOS_sem.h
 * \author  Christian Neuberger (NeubergerCh50344@th-nuernberg.de)
 * \date    15.12.2015
 * \addtogroup sync
 * \{
 * \addtogroup sem Semaphore
 * \{
 * \brief Functions for creating, initializing, maintaining and handling Semaphores.
 *
 *  <h2>Priority Inheritance</h2>
 *  When access to a specific resource is requested, but cannot be granted, the requesting consumer is put into a wait queue.
 *  These wait queues are sorted according to the priority of their entities. Therefore a waiting high priority task will be granted
 *  access to the resource before a waiting low priority task receives the resource. But if the resource is taken by a lower priority
 *  task and a high priority task requests access, the resource remains at the lower priority task. Therefore the high priority task
 *  is put into a waiting queue and its execution is suspended. If the lower priority task occupying the resource is suspended, because
 *  e.g. a medium priority task is activated, this medium priority task would receive processor time before the high priority task, that
 *  is currently waiting on the resource. This is called <i>Priority Inversion</i>.<br>
 *  To avoid that a lower priority task is executed before a high priority task <i>Priority Inheritance</i> is introduced. If a lower priority
 *  priority task is occupying a resource while a high priority task requests access to said resource the lower priority task inherits the priority
 *  of the high priority task for the duration of the access to the protected resource. Hence a medium priority task cannot preempt the actually
 *  lower priority task while it is occupying the resource and the high priority task is waiting for this resource.
 *
 *
 *  <h2>Semaphores</h2>
 *  Semaphores are a signaling mechanism to allow multiple access to a protected resource.
 *  A consumer does not get ownership of the semaphore. If a consumer is granted access the semaphore counter is decremented.
 *  When the consumer is done with accessing the protected resource the semaphore is then incremented again.
 *  As soon as the counter reaches 0 no more accesses to the protected resource will be granted. All incoming consumers
 *  are put into a wait queue and must wait for the counter to increment again and therefore for another consumer, who
 *  was previously granted access to the resource, to release the resource and hence increment the semaphore counter.
 *
 *  <h3>Counting Semaphores</h3>
 *  Counting semaphores contain a counter which can be set to a specific value are incremented variably and decremented by one.
 *  This is used to limit access to a resource to the counter value.
 *
 *  <h3>Binary Semaphores</h3>
 *  Contrary to counting semaphores, binary semaphores can only take the values 0 or 1 (taken or free). Much like mutexes they can be used
 *  for mutual exclusion, but unlike mutexes the consumer, which is granted access, does not receive the ownership of the semaphore.
 *
 *  <h2>Difference Mutex and Binary Semaphore</h2>
 *  Since a Binary Semaphore only depends on signaling, it can be signaled from anywhere, whereas a mutex can only be released by the task that occupies it.
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

#define SEM_GET_REF_BYTE_NR(tskID) (uint8_t)(((tskID) >> (uint8_t)3u ))

/** \fn RetCode sem_InitSems( void );
 *  \brief Initialize the semaphore functionality.
 *
 *  \return RetCode Success of the operation
 *
 *  \warning Semaphores need to be initialized before usage! Usually this takes place during initialization of the OS.
 *
 */
RetCode sem_InitSems( void );

/**
 * \fn RetCode sem_initBinSem( const SemNr semNr )
 * \brief Initialize the Semaphore corresponding to the given number as a Binary Semaphore
 *
 * \param[in] semNr Number of the Semaphore to initialize
 *
 * \return RetCode
 * \returns RET_OK
 * \returns RET_NOK
 */
RetCode sem_initBinSem( const SemNr semNr );

/**
 * \fn RetCode sem_initCntSem( const SemNr semNr, const SemCntr ressourceCntr )
 * \brief Initialize the Semaphore corresponding to the given number as a counting Semaphore
 *
 * \param[in] semNr Number of the Semaphore to initialize
 * \param[in] ressourceCntr Number of ressources to initialize the Semaphore's counter with
 *
 * \return RetCode
 * \returns RET_OK
 * \returns RET_NOK
 */
RetCode sem_initCntSem( const SemNr semNr, const SemCntr ressourceCntr );

/**
 * \fn RetCode sem_wait(const SemNr semNr, PTskTCB const tsk, const SysTicks maxSysTicksToWait)
 * \brief Request access to the resource guarded by the Semaphore corresponding to the given number
 *
 * \param[in] semNr Number of the Semaphore
 * \param[in] tsk Task for which the request is made
 * \param[in] maxSysTicksToWait Maximum time in \ref SysTicks the Task will be blocked
 *
 * \return RetCode
 * \returns RET_OK
 * \returns RET_NOK
 */
RetCode sem_wait(const SemNr semNr, PTskTCB const tsk, const SysTicks maxSysTicksToWait);

/**
 * \fn RetCode sem_Tsksignal( const SemNr semNr, PTskTCB const tsk )
 * \brief Signal the Semaphore from Task context. See \ref sem_signal
 *
 * \param[in] semNr Number of the Semaphore
 * \param[in] tsk Task which signals the Semaphore
 *
 * \return RetCode
 * \returns RET_OK
 * \returns RET_NOK
 *
 * \note Tasks should use this function to signal a Semaphore!
 * \note Can be called for binary as well as counting Semaphores
 * \warning The specified Task has to have made a wait request to the specified Semaphore beforehand!
 *
 */
RetCode sem_Tsksignal( const SemNr semNr, PTskTCB const tsk );

/**
 * \fn RetCode sem_signal(const SemNr semNr)
 * \brief Signal the Semaphore to make its resources available again
 *
 * \param[in] semNr Number of the Semaphore
 *
 * \return RetCode
 * \returns RET_OK
 * \returns RET_NOK
 *
 * Calling this function increments the Semaphore's resource counter.
 *
 * \note Tasks should use \ref sem_Tsksignal!
 * \note Can be called for binary as well as counting Semaphores
 */
RetCode sem_signal(const SemNr semNr);

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
/**
 * \}
 * \}
 */

#endif /* HEADERS_R_RTOS_SEM_H_ */
