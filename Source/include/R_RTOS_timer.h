/**
 * \file    R_RTOS_timer.h
 * \author  Christian Neuberger (NeubergerCh50344@th-nuernberg.de)
 * \date    16.12.2015
 *
 * \brief Functions for creating, initializing, maintaining and handling a task timers.
 */

#ifndef HEADERS_R_RTOS_TIMER_H_
#define HEADERS_R_RTOS_TIMER_H_

#include "R_RTOS_inc.h"

#define MEM_OBJECTS_TMR (uint8_t)0x5u

#define TMR_INVALID_TIME (LifeTime)0xFFFFFFFFu

/** \def TMR_PIT_DELAY
 *  \brief  Delay compensation between PIT and TPM timers.
 *  \return Delay value
 *
 *  Since the PIT and TPM timers are driven by different clock sources (BusClock for PIT; OSCERCLK for TPM) they might suffer from a desynchronization.
 *  In order to overcome this issue, a small delay is allowed.
 *
 */
#define TMR_PIT_DELAY (uint32_t)0x3u // 3ms delay


/** \fn RetCode tmr_INIT( void );
 *  \brief Calibrate the PIT Timer periodically.
 *
 *  Since the PIT timer is clocked by the Bus clock whereas the TPM module has various clock sources the two timers drift away from each other.
 *  To compensate this behavior the PIT timer is calibrated in intervals according to a TPM timer.
 *
 */
RetCode tmr_INIT( void );

/** \fn RetCode tmr_setTskTimer( TskTCB* tsk, WaitTime ms );
 *  \brief Sets up a Timer for a task and queues it into the Timer queue according to its WaitTime relative to the current PIT value.
 *
 *  \param [in]     tsk                 Pointer to the task's TskTcb
 *  \param [in]     ms                  Period of time to wait in ms.
 *  \return         RetCode             Return the success of the operation
 *
 *  Sets up a Timer for the given task and queues the Timer into the Timer queue.
 *  The Timer, which expires the earliest is always the start of the list.
 *  Might adjust the startTMRNode.
 *
 */
RetCode tmr_setTskTimer( PTskTCB tsk, TmrTime msToWait );

RetCode tmr_setSysTimer( SysFktID fktID, TmrTime msToWait, uint8_t periodicity );

void tmr_SysTimerElapsed( void );

/** \fn void tmr_TskTimerElapsed( void );
 *  \brief Function to be called as soon as a Timer expires.
 *
 *  Adjusts the TskEvtFlags and sets the task ready (if it is not waiting on any other event).
 *  Also maintains the Timer queue and automatically scans for more Timers to be expired.
 *  Resets the timer which triggers the next Timer.
 *
 *  Triggers the scheduler!
 *
 */
void tmr_TskTimerElapsed( void );

/** \fn RetCode tmr_GiveUpOnTMR( TskTCB *tsk );
 *  \brief Forces the deletion of a task's Timer from the Timer queue and adjusts the queue accordingly.
 *
 *  \param [in]     tsk                 Pointer to the task's TskTcb
 *  \return         RetCode             Return the success of the operation
 *
 *  If a task is destroyed, which still has a Timer,
 *  this Timer needs to be deleted from the queue and the timer might need to be adjusted accordingly.
 *
 *  Triggers the scheduler!
 *
 */
RetCode tmr_GiveUpOnTMR( PTskTCB const tsk );

// /** \fn RetCode tmr_InsertNodeWthPrio( Timer **strtNode, Timer **newTmrLstNode );
// *  \brief Inserts a task's Timer into the Timer queue according to its expiration time.
// *
// *  \param [in]     strtNode            Pointer to the Pointer to the current start of the Timer queue
// *  \param [in]     newTmrLstNode       Pointer to the Pointer to the Timer to be inserted into the Timer queue
// *  \return         RetCode             Return the success of the operation
// *
// *  Search the Timer queue for the place to fit the new Timer into.
// *  Might adjust the startTMRNode.
// *
// */
//RetCode tmr_InsertTmrWithExpiration( Timer *tmr, uint8_t id );

// /** \fn RetCode tmr_DeleteNode( Timer **strtNode, TskTCB *nodeToDelete );
// *  \brief Delete a Timer from the Timer queue.
// *
// *  \param [in]     strtNode            Pointer to the Pointer to the current start of the Timer queue
// *  \param [in]     nodeToDelete        Pointer to the Timer to be deleted from the Timer queue
// *  \return         RetCode             Return the success of the operation
// *
// *  Delete the given Timer from the Timer queue.
// *  Might adjust the startTMRNode.
// *
// */
//RetCode tmr_DeleteNode( Timer *tmr, PTskTCB tskToDelete );


/* DEPRECATED
RetCode tmr_CorrectTimerInLst( Timer ** strtNode);
*/

#endif /* HEADERS_R_RTOS_TIMER_H_ */
