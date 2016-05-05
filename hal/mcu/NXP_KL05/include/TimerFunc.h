/**
 * \file    TimerFunc.h
 * \author  Christian Neuberger (NeubergerCh50344@th-nuernberg.de)
 * \date    12.10.2015
 *
 */

#ifndef HEADERS_TIMERFUNC_H_
#define HEADERS_TIMERFUNC_H_

//*********************************************************************************************
// includes
//*********************************************************************************************

#include <stdint.h>

//*********************************************************************************************
// includes //
//*********************************************************************************************

//*********************************************************************************************
// defines
//*********************************************************************************************
typedef struct timerFlags
{
    volatile uint8_t g_calibrationOngoing:1;
    volatile uint8_t g_LMPTRtimerInitialized:1;    // MAKE SURE TIMER IS INITIALIZED BEFORE A TIME FUNCTION IS USED
    volatile uint8_t g_PITtimerInitialized :1;    // MAKE SURE TIMER IS INITIALIZED BEFORE A TIME FUNCTION IS USED
    volatile uint8_t g_TPM0TimerInitialized :1;    // MAKE SURE TIMER IS INITIALIZED BEFORE A TIME FUNCTION IS USED
    volatile uint8_t g_TPM1TimerInitialized :1;// MAKE SURE TIMER IS INITIALIZED BEFORE A TIME FUNCTION IS USED
}TimerFlags;
//*********************************************************************************************
// defines //
//*********************************************************************************************

//*********************************************************************************************
// enums
//*********************************************************************************************

//*********************************************************************************************
// enums //
//*********************************************************************************************

void __initTMRFlags( void );

#define READ_PIT()                                (uint32_t)(~( PIT_BASE_PTR->CHANNEL[1].CVAL ))
#define IS_WAIT_EXPIRED(start, msToWait)        (uint8_t)(( READ_PIT() - ((uint32_t)(start)) ) > ( (uint32_t)(msToWait)))
#define IS_WAIT_STILL_ACTIVE(start, msToWait)   (uint8_t)(( READ_PIT() - ((uint32_t)(start)) ) < ( (uint32_t)(msToWait)))
#define WAIT_MS(msToWait) \
    do {\
        uint32_t dummyStartTime = READ_PIT(); \
    while( IS_WAIT_STILL_ACTIVE( dummyStartTime, msToWait ) ){__NOP();}\
    }while((uint8_t)0x0u)

#define DISABLE_PIT() PIT_BASE_PTR->MCR = PIT_MCR_MDIS(0x1u) | PIT_MCR_FRZ( 0x1u ); /* disable pit module; stop in debug mode*/

#define ENABLE_PIT()  PIT_BASE_PTR->MCR = PIT_MCR_MDIS(0x0u) | PIT_MCR_FRZ( 0x1u ); /* enable pit module; stop in debug mode*/

/*
 ** ===================================================================
 *   Method      :  __init_PIT
 *
 *   Parameters: none
 *
 *   Return value: none
 *
 *   Description :
 *       Initialize the Periodical Interrupt Timer
 ** ===================================================================
 */
void __init_PIT( void );

/*
 ** ===================================================================
 *   Method      :  resetPIT
 *
 *   Parameters:
 *      uint32_t    currentPITVal
 *
 *   Return value: none
 *
 *   Description :
 *       Reinitialize the periodical interrupt timer with the given value
 ** ===================================================================
 */
void resetPIT( uint32_t currentPITVal );


void calibratePITWithTPM( uint8_t calibrationCycles );

void startPITCalibrationWithTPM( void );

void endPITCalibrationWithTPM( void );

void enablePITInterrupt( void );

void disablePITInterrupt( void );

void pitIntHandler( void );

/*
 ** ===================================================================
 *   Method      :  readPIT
 *
 *   Parameters: none
 *
 *   Return value:
 *   	Current value of the PIT
 *
 *   Description :
 *       Read the current value of the PIT and return it
 ** ===================================================================
 */
uint32_t readPIT( void );

/*
 ** ===================================================================
 *   Method      :  wait_ms
 *
 *   Parameters:
 *		ms   milliseconds to wait
 *
 *   Return value: none
 *
 *   Description :
 *       Wait for the duration of the specified milliseconds
 ** ===================================================================
 */
void wait_ms( const uint32_t ms );

void calibratePIT( uint8_t calibrationCycles );

void startPITCalibration( void );

void endPITCalibration( void );

/*
 ** ===================================================================
 *   Method      :  __init_LPTMR
 *
 *   Parameters: none
 *
 *   Return value: none
 *
 *   Description :
 *       Initialize the Low Power Timer
 ** ===================================================================
 */
void __init_LPTMR( void );

void setLPTMR( const uint16_t timerVal );

#define WRITE_TO_LPTMR_CNR      (LPTMR0_BASE_PTR->CNR = (uint32_t)0x1u;)  // A WRITE TO LPTMR_CNR DOES NOT ALTER ITS VALUE; USED FOR SYNCHRONIZATION ONLY!
#define READ_LPTMR_CNR          ((uint16_t)LPTMR0_BASE_PTR->CNR)  // WRITE TO LPTMR_CNR BEFORE READING TO SYNCHRONIZE!

uint16_t readLPTMR( void );

void lptmrIntHandler( void );

void wait_ms_LP( uint16_t ms );

void calibrateLPTMR( uint8_t calibrationCycles );

void startLPTMRCalibration( void );

void endLPTMRCalibration( void );

/*
 ** ===================================================================
 *   Method      :  __init_RTC
 *
 *   Parameters: none
 *
 *   Return value: none
 *
 *   Description :
 *       Initialize the Real Time Clock
 ** ===================================================================
 */
void __init_RTC( void );

void rtcIntHandler( void );

void enableRTCInterrupt( void );

void disableRTCInterrupt( void );

#define READ_RTC        ((uint32_t)RTC_BASE_PTR->TSR)   // Current value of the RTC

uint32_t readRTC( void );

void setRTC( uint32_t tSec );

#define TPM0_CHANNELS (uint8_t)0x6u
#define TPM1_CHANNELS (uint8_t)0x2u

#define UPDATE_TPM_CH(tpm,ch,newTime)\
    do\
    {\
        __init_TPMChannel((uint8_t)tpm,(uint8_t)ch,(uint16_t)newTime);\
        startTPMChannel((uint8_t)tpm,(uint8_t)ch);\
    }while((uint8_t)0x0u)

void __init_TPM( const uint8_t timer );

void __init_TPMChannel(
        const uint8_t timer,
        const uint8_t channelNr,
        const uint16_t timeInMs );

void startTPMChannel( const uint8_t timer, const uint8_t channelNr );

void stopTPMChannel( const uint8_t timer, const uint8_t channelNr );

void re_setTPMTimer( const uint8_t timer, const uint8_t channelNr );

uint16_t getTPMCHRemTime( const uint8_t timer, const uint8_t channelNr );
void correctTPMChannel(
        const uint8_t timer,
        const uint16_t chCorr );

void __disableTPMTimers( void );

void __enableTPMTimers( void );

uint16_t findShortesTPM( void );

#endif /* HEADERS_TIMERFUNC_H_ */
