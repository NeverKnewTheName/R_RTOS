/**
 * \file    TimerFunc.c
 * \author  Christian Neuberger (NeubergerCh50344@th-nuernberg.de)
 * \date    12.10.2015
 *
 */

#ifdef _TIMERUSED_
#include "MKL05Z4.h"

#include "TimerFunc.h"
#include "InterruptFunc.h"
#include "PortFunc.h"
#include "ClockFunc.h"

#ifdef _RTCUSED_
static volatile uint32_t g_RTCtimestamp = (uint32_t)0;
static void (*foo)( void ) = NULL;
#endif
#if ( (defined(_RTOSUSED_) && defined( _LPMODEUSED_ )) || defined( _LPTMRUSED_ ) )
static volatile uint32_t g_calibrationFactorLPTMR = (uint32_t) 1000u;
#endif
#ifdef _PITUSED_
static volatile uint32_t g_calibrationFactorPIT = (uint32_t) 1000u;
static volatile uint32_t g_PITStartTime = (uint32_t) 0;
#endif

#ifdef _TPMUSED_
volatile uint16_t gAr_TPMTimers[(uint8_t) 2][(uint8_t) 6] =
{
{ (uint16_t) 0, (uint16_t) 0, (uint16_t) 0, (uint16_t) 0, (uint16_t) 0,
  (uint16_t) 0 },
  { (uint16_t) 0, (uint16_t) 0, (uint16_t) 0, (uint16_t) 0, (uint16_t) 0,
    (uint16_t) 0 } };
#endif

volatile TimerFlags gTMRFlags;

void __initTMRFlags( void )
{
#if ( defined( _LPMODEUSED_ ) || defined( _LPTMRUSED_ ) )
    gTMRFlags.g_LMPTRtimerInitialized = (uint8_t) 0x0;
#endif
#ifdef _PITUSED_
    gTMRFlags.g_PITtimerInitialized = (uint8_t) 0x0;
#endif
#ifdef _TPMUSED_
    gTMRFlags.g_TPM0TimerInitialized = (uint8_t) 0x0;
    gTMRFlags.g_TPM1TimerInitialized = (uint8_t) 0x0;
#endif
//#ifdef _CALIBRATE_TIMERS_
    gTMRFlags.g_calibrationOngoing = (uint8_t) 0x0;
//#endif

    /* LOCRE0 = **; RES; RANGE0 = **; HGO0 = **; EREFS0 = 1; LP = **; IRCS = ** */
    MCG_BASE_PTR->C2 |= MCG_C2_EREFS0_MASK;

    /* RES[31:20]; OSC32KSEL = 0b00; RES[17:0] */
    SIM_SOPT1 = SIM_SOPT1_OSC32KSEL( 0x0u );

    /* ERCLKEN = 1; RES; EREFSTEN = 1; RES; SC2P = **; SC4P = **; SC8P = **; SC16P = ** */
    OSC0_BASE_PTR->CR |= OSC_CR_ERCLKEN(0x1u) | OSC_CR_EREFSTEN( 0x1u );    // enable OSCERCLK; OSCERCLK does keep running in stop mode

}

#ifdef _PITUSED_
/*
 ** ===================================================================
 *   Method      :  __init_PIT
 *
 *   Parameters: none
 *
 *   Return value: none
 *
 *   Description :
 *       Initialize the periodical interrupt timer
 ** ===================================================================
 */
void __init_PIT( void )
{
    /* DAC0 = **; RES; RTC = **; ADC0 = **; RES; TPM1 = **; TPM0 = **; PIT = 1; RES[22:2]; DMAMUX = **; FTF = ** */
    SIM_BASE_PTR->SCGC6 |= SIM_SCGC6_PIT_MASK;    // enable PIT clock
    /* RES[31:2]; MDIS = 0; FRZ = 0 */
    PIT_BASE_PTR->MCR = PIT_MCR_MDIS(0x0u) | PIT_MCR_FRZ( 0x1u );    // enable PIT

    gTMRFlags.g_PITtimerInitialized = (uint8_t) 0u;

    resetPIT( (uint32_t) 0xFFFFFFFFu );

    gTMRFlags.g_PITtimerInitialized = (uint8_t) 1u;
}

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
void resetPIT( uint32_t currentPITVal )
{
    // DISABLE TIMERS FIRST TO MAKE SURE (NEW) VALUES CAN BE SET
    /* RES[31:3]; CHN = **; TIE = **; TEN = 0;*/
    PIT_BASE_PTR->CHANNEL[0].TCTRL &= ( (uint32_t) ( ~PIT_TCTRL_TEN_MASK ) );
    /* RES[31:3]; CHN = **; TIE = **; TEN = 0;*/
    PIT_BASE_PTR->CHANNEL[1].TCTRL &= ( (uint32_t) ( ~PIT_TCTRL_TEN_MASK ) );

    // Channel 1 holds the ms that are counted downwards (Countdown timer!)
    PIT_BASE_PTR->CHANNEL[1].LDVAL = currentPITVal;    //Sets the timer start value. The timer will count down until it reaches 0, then it will generate an interrupt and load this register value again.

    /* RES[31:3]; CHN = 1; TIE = 0; TEN = 1;*/
    PIT_BASE_PTR->CHANNEL[1].TCTRL |= (uint32_t) ( PIT_TCTRL_CHN_MASK
            | PIT_TCTRL_TEN_MASK );    // Chain to timer 0 and enable timer 1

    if ( gTMRFlags.g_PITtimerInitialized == (uint8_t) 0 )
    {
        // Channel 0 triggers Channel 1 to count down every millisecond
        PIT_BASE_PTR->CHANNEL[0].LDVAL =
                (uint32_t) ( (uint32_t) ( ( (uint64_t) ( (uint64_t) ( getBusClk()
                        + (uint32_t) 500000u )
                                                         * g_calibrationFactorPIT ) )
                                          / (uint64_t) 1000000u )
                             - (uint32_t) 1u );
        gTMRFlags.g_PITtimerInitialized = (uint8_t) 1u;
    }
    /* RES[31:3]; CHN = 0; TIE = 1; TEN = 1;*/
    PIT_BASE_PTR->CHANNEL[0].TCTRL |= PIT_TCTRL_TEN_MASK;    // enable timer 0
}

#ifdef _TPMUSED_
void calibratePITWithTPM( uint8_t calibrationCycles )
{
    if ( gTMRFlags.g_PITtimerInitialized == (uint8_t) 0 )
    {
        __init_PIT();
    }

    __init_TPMChannel( (uint8_t) 0x1, (uint8_t) 0x0u, (uint16_t) 1000u );
    startTPMChannel( (uint8_t) 0x1u, (uint8_t) 0x0u );
    while ( calibrationCycles-- )
    {
        installIrq(
                &startPITCalibrationWithTPM, TPM1_IRQ_INDEX, (uint8_t) 0x0u );
        gTMRFlags.g_calibrationOngoing = (uint8_t) 1u;
        while ( gTMRFlags.g_calibrationOngoing )
        {    // wait until calibration is done
            ;
        }
        gTMRFlags.g_PITtimerInitialized = (uint8_t) 0;
        resetPIT( (uint32_t) ( ~READ_PIT() ) );    // initialize with newly found calibration factor
    }
    stopTPMChannel( (uint8_t) 0x1u, (uint8_t) 0x0u );
    gTMRFlags.g_PITtimerInitialized = (uint8_t) 1u;
}

static void dummyFkt( void )
{
    __NOP();
}

void startPITCalibrationWithTPM( void )
{
    g_PITStartTime = READ_PIT();
    installIrq( &endPITCalibrationWithTPM, TPM1_IRQ_INDEX, (uint8_t) 0x0u );
}

void endPITCalibrationWithTPM( void )
{
//uint32_t currPITTime = READ_PIT;
//uint32_t g_calibrationFactorCalc;
//g_calibrationFactorCalc =  (uint32_t) ( READ_PIT - g_PITStartTime - (uint32_t) 1000) ;
//g_calibrationFactorCalc -= (uint32_t) 1000;
//g_calibrationFactorCalc /= (float) 1000;
    g_calibrationFactorPIT += (uint32_t) ( READ_PIT() - g_PITStartTime
                                           - (uint32_t) 1000 );
    installIrq( &dummyFkt, TPM1_IRQ_INDEX, (uint8_t) 0x0u );
    gTMRFlags.g_calibrationOngoing = 0u;
}

#endif

///*
// ** ===================================================================
// *   Method      :  enablePITInterrupt
// *
// *   Parameters: none
// *
// *   Return value: none
// *
// *   Description :
// *       enable interrupts for the PIT timer
// ** ===================================================================
// */
//void enablePITInterrupt( void )
//{
//    PIT_BASE_PTR->CHANNEL[1].TCTRL &= ~PIT_TCTRL_TEN_MASK;    // disable timer
//    PIT_BASE_PTR->CHANNEL[1].TFLG |= PIT_TFLG_TIF_MASK;    // Clear interrupt flag
//    /* RES[31:3]; CHN = **; TIE = 1; TEN = **;*/
//    PIT_BASE_PTR->CHANNEL[1].TCTRL |= PIT_TCTRL_TIE_MASK;    // enable interrupt
//    PIT_BASE_PTR->CHANNEL[1].TCTRL |= PIT_TCTRL_TEN_MASK;    // enable timer
//}

/*
 ** ===================================================================
 *   Method      :  disablePITInterrupt
 *
 *   Parameters: none
 *
 *   Return value: none
 *
 *   Description :
 *       disable interrupts for the PIT timer
 ** ===================================================================
 */
void disablePITInterrupt( void )
{
    PIT_BASE_PTR->CHANNEL[1].TCTRL &= ~PIT_TCTRL_TEN_MASK;    // disable timer
    /* RES[31:3]; CHN = **; TIE = 0; TEN = **;*/
    PIT_BASE_PTR->CHANNEL[1].TCTRL &= ~PIT_TCTRL_TIE_MASK;    // disable interrupt
    PIT_BASE_PTR->CHANNEL[1].TCTRL |= PIT_TCTRL_TEN_MASK;    // enable timer
}

/*
 ** ===================================================================
 *   Method      :  readPIT --- DEPRECATED; USE READ_PIT MAKRO INSTEAD
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
uint32_t readPIT( void )    // DEPRECATED; USE READ_PIT MAKRO INSTEAD
{
    if ( gTMRFlags.g_PITtimerInitialized == (uint8_t) 0 )
    {
        __init_PIT();
    }
// CVAL register contains the current value of the timer
    return ~( PIT_BASE_PTR->CHANNEL[1].CVAL );
}

/*
 ** ===================================================================
 *   Method      :  wait_ms --- COULD USE ACTIVE POLLING WITH IS_WAIT_STILL_ACTIVE(start, msToWait)  OR IS_WAIT_EXPIRED(start, msToWait) MAKROS
 *
 *   Parameters:
 *		const   uint32_t  ms   milliseconds to wait
 *
 *   Return value: none
 *
 *   Description :
 *       Wait for the duration of the specified milliseconds
 ** ===================================================================
 */
void wait_ms( const uint32_t ms )
{
    uint32_t start = READ_PIT();
    while ( IS_WAIT_STILL_ACTIVE( start, ms ) )
    {
        ;
    }
}
//
//#ifdef _RTCUSED_
///*
// ** ===================================================================
// *   Method      :  calibratePIT
// *
// *   Parameters:
// *      calibrationCycles       Cycles the calibration process shall take - more cycles -> more accuracy / more time
// *
// *   Return value: none
// *
// *   Description :
// *      Calibrate the PIT timer in reference to the RTC clock
// *      RTC clock is clocked by an external quarz, which is more accurate than the internal IRC
// *      read and save the current value of the PIT timer as soon as the next RTC seconds interrupt occurs
// *      by the second RTC seconds interrupt read the PIT timer again
// *      apply an algorithm to calculate the delay and set an compensation variable
// ** ===================================================================
// */
//void calibratePIT( uint8_t calibrationCycles )
//{
//    if ( gTMRFlags.g_PITtimerInitialized == (uint8_t)0 )
//    {
//        __init_PIT();
//    }
//
//    while ( calibrationCycles-- )
//    {
//        foo = &startPITCalibration;    // set function pointer for the RTC interrupt routine to startPITCalibration function -> calibration starts with the next RTC interrupt
//        gTMRFlags.g_calibrationOngoing = (uint8_t)1u;
//        while ( gTMRFlags.g_calibrationOngoing )
//        {    // wait until calibration is done
//            ;
//        }
//        __init_PIT();    // initialize with newly found calibration factor
//    }
//}
//
//void startPITCalibration( void )
//{
//    g_PITStartTime = readPIT();
//    foo = &endPITCalibration;
//}
//
//void endPITCalibration( void )
//{
//    uint32_t currPITTime = readPIT();
//    float g_calibrationFactorCalc;
//    g_calibrationFactorCalc = ( (float) ( currPITTime - g_PITStartTime ) );
//    g_calibrationFactorCalc -= (float)1000;
//    g_calibrationFactorCalc /= (float)1000;
//    g_calibrationFactorPIT += ( g_calibrationFactorCalc );
//    foo = NULL;
//    gTMRFlags.g_calibrationOngoing = 0u;
//}
//#endif
#endif

#if ( defined( __LP__MODE__ ) ||  defined( _LPTMRUSED_ ) )
/*
 ** ===================================================================
 *   Method      :  __init_LPTMR
 *
 *   Parameters: none
 *
 *   Return value: none
 *
 *   Description :
 *       Initialize the low power timer
 ** ===================================================================
 */
void __init_LPTMR( void )
{
    SIM_BASE_PTR->SCGC5 |= SIM_SCGC5_LPTMR_MASK;    // enable LPTMR clock
    /* RES[31:8]; TCF = 0; TIE = 0; TPS = 0; TPP = 0; TFC = 0; TMS = 0; TEN = 0 */
    LPTMR0_BASE_PTR->CSR = (uint32_t) 0x0u;    // clear the register to reset
#ifndef _RTOSUSED_
            MCG_BASE_PTR->C1 &= ( (uint8_t) ( ~MCG_C1_IRCLKEN_MASK ) );
            /* CLKS = **; FRDIV = **; IREFS = **; IRCLKEN = 1; IREFSTEN = ** */
            MCG_BASE_PTR->C1 |= MCG_C1_IRCLKEN_MASK;    // MCGIRCLK active.
            /* LOCRE0 = **; RES; RANGE0 = **; HGO0 = **; EREFS0 = **; LP = **; IRCS = 1 */
            MCG_BASE_PTR->C2 |= MCG_C2_IRCS_MASK;    // Fast internal reference clock selected

            enableIRQ( LPTMR0_IRQn );
            setIRQPrio( LPTMR0_IRQn, 2 );
            /* RES[31:7]; PRESCALE = 0x00u; PBYP = 0; PCS = 0x0u */
            LPTMR0_BASE_PTR->PSR =
            ( LPTMR_PSR_PRESCALE( 0x0u ) | LPTMR_PSR_PCS( 0x0u ) );    // NO PRESCALER, MCGIRCLK
#else
    /* RES[31:7]; PRESCALE = 0b0100u; PBYP = 0; PCS = 0b11u */
    LPTMR0_BASE_PTR->PSR = ( LPTMR_PSR_PRESCALE(0x4u) | LPTMR_PSR_PCS( 0x2u ) );    // OSCERCLK; PRESCALER 32
//LPTMR0_BASE_PTR->PSR = ( LPTMR_PSR_PBYP_MASK | LPTMR_PSR_PCS( 0x1u ) );    // LPO
#ifdef __LP__DEBUG__
            enableIRQ( LPTMR0_IRQn );
            setIRQPrio( LPTMR0_IRQn, 0 );
#endif
#endif
    gTMRFlags.g_LMPTRtimerInitialized = 1;
}

#ifndef _RTOSUSED_
/*
 ** ===================================================================
 *   Method      :  wait_ms_LP
 *
 *   Parameters:
 *   	ms		milliseconds to wait
 *
 *   Return value: none
 *
 *   Description :
 *       active polling for the time given
 *       PRECISION DEPENDS ON THE INTERNAL QUARZ'S PRECISION
 ** ===================================================================
 */
//void wait_ms_LP( uint16_t ms )
//{
//    if ( gTMRFlags.g_LMPTRtimerInitialized == (uint8_t)0x0u )
//    {
//        __init_LPTMR();
//    }
//    g_TimerAlarm = 0;
//    if ( ((uint32_t)((uint32_t)ms * (uint32_t)1000)) < (uint32_t)65536 )
//    {
//        ms *= ( (uint16_t)1000u );
//        g_ref = (uint16_t)1u;
//    }
//    else
//    {
//        g_ref = (uint16_t)1000u;
//    }
//    setLPTMR( ms );
//    while ( g_TimerAlarm < g_ref )
//    {
//        ;
//    }
//    LPTMR0_BASE_PTR->CSR &= ~LPTMR_CSR_TEN_MASK;
//    g_TimerAlarm = (uint16_t)0;
//}
#endif
/*
 ** ===================================================================
 *   Method      :  setLPTMR
 *
 *   Parameters:
 *   	timerVal	value for the LPTMR cmp register
 *
 *   Return value: none
 *
 *   Description :
 *   	Set the compare register of the LPTMR to have an interrupt when this value is reached
 ** ===================================================================
 */
void setLPTMR( uint16_t timerVal )
{
    timerVal = (uint16_t) ( timerVal /* * g_calibrationFactorLPTMR*/);
//If the LPTMR is enabled, the CMR must be altered only when TCF is set.
    LPTMR0_BASE_PTR->CSR &= (uint32_t) ( ~LPTMR_CSR_TEN_MASK );    // disable timer
    LPTMR0_BASE_PTR->CMR = LPTMR_CMR_COMPARE( timerVal );    // set compare value

    /* RES[31:8]; TCF = w1c; TIE = 1; TPS = 0; TPP = 0; TFC = 0; TMS = 0; TEN = 1 */
    LPTMR0_BASE_PTR->CSR = (uint32_t) ( LPTMR_CSR_TCF_MASK    // CLEAR interrupt flag
                                        | LPTMR_CSR_TPP( 0x0u )    // Increment on rising edge
                                        | LPTMR_CSR_TFC( 0x0u )    // CNR is reset whenever TCF is set
                                        | LPTMR_CSR_TMS( 0x0u ) );    // Time Counter mode
//When TEN is set, the LPTMR is enabled. While writing 1 to this field, CSR[5:1] must not be altered.
    LPTMR0_BASE_PTR->CSR |= LPTMR_CSR_TEN_MASK;             // Timer enable
//CSR[TIE] must be set as the last step in the initialization.
//This ensures the LPTMR is configured correctly and the LPTMR counter is reset to zero following a warm reset
    LPTMR0_BASE_PTR->CSR |= LPTMR_CSR_TIE_MASK;        // Timer interrupt enable
}

/*
 ** ===================================================================
 *   Method      :  readLPTMR --- DEPRECATED; USE A COMBINATION OF 'WRITE_TO_LPTMR_CNR' and 'READ_LPTMR_CNR' MAKROS INSTEAD
 *
 *   Parameters: none
 *
 *   Return value:
 *   	Current value of the LPTMR
 *
 *   Description :
 *       Read the current value of the LPMTR CNR register and return it
 ** ===================================================================
 */
uint16_t readLPTMR( void )
{
    /*
     * The CNR cannot be initialized, but can be read at any time. On each read of the CNR,
     * software must first write to the CNR with any value. This will synchronize and register
     * the current value of the CNR into a temporary register. The contents of the temporary
     * register are returned on each read of the CNR.
     */
    LPTMR0_BASE_PTR->CNR = (uint16_t) 0x1u;
    return ( (uint16_t) LPTMR0_BASE_PTR->CNR );
}

//#ifdef _RTCUSED_
///*
// ** ===================================================================
// *   Method      :  calibrateLPTMR
// *
// *   Parameters:
// *      calibrationCycles       Cycles the calibration process shall take - more cycles -> more accuracy / more time
// *
// *   Return value: none
// *
// *   Description :
// *      Calibrate the LPTMR timer in reference to the RTC clock
// *      RTC clock is clocked by an external quarz, which is more accurate than the internal IRC
// *      Start LPTMR timer set to 1500 ms as soon as the next RTC seconds interrupt occurs
// *      by the second RTC seconds interrupt stop read the LPMTR CNT register
// *      apply an algorithm to calculate the delay and set an compensation variable
// ** ===================================================================
// */
//void calibrateLPTMR( uint8_t calibrationCycles )
//{
//    if ( gTMRFlags.g_LMPTRtimerInitialized == (uint8_t)0 )
//    {
//        __init_LPTMR();
//    }
//
//    while ( calibrationCycles-- )
//    {
//        foo = &startLPTMRCalibration;
//        gTMRFlags.g_calibrationOngoing = (uint8_t)1u;
//        while ( gTMRFlags.g_calibrationOngoing )
//        {
//            ;
//        }
//
//        LPTMR0_BASE_PTR->CSR &= ~LPTMR_CSR_TEN_MASK;
//    }
//    g_TimerAlarm = (uint16_t)0;
//}
//
//void startLPTMRCalibration( void )
//{
//    g_TimerAlarm = 0;
//    setLPTMR( 1500u );
//    foo = &endLPTMRCalibration;
//}
//
//void endLPTMRCalibration( void )
//{
//    float g_calibrationFactorCalc;
//    g_calibrationFactorCalc = ( (float) ( (uint16_t)1000 - g_TimerAlarm ) );    // subtract current timer counter from expected timer counter (1000)
//    g_calibrationFactorCalc *= 1.5f;// multiply result with set timerValue (to get delay in us)
//    g_calibrationFactorCalc = (float)500 - g_calibrationFactorCalc;// subtract result from 500 (to find out how many us we are early/late)
//    g_calibrationFactorCalc /= (float)1500;// divide with set us (timerValue) to get delay per timerValue
//    g_calibrationFactorLPTMR += g_calibrationFactorCalc;// correct calibration factor
//    foo = NULL;
//    gTMRFlags.g_calibrationOngoing = (uint8_t)0u;
//}
//#endif
#endif

#ifdef _RTCUSED_
/*
 ** ===================================================================
 *   Method      :  __init_RTC
 *
 *   Parameters: none
 *
 *   Return value: none
 *
 *   Description :
 *       Initialize the real time clock
 ** ===================================================================
 */
void __init_RTC( void )
{
// enable counter
    /*
     * Time Counter Enable in status control register (SC)
     * When time counter is disabled the TSR register and TPR register are writeable, but do not increment.
     * When time counter is enabled the TSR register and TPR register are not writeable, but increment.
     * 0 Time counter is disabled.
     * 1 Time counter is enabled.
     */

    SIM_SCGC6 |= SIM_SCGC6_RTC_MASK;
#ifdef __LP__MODE__
    /* RES[31:20]; OSC32KSEL = 0b11; RES[17:0] */
//SIM_SOPT1 = SIM_SOPT1_OSC32KSEL( 0x3u );    // 1kHz LPO for RTC and LPTMR
#else
    /* RES[31:20]; OSC32KSEL = 0b00; RES[17:0] */
//SIM_SOPT1 = SIM_SOPT1_OSC32KSEL( 0x0u );
#endif
    /* RES[31:14]; SC2P = 0; SC4P = 0; SC8P = 0; SC16P = 0; CLK0 = 0; OSCE = 0; RES[7:4]; UM = 0; SUP = 0; WPE = 0; SWR = 1 */
    RTC_BASE_PTR->CR = RTC_CR_SWR_MASK;    // Clear all RTC registers.
    /* RES[31:14]; SC2P = **; SC4P = **; SC8P = **; SC16P = **; CLK0 = **; OSCE = **; RES[7:4]; UM = **; SUP = **; WPE = **; SWR = 0 */
    RTC_BASE_PTR->CR &= ~RTC_CR_SWR_MASK;

    /* RES[31:14]; SC2P = **; SC4P = **; SC8P = **; SC16P = **; CLK0 = **; OSCE = 1; RES[7:4]; UM = **; SUP = **; WPE = **; SWR = ** */
    RTC_BASE_PTR->CR |= RTC_CR_OSCE_MASK;    // 32.768 kHz oscillator is enabled. After setting this bit, wait the oscillator startup time before enabling
    WAIT_MS( (uint16_t)150u );// the time counter to allow the 32.768 kHz clock time to stabilize

    /* RES[31:5]; TCE; RES; TAF; TOF; TIF */
    if ( RTC_BASE_PTR->SR & RTC_SR_TIF_MASK )
    {    // poll for Time Invalid Flag
        RTC_BASE_PTR->TSR = (uint32_t)0x00000001;
    }

    /* CIC; TCV; CIR = 1; TCR = 0 */
    RTC_BASE_PTR->TCR = RTC_TCR_CIR(0) | RTC_TCR_TCR( 0xFFu );    // Set time compensation parameters

//Write to Time Seconds Register.
    RTC_BASE_PTR->TSR = (uint32_t)0x1u;

    /* RES[31:5]; TCE = 1; RES; TAF; TOF; TIF */
    RTC_BASE_PTR->SR |= RTC_SR_TCE_MASK;    //Enable time counter.

// Writing to the TSR when the time counter is disabled will clear the SR[TOF] and/or the SR[TIF]
    RTC_BASE_PTR->TSR = (uint32_t)0x1u;

    foo = NULL;
}

/*
 ** ===================================================================
 *   Method      :  rtcIntHandler
 *
 *   Parameters: none
 *
 *   Return value: none
 *
 *   Description :
 *   	Save the current value of the RTC seconds register to a global variable
 *   	NO flag needs to be cleared here
 ** ===================================================================
 */
void rtcIntHandler( void )
{
    g_RTCtimestamp = readRTC();

    if ( foo != NULL )
    {
        ( *foo )();
    }
}

/*
 ** ===================================================================
 *   Method      :  enableRTCInterrupt
 *
 *   Parameters: none
 *
 *   Return value: none
 *
 *   Description :
 *   	Set RTC clock to generate an interrupt every second
 ** ===================================================================
 */
void enableRTCInterrupt( void )
{
    /* RES[31:8]; WPON = **; RES[6:5]; TSIE = 1; RES; TAIE = **; TOIE = **; TIIE = ** */
    RTC_BASE_PTR->IER |= RTC_IER_TSIE_MASK;
    foo = NULL;
}

/*
 ** ===================================================================
 *   Method      :  disableRTCInterrupt
 *
 *   Parameters: none
 *
 *   Return value: none
 *
 *   Description :
 *   	disable the RTC interrupt every second
 ** ===================================================================
 */
void disableRTCInterrupt( void )
{
    /* RES[31:8]; WPON = **; RES[6:5]; TSIE = 0; RES; TAIE = **; TOIE = **; TIIE = ** */
    RTC_BASE_PTR->IER &= ~RTC_IER_TSIE_MASK;
}

/*
 ** ===================================================================
 *   Method      :  readRTC --- DEPRECATED; USE READ_RTC MAKRO INSTEAD
 *
 *   Parameters: none
 *
 *   Return value:
 *   	Current value of the RTC seconds register
 *
 *   Description :
 *   	Read the current time in seconds (TIMESTAMP) from the RTC seconds register
 ** ===================================================================
 */
uint32_t readRTC( void )
{
    return RTC_BASE_PTR->TSR;
}

/*
 ** ===================================================================
 *   Method      :  setRTC
 *
 *   Parameters:
 *   	tSec		Value (in seconds) to set the RTC to
 *
 *   Return value: none
 *
 *   Description :
 *   	Set the RTC seconds register to this value
 *   	DO NOT set a value of 0x0u since this will be interpreted as invalid time
 ** ===================================================================
 */
void setRTC( uint32_t tSec )
{
// disable counter, because TSR is only writeable when counter is disabled, thus does not increment!
    /* RES[31:5]; TCE =  0; RES; TAF; TOF; TIF */
    RTC_BASE_PTR->SR &= ~RTC_SR_TCE_MASK;

// we do not write 0 into TSR
// to avoid invalid time
    if ( tSec == (uint32_t)0 )
    tSec = (uint32_t)1;

// write seconds to TSR to set the time
    RTC_BASE_PTR->TSR = tSec;

// re-enable counter, thus the TSR is incremented by the RTC
    /*
     * Time Counter Enable in status control register (SC)
     * When time counter is disabled the TSR register and TPR register are writeable, but do not increment.
     * When time counter is enabled the TSR register and TPR register are not writeable, but increment.
     * 0 Time counter is disabled.
     * 1 Time counter is enabled.
     */
    /* RES[31:5]; TCE =  1; RES; TAF; TOF; TIF */
    RTC_BASE_PTR->SR |= RTC_SR_TCE_MASK;
}

#endif

#ifdef _TPMUSED_

/*
 ** ===================================================================
 *   Method      :  __init_TPM
 *
 *   Parameters:
 *   	timer		specifies the TPM module to be initialized (TPM0 or TPM1)
 *
 *   Return value: none
 *
 *   Description :
 *       Initialize the specified Timer/PWM Module
 ** ===================================================================
 */
void __init_TPM( const uint8_t timer )
{
    TPM_Type * tpmBasePtr = ( timer ) ? TPM1_BASE_PTR : TPM0_BASE_PTR;
    /* DAC0 = **; RES; RTC = **; RES; ADC0 = **; RES; TPM1 = **; TPM0 = 1; PIT = **; RES[22:2]; DMAMUX = **; FTF = ** */
    SIM->SCGC6 |= ( timer ) ? SIM_SCGC6_TPM1_MASK : SIM_SCGC6_TPM0_MASK;    // enable TPM module in SIM register
    /* RES[31:28]; UART0SRC = **; TPMSRC = 10; RES[23:8]; CLKOUTSEL = **; RTCCLKOUTSEL = **; RES[3:0] */
    SIM->SOPT2 |= SIM_SOPT2_TPMSRC( 0x2u );    // OSCERCLK for TPM modules

    /* LOCRE0 = **; RES; RANGE0 = **; HGO0 = **; EREFS0 = 1; LP = **; IRCS = ** */
//MCG_BASE_PTR->C2 |= MCG_C2_EREFS0_MASK;
    /* ERCLKEN = 1; RES; EREFSTEN = 1; RES; SC2P = **; SC4P = **; SC8P = **; SC16P = ** */
//OSC0_BASE_PTR->CR |= OSC_CR_ERCLKEN(0x1u) | OSC_CR_EREFSTEN( 0x0u );    // enable OSCERCLK; OSCERCLK does not keep running in stop mode
// RESET TPM
    tpmBasePtr->SC = TPM_SC_CMOD( 0x0u );

    /* RES[31:9]; DMA = **; TOF = **; TOIE = 0; CPWMS = 0; CMOD = 01; PS = 101 */
    tpmBasePtr->SC |= TPM_SC_CMOD(0x1u) | TPM_SC_PS( 0x5u );    // set clock to 1KHz (PS == 32)
    tpmBasePtr->CONF |= TPM_CONF_DOZEEN_MASK;    //Internal LPTPM counter is paused and does not increment during Doze mode.

    if ( timer )
    {
        gTMRFlags.g_TPM1TimerInitialized = (uint8_t) 0x1u;
    }
    else
    {
        gTMRFlags.g_TPM0TimerInitialized = (uint8_t) 0x1u;
    }
    tpmBasePtr->CNT = (uint32_t) 0x0u;
}

/*
 ** ===================================================================
 *   Method      :  __init_TPMChannel
 *
 *   Parameters:
 *   	timer		specifies the TPM module whose channel shall be initialized (TPM0 or TPM1)
 *   	channelNR	specifies the channel of the timer to be initialized
 *   	timeInMs	time in ms the timer shall be set to
 *
 *   Return value: none
 *
 *   Description :
 *       Initialize the specified TPM channel and set a time in Ms
 *       Timing information is stored in a global array for each timer to reset the timer after an interrupt (see re_setTPMTimer)
 *       !!!CAUTION:
 *       	TPM0 has 6 Channels (0-5)!
 *       	TPM1 has 2 Channels (0-1)!
 ** ===================================================================
 */
void __init_TPMChannel(
                        const uint8_t timer,
                        const uint8_t channelNr,
                        const uint16_t timeInMs )
{
    if ( !( ( timer ) ?
            gTMRFlags.g_TPM1TimerInitialized : gTMRFlags.g_TPM0TimerInitialized ) )    // Check if the timer was already initialized
    {
        __init_TPM( timer );
    }
    gAr_TPMTimers[timer][channelNr] =
            ( (uint16_t) ( timeInMs /* * (uint16_t) 16 */) );    // compensate 32 kHz quartz
}

/*
 ** ===================================================================
 *   Method      :  stopTPMChannel
 *
 *   Parameters:
 *      timer           specifies the TPM module whose channel shall be stopped (TPM0 or TPM1)
 *      channelNR       specifies the channel of the timer to be stopped
 *
 *   Return value: none
 *
 *   Description :
 *       Stop the specified TPM channel
 *       Timing information is cleared in the global array for the corresponding timer
 *       !!!CAUTION:
 *              TPM0 has 6 Channels (0-5)!
 *              TPM1 has 2 Channels (0-1)!
 ** ===================================================================
 */
void stopTPMChannel( const uint8_t timer, const uint8_t channelNr )
{
    TPM_Type * tpmBasePtr = ( timer ) ? TPM1_BASE_PTR : TPM0_BASE_PTR;

    /* RES[31:8]; CHF = 0; CHIE = 0; MSB = 0; MSA = 0; ELSB = 0; ELSA = 0; RES; DMA =  0*/
    //WAIT FOR ACK IN THE TPM TIMER DOMAIN
    while ( tpmBasePtr->CONTROLS[channelNr].CnSC & (uint16_t) ( TPM_CnSC_MSB_MASK
            | TPM_CnSC_MSA_MASK | TPM_CnSC_ELSB_MASK | TPM_CnSC_ELSA_MASK ) )
    {
        // disable channel
        tpmBasePtr->CONTROLS[channelNr].CnSC =
        TPM_CnSC_MSB(
                0x0u )
        | TPM_CnSC_MSA( 0x0u ) | TPM_CnSC_ELSB( 0x0u ) | TPM_CnSC_ELSA( 0x0u );    // disable channel

    }

    while ( ( (uint16_t) ( tpmBasePtr->CONTROLS[channelNr].CnV
            & (uint32_t) 0xFFFFu ) )
            != (uint32_t) 0x0u )
    {
        tpmBasePtr->CONTROLS[channelNr].CnV = (uint32_t) 0x0u;    // set Value for channel
    }
}

/*
 ** ===================================================================
 *   Method      :  startTPMChannel
 *
 *   Parameters:
 *      timer           specifies the TPM module whose channel shall be stopped (TPM0 or TPM1)
 *      channelNR       specifies the channel of the timer to be stopped
 *
 *   Return value: none
 *
 *   Description :
 *       Stop the specified TPM channel
 *       Timing information is cleared in the global array for the corresponding timer
 *       !!!CAUTION:
 *              TPM0 has 6 Channels (0-5)!
 *              TPM1 has 2 Channels (0-1)!
 ** ===================================================================
 */

void startTPMChannel( const uint8_t timer, const uint8_t channelNr )
{
    TPM_Type * tpmBasePtr = ( timer ) ? TPM1_BASE_PTR : TPM0_BASE_PTR;
    uint16_t calculatedTime = gAr_TPMTimers[timer][channelNr];
    uint32_t offset = tpmBasePtr->CNT + calculatedTime;    // calculated counter distance to get how much there is to add to the cnt register in order for the timer to expire
    calculatedTime = (uint16_t) (
            ( offset > (uint32_t) 0xFFFF ) ?
                    ( offset - (uint32_t) 0xFFFF ) : offset );    // check if the calculated offset exceeds the 16bit register -> proceed counting after overflow

    // WAIT FOR ACK IN THE TPM CLK DOMAIN
    while ( ( tpmBasePtr->CONTROLS[channelNr].CnSC
            != (uint16_t) (
            TPM_CnSC_CHIE_MASK | TPM_CnSC_MSB( 0x0u ) | TPM_CnSC_MSA( 0x1u )
            | TPM_CnSC_ELSB( 0x0u ) | TPM_CnSC_ELSA( 0x0u ) ) ) )
    {
        // Software compare mode: MSnB:MSnA - 01 --- ELSnB:ELSnA - 00
        /* RES[31:8]; CHF = W1C; CHIE = 1; MSB = 0; MSA = 1; ELSB = 0; ELSA = 0; RES; DMA =  0*/
        tpmBasePtr->CONTROLS[channelNr].CnSC =
                TPM_CnSC_CHF_MASK | TPM_CnSC_CHIE_MASK
                | TPM_CnSC_MSB(
                        0x0u ) | TPM_CnSC_MSA(0x1u) | TPM_CnSC_ELSB(0x0u) | TPM_CnSC_ELSA(0x0u);

    }

    /* DANGER/////!!!CAUTION!!!////DANGER */
    /*
     * IF EVER THE CnV VALUE OF A CHANNEL HAS TO BE UPDATED YOU HAVE TO MAKE SURE IT IS ACKNOWLEDGED IN THE TPM GLOBAL CLOCK DOMAIN!
     * THUS KEEP WRITING THE VALUE INTO THE CHANNEL'S CnV REGISTER UNTIL IT IS UPDATED, BECAUSE THE FIRST WRITE TO THIS REGISTER ONLY LATCHES THE WRITTEN VALUE INTO A BUFFER
     * THE ACTUAL REGISTER IS UPDATED ACCORDING TO A TABLE IN THE REFERENCE MANUAL... NEVERTHELESS THE MANUAL DOES NOT SAY THAT THE LATCHED REGISTER GETS THROWN AWAY ON SEVERAL OCCASIONS
     * TO MAKE SURE THE UPDATED VALUE IS WRITTEN AND ACCEPTED IN THE TPM CHANNEL: WRITE AND POLL UNTIL SET!!!
     * ALSO DO NOT SET THE CnSC REGISTER ATER THE CnV REGISTER, BECAUSE SOME SOURCES SAY THAT THIS WILL CLEAR THE CnV REGISTER ON SOME OCCASIONS (not tested...)
     */
    /* DANGER/////!!!CAUTION!!!////DANGER */
    while ( ( (uint16_t) ( tpmBasePtr->CONTROLS[channelNr].CnV
            & (uint32_t) 0xFFFFu ) )
            != calculatedTime )
    {
        tpmBasePtr->CONTROLS[channelNr].CnV = calculatedTime;    // set Value for channel
    }
}

/*
 ** DEPRECATED========================================================
 *   Method      :  re_setTPMTimer
 *
 *   Parameters:
 *   	timer		specifies the TPM module whose channel shall be initialized (TPM0 or TPM1)
 *   	channelNR	specifies the channel of the timer to be initialized
 *
 *   Return value: none
 *
 *   Description :
 *       If not reset the timer simply overflows after an interrupt and starts counting from 0x0
 *       to keep the set timing the timer value in the channel's count register has to be updated
 ** ===================================================================
 */
void re_setTPMTimer( const uint8_t timer, const uint8_t channelNr )
{
    startTPMChannel( timer, channelNr );
}

uint16_t getTPMCHRemTime( const uint8_t timer, const uint8_t channelNr )
{
    int32_t remTime =
            (int32_t) ( (int32_t) ( ( ( timer ) ? TPM1_BASE_PTR : TPM0_BASE_PTR )->CONTROLS[channelNr].CnV
                    & (uint32_t) 0xFFFFu )
                        - (int32_t) ( (
                                ( timer ) ? TPM1_BASE_PTR : TPM0_BASE_PTR )->CNT
                                      & (uint32_t) 0xFFFFu ) );
    if ( remTime < (int32_t) 0 )
        remTime += (int32_t) 0xFFFFu;
    return (uint16_t) remTime;
}

void correctTPMChannel( const uint8_t timer, const uint16_t chCorr )
{
    uint8_t tpmChCnt = (uint8_t) 0x0u;
    uint16_t correctedTPMTime = 0x0u;
    uint16_t svdStdnrdTPMTime = 0x0u;

    for ( tpmChCnt = (uint8_t) 0x0u;
            tpmChCnt < ( ( timer ) ? TPM1_CHANNELS : TPM0_CHANNELS );
            tpmChCnt++ )
    {
        if ( gAr_TPMTimers[timer][tpmChCnt] != (uint16_t) 0x0u )
        {
            correctedTPMTime = (uint16_t) ( getTPMCHRemTime( timer, tpmChCnt )
                    - (uint16_t) ( chCorr /* * (uint16_t) 16*/ ) );
            svdStdnrdTPMTime = gAr_TPMTimers[timer][tpmChCnt];
            gAr_TPMTimers[timer][tpmChCnt] = ( (uint16_t) correctedTPMTime );    // set corrected Value for channel
            startTPMChannel( timer, tpmChCnt );
            gAr_TPMTimers[timer][tpmChCnt] = svdStdnrdTPMTime;
        }
    }
}

void __disableTPMTimers( void )
{
//Selects the LPTPM counter clock modes.
//When disabling the counter, this field remain set until
//acknolwedged in the LPTPM clock domain.
    if ( gTMRFlags.g_TPM0TimerInitialized )
    {
        while ( TPM0_BASE_PTR->SC & TPM_SC_CMOD( 0x1u ) )
        {
            TPM0_BASE_PTR->SC &= ~TPM_SC_CMOD_MASK;
        }
    }
    if ( gTMRFlags.g_TPM1TimerInitialized )
    {
        while ( TPM1_BASE_PTR->SC & TPM_SC_CMOD( 0x1u ) )
        {
            TPM1_BASE_PTR->SC &= ~TPM_SC_CMOD_MASK;
        }
    }
}

void __enableTPMTimers( void )
{
    if ( gTMRFlags.g_TPM0TimerInitialized )
        TPM0_BASE_PTR->SC |= TPM_SC_CMOD( 0x1u );

    if ( gTMRFlags.g_TPM1TimerInitialized )
        TPM1_BASE_PTR->SC |= TPM_SC_CMOD( 0x1u );

}

uint16_t findShortesTPM( void )
{
    uint16_t tpmSetTimeTMP = (uint16_t) 0x0u;
    volatile uint16_t tpmSetTime = (uint16_t) 0xFFFFu;
    uint8_t tmrCnt = (uint8_t) 0x0u;
    uint8_t chnlCnt = (uint8_t) 0x0u;
    uint8_t actvTPMTmrs[2] =
    { (uint8_t) 0u, (uint8_t) 0u };
    if ( gTMRFlags.g_TPM0TimerInitialized )
    {
        actvTPMTmrs[tmrCnt] = 0u;
        ++tmrCnt;
    }
    if ( gTMRFlags.g_TPM1TimerInitialized )
    {
        actvTPMTmrs[tmrCnt] = 1u;
        ++tmrCnt;
    }
    while ( tmrCnt-- )
    {
        //tpmBasePtr = ( tmrCnt ) ? TPM1_BASE_PTR : TPM0_BASE_PTR;
        chnlCnt = ( actvTPMTmrs[tmrCnt] ) ? TPM1_CHANNELS : TPM0_CHANNELS;
        //tpmCntVal = (uint16_t) ( tpmBasePtr->CNT & (uint32_t) 0xFFFFu );
        while ( chnlCnt-- )
        {
            tpmSetTimeTMP = (uint16_t) getTPMCHRemTime(
                    actvTPMTmrs[tmrCnt], chnlCnt );
            if ( tpmSetTimeTMP )
            {
                if ( (uint16_t) tpmSetTime > (uint16_t) tpmSetTimeTMP )
                    tpmSetTime = tpmSetTimeTMP;
            }
        }
    }
    return ( (uint16_t) ( (uint32_t) tpmSetTime /* / (uint32_t) 16u */ ) );
}
#endif
#endif
