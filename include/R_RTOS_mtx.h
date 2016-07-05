/**
 *  \file    R_RTOS_mtx.h
 *  \author  Christian Neuberger (NeubergerCh50344@th-nuernberg.de)
 *  \date    14.05.2016
 *
 *  \addtogroup Mutex
 *  \brief Functions for creating, initializing, maintaining Mutexes.
 *
 *  \{
 */

#ifndef INCLUDE_R_RTOS_MTX_H_
#define INCLUDE_R_RTOS_MTX_H_

#define MEM_OBJECTS_MTX (uint8_t)0x4u

#define AMOUNT_OF_MTXS (uint8_t)0x2u

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
 */
#endif /* INCLUDE_R_RTOS_MTX_H_ */
