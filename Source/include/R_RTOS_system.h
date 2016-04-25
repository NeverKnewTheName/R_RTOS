/**
 * \file    R_RTOS_system.h
 * \author  Christian Neuberger (NeubergerCh50344@th-nuernberg.de)
 * \date    12.01.2016
 *
 * \brief Functions for system functionality (system maintenance).
 */

#ifndef HEADERS_R_RTOS_SYSTEM_H_
#define HEADERS_R_RTOS_SYSTEM_H_

#include "R_RTOS_inc.h"

/** RetCode __initOS( void );
 *  \brief Initialize the operating system.
 *
 *  \return         RetCode    Return the success of the operation
 *
 *  initializes all needed HW and SW components for the operating system to function properly.
 */
RetCode __initOS( void );

/** \fn void tskIdle( void );
 *  \brief IDLE Task, that must always be ready to run and must not finish execution.
 *
 *  The IDLE Task must always be available to be chosen by the scheduler.
 *  If no other task is ready to run the IDLE Task will be scheduled and switched to.
 *  System maintenance and activating low power modes might be done in this task.
 */
void tskIdle( void );

/** \fn void tsk_EndTheTask( void );
 *  \brief Default function to be jumped to after a task finished its execution.
 *
 *  Simply an endless loop.
 */
void tsk_EndTheTask( void );

/** \fn RetCode SVC_HandlerMain( uint32_t *svc_args );
 *  \brief Is called by the SVC Exception.
 *
 *  \param [in]     svc_args   Pointer to the function arguments passed alongside the SVC Call
 *  \return         RetCode    Return the success of the operation
 *
 *  According to the svcCode used to call the SVC exception various functions are executed further on.
 *  The function parameters are extracted from the stack frame.
 */
RetCode SVC_HandlerMain( uint32_t *svc_args );

/** \fn void updateTimersAfterSleep( void );
 *  \brief Updates all used timers after a wake up.
 *
 *  Every HW timer in use is updated/adjusted according to the time spent in the low power mode.
 */
void updateTimersAfterSleep( void );


#endif /* HEADERS_R_RTOS_SYSTEM_H_ */
