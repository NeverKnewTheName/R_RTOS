/**
 * \file    R_RTOS_stack.h
 * \author  Christian Neuberger (NeubergerCh50344@th-nuernberg.de)
 * \date    26.11.2015
 *
 * \brief Functions for creating, initializing, maintaining and handling a task's stack.
 */

#ifndef HEADERS_R_RTOS_STACK_H_
#define HEADERS_R_RTOS_STACK_H_

#include "R_RTOS_inc.h"

/** \fn RetCode stk_StackCreate( register PTskTCB tsk, register StackSize desiredStackSize );
 *  \brief Creates a stack for a task with the size of desiredStackSize.
 *
 *  \param [in]     tsk            Pointer to the task's TskTCB
 *  \param [in]     desiredStackSize    Size of the stack to be created
 *  \return                      Return the success of the operation
 *
 *  Allocates memory and creates the stack for the task and sets all pointers for stack management in the TskTCB.
 *
 */
RetCode stk_StackCreate(
                         register PTskTCB tsk,
                         register StackSize desiredStackSize );

/** \fn RetCode stk_StackInit( register PTskTCB tsk, void *fktParam );
 *  \brief Initializes the initial stack frame according to the given input parameters.
 *
 *  \param [in]     tsk             Pointer to the task's TskTCB, which contains all needed parameters
 *  \param [in]     fktParam            Pointer to the input parameter that shall be passed to the task ( NULL means no input parameter )
 *  \return                      Return the success of the operation
 *
 *  Builds the initial stack frame needed for switching the context to the task's beginning according to the provided input parameters.
 *  Adjusts the task's stack pointer accordingly.
 *
 */
RetCode stk_StackInit( register PTskTCB tsk, void *fktParam );

/** \fn RetCode stk_StackDestroy( register PTskTCB tsk );
 *  \brief Destroys the stack of the task indicated by the tsk input parameter.
 *
 *  \param [in]     tsk            Pointer to the task's TskTCB whose stack shall be destroyed
 *  \return                    Return the success of the operation
 *
 *  Destroys the given stack and frees all resources.
 *  //ToDO Also checks for stack overflow and underflow.
 */
RetCode stk_StackDestroy( register PTskTCB tsk );

/**
 * \fn RetCode stk_TSTStck( PTskTCB const tsk );
 *  \brief fill the task's stack with a distinctive pattern.
 *  @param tsk Pointer to the task's TskTCB whose stack shall be marked.
 *  @return Returns the success of the operation.
 */
RetCode stk_TSTStck( PTskTCB const tsk );

/** \fn RetCode stk_StackClear( PTskTCB const tsk );
 *  \brief Clears the provided task's stack.
 *
 *  //ToDO IMPLEMENT FUNCTION
 *
 *  \param [in]     tsk                Pointer to the task's TskTCB
 *  \return                     Return the success of the operation
 *
 *  Sets all stack elements to zero regardless of the current stack pointer's position.
 */
RetCode stk_StackClear( PTskTCB const tsk );

#endif /* HEADERS_R_RTOS_STACK_H_ */
