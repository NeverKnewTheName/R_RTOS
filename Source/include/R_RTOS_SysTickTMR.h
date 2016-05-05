/**
 * \file    R_RTOS_SysTickTMR.h
 * \author  Christian Neuberger (NeubergerCh50344@th-nuernberg.de)
 * \date    06.04.2016
 *
 * \brief System Tick Timer handling and system time maintenance.
 */


#ifndef HEADERS_R_RTOS_SYSTICKTMR_H_
#define HEADERS_R_RTOS_SYSTICKTMR_H_

#include "R_RTOS_inc.h"

#define MEM_OBJECTS_SysTckTMR (uint8_t)0x10u

/** \fn void SysTick_Handler( void );
 *  \brief Service routine for SysTick events.
 *
 *  The SysTick timer of the Cortex-M0+ is used as the system tick timer.
 *  Thus the SysTick_Handler has to call the scheduler.
 */

void SysTick_Handler( void );

/** \fn RetCode sysTck_INIT( void );
 *  \brief Initialize the system tick timer.
 *
 * \return Returns the success of the operation.
 *
 * \warning The system tick timer has to be initialized prior to its usage.
 */
RetCode sysTck_INIT( void );

/** \fn RetCode sysTck_setSysTckTMR( const SysTicks sysTcksToWait, const SysTckEleType eleType, const uint8_t eleID );
 *  \brief Set a system tick timer for an object specified by eleType and eleID.
 *
 * \param [in] sysTcksToWait  Time until the timer expires in SysTicks
 * \param [in] eleType          Type of the Element requesting the SysTickTMR
 * \param [in] eleID            ID of the ELement requesting the SysTickTMR
 *
 * \return Returns the success of the operation.
 */
RetCode sysTck_setSysTckTMR(
                             const SysTicks sysTcksToWait,
                             const SysTckEleType eleType,
                             const uint8_t eleID );

/** \fn SysTime sysTck_getSysTicks( void );
 *  \brief Retrieve the currently passed global SysTicks since the timer was started.
 *
 * \return Returns the SysTicks counted since the system was set up.
 */
SysTime sysTck_getSysTicks( void );

/** \fn SysTime sysTck_resetSysTicks( void );
 *  \brief Reset the SysTick counter to zero
 * @return The reset number of passed SysTicks
 *
 * \warning USE WITH CAUTION!
 */
SysTime sysTck_resetSysTicks( void );

/** \fn SysTime sysTck_GetTimeSlice( void );
 *  \brief Retrieve the current system tick time slice.
 * \return Returns the current user set TimeSlice for the system tick timer.
 */
SysTime sysTck_GetTimeSlice( void );

/** \fn SysTime sysTck_SetTimeSlice( const SysTime newTimeSlice );
 *  \brief Set a new system tick time slice.
 *
 *  \param [in] newTimeSlice The new time slice value to set for the system tick timer
 * \return Returns the newly set time slice for the system tick timer
 */
SysTime sysTck_SetTimeSlice( const SysTime newTimeSlice );

#endif /* HEADERS_R_RTOS_SYSTICKTMR_H_ */
