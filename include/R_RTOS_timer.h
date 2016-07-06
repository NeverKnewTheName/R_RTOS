/**
 * \file    R_RTOS_timer.h
 * \author  Christian Neuberger (NeubergerCh50344@th-nuernberg.de)
 * \date    16.12.2015
 * \addtogroup Timer
 * \{
 * \addtogroup StackedSoftwareTimer
 * \brief Functions for creating, initializing, maintaining and handling a task timers.
 * \{
 */

#ifndef HEADERS_R_RTOS_TIMER_H_
#define HEADERS_R_RTOS_TIMER_H_

#include "R_RTOS_inc.h"

/**
 * \def MEM_OBJECTS_TMR
 * \brief Number of \ref SyncEle that can be allocated by the Timer mechanism
 */
#define MEM_OBJECTS_TMR (uint8_t)0x4u

/**
 * \def TMR_INVALID_TIME
 * \brief Value for an invalid LifeTime
 */
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

/** \fn RetCode tmr_setTskTimer( PTskTCB tsk, TmrTime msToWait )
 *  \brief Sets up a Timer for a task and queues it into the Timer queue according to its WaitTime relative to the current PIT value.
 *
 *  \param [in]     tsk                 Pointer to the task's TskTcb
 *  \param [in]     msToWait            Period of time to wait in ms.
 *
 *  \return         RetCode             Return the success of the operation
 *
 *  Sets up a Timer for the given task and queues the Timer into the Timer queue.
 *  The Timer, which expires the earliest is always the start of the list.
 *  Might adjust the startTMRNode.
 *
 */
RetCode tmr_setTskTimer( PTskTCB tsk, TmrTime msToWait );

/**
 * \fn RetCode tmr_setSysTimer( SysFktID fktID, TmrTime msToWait, uint8_t periodicity )
 * \brief Sets up a Timer to call a SysFkt corresponding to the given SysFktID as soon as the timer expires
 *
 * \param[in] fktID         SysFktID of the function to call upon expiration
 * \param[in] msToWait      Period of time to wait in ms
 * \param[in] periodicity   Periodicity of the timer (if set to 1 the timer will reset itself)
 *
 * \return RetCode
 * \returns RET_OK
 * \returns RET_NOK
 */
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

/**
 * \}
 * \}
 */
#endif /* HEADERS_R_RTOS_TIMER_H_ */
