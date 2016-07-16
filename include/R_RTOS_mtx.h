/**
 *  \file    R_RTOS_mtx.h
 *  \author  Christian Neuberger (NeubergerCh50344@th-nuernberg.de)
 *  \date    14.05.2016
 *  \addtogroup sync Synchronization
 *  \brief Synchronization mechanisms
 *  \{
 *  \addtogroup mtx Mutex
 *  \brief Functions for creating, initializing, maintaining Mutexes.
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
 *  <h2>Mutexes</h2>
 *  Mutexes are a synchronization mechanism for mutual exclusion. As soon as a consumer accesses the mutex and therefore the
 *  protected data, it is granted ownership of the mutex, if the mutex is still available. In case of the mutex being already
 *  owned by another consumer, the current consumer is denied access and put into a wait queue until the currently owning consumer
 *  gives the mutex back to the system. The next consumer in the waiting queue is now granted access and therefore it receives
 *  ownership of the mutex.
 *
 *
 *  <h2>Difference Mutex and Binary Semaphore</h2>
 *  Since a Binary Semaphore only depends on signaling, it can be signaled from anywhere, whereas a mutex can only be released by the task that occupies it.
 *  \{
 */

#ifndef INCLUDE_R_RTOS_MTX_H_
#define INCLUDE_R_RTOS_MTX_H_

#include "R_RTOS_inc.h"

/** \fn RetCode mtx_InitMtxs( void );
 *  \brief Initialize the mutex functionality.
 *
 *  \return                      Return the success of the operation
 *  \retval RET_OK  Success!
 *  \warning Mutexes need to be initialized before usage! Usually this takes place during initialization of the OS.
 *
 */
RetCode mtx_InitMtxs( void );

/** \fn RetCode mtx_TakeMtx( PTskTCB const tsk, const MtxNr mtxNr, const SysTicks maxSysTicksToWait );
 *  \brief Attempts to take the mutex with the given number for the specified task.
 *
 *  \param [in]     tsk                 Pointer to the task's TskTcb
 *  \param [in]     mtxNr               Number of the mutex to be taken
 *  \param [in]     maxSysTicksToWait   Maximum number of SysTicks to wait until the task is unblocked.
 *  \return         Return the success of the operation
 *
 *  If the mutex is not yet taken/occupied, the task requesting this mutex is now occupying the mutex.
 *  The execution of the task is continued.
 *
 *  If the mutex is already taken/occupied when the task tries to take it, the task is queued into the mutex queue.
 *  If its priority is higher than the task occupying the mutex's priority, the task occupying the mutex's priority is adjusted.
 *  => priority inheritance.
 *
 *  The mechanism ensures that no lower priority task, whose priority is still higher than the task's occupying the mutex priority,
 *  is executed as long as the high priority task is waiting on the mutex.
 *  Further tasks trying to take the mutex are queued into the mutex list according to their priority.
 */
RetCode mtx_TakeMtx(
                     PTskTCB const tsk,
                     const MtxNr mtxNr,
                     const SysTicks maxSysTicksToWait );

/** \fn RetCode mtx_GiveMtx( PTskTCB const tsk, const MtxNr mtxNr );
 *  \brief Releases the mutex with the given number.
 *
 *  \param [in]     tsk                 Pointer to the task's TskTcb
 *  \param [in]     mtxNr               Number of the mutex to be released
 *  \return                      Return the success of the operation
 *
 *  The original priority of the task is restored.
 *  The next task in the mutex queue (if any) is given ownership the mutex and set to the suspended task state.
 *  The mutex queue is adjusted automatically.
 */
RetCode mtx_GiveMtx( PTskTCB const tsk, const MtxNr mtxNr );

/**
 * \fn RetCode mtx_GiveUpOnMtx( PTskTCB const tsk )
 * \brief Give up on waiting for the mutex blocking the specified task.
 *
 * \param[in] tsk Task that gives up on the mutex its waiting on
 * \return RetCode
 * \retval RET_OK Success
 * \retval RET_NOK Failure
 */
RetCode mtx_GiveUpOnMtx( PTskTCB const tsk );

//DEPRECATED
//RetCode mtx_DeleteTskMtxFromQ( PTskTCB const tsk );

/**
 * \}
 * \}
 */
#endif /* INCLUDE_R_RTOS_MTX_H_ */
