/**
 * \file    InterruptFunc.c
 * \author  Christian Neuberger (NeubergerCh50344@th-nuernberg.de)
 * \date    12.10.2015
 *
 */

#include "MKL05Z4.h"
#include "InterruptFunc.h"
#include "TimerFunc.h"
#include "PortFunc.h"

#ifdef _RTOSUSED_
#include "R_RTOS_memMngr.h"
#else
#include <stdlib.h>
#endif


#ifdef __LP__DEBUG__
extern uint16_t timeToWake;
extern uint16_t nxtSysTick;
extern volatile uint16_t gAr_TPMTimers[(uint8_t)2][(uint8_t)6];
extern void correctTPMChannel(
                               const uint8_t timer,
                               const uint8_t channelNr,
                               uint16_t correctedTime );
#endif

// NULL for NULL pointers
#undef NULL   // in case it was somehow define before
#define NULL ((void *)0)  // NULL pointer

//TODO InstallIntHandler //DONE
#define NUM_INT_HANDLER_CONTAINER ((uint8_t)12u)
// 41 uint8_t values in all g_ISRFktNr* arrays total -> 41 byte
#ifdef _SPIUSED_
static volatile uint8_t g_ISRFktNr_SPI0[(uint8_t)1] =
{ (uint8_t) 0xFFu };
#endif
#ifdef _UARTUSED_
static volatile uint8_t g_ISRFktNr_UART0[(uint8_t)1] =
{ (uint8_t) 0xFFu };
#endif
#ifdef _ADCUSED_
static volatile uint8_t g_ISRFktNr_ADC0[(uint8_t)1] =
{   (uint8_t) 0xFFu};
#endif
#ifdef _TIMERUSED_
#ifdef _TPMUSED_
#endif
#ifdef _TIMERUSED_
#ifdef _TPMUSED_
static volatile uint8_t g_ISRFktNr_TPM0[(uint8_t)6] =
{ (uint8_t) 0xFFu, (uint8_t) 0xFFu, (uint8_t) 0xFFu, (uint8_t) 0xFFu,
  (uint8_t) 0xFFu, (uint8_t) 0xFFu };
static volatile uint8_t g_ISRFktNr_TPM1[(uint8_t)2] =
{ (uint8_t) 0xFFu, (uint8_t) 0xFFu };
#endif
#ifdef _RTCUSED_
static volatile uint8_t g_ISRFktNr_RTC[(uint8_t)1] =
{ (uint8_t) 0xFFu };
static volatile uint8_t g_ISRFktNr_RTC_SECONDS[(uint8_t)1] =
{ (uint8_t) 0xFFu };
#endif
#ifdef _PITUSED_
static volatile uint8_t g_ISRFktNr_PIT[(uint8_t)1] =
{ (uint8_t) 0xFFu };
#endif
#if ( ( defined( _LPTMRUSED_ ) && !defined( _RTOSUSED_ ) )|| defined ( __LP__DEBUG__ ) )
static volatile uint8_t g_ISRFktNr_LPTPMR0[1] =
{ (uint8_t) 0xFFu };
#endif
#endif
#endif
#ifdef _PORTAINT_
static volatile uint8_t g_ISRFktNr_PORTA[13] =
{   (uint8_t) 0xFFu, (uint8_t) 0xFFu, (uint8_t) 0xFFu, (uint8_t) 0xFFu,
    (uint8_t) 0xFFu, (uint8_t) 0xFFu, (uint8_t) 0xFFu, (uint8_t) 0xFFu,
    (uint8_t) 0xFFu, (uint8_t) 0xFFu, (uint8_t) 0xFFu, (uint8_t) 0xFFu,
    (uint8_t) 0xFFu};
#endif
#ifdef _PORTBINT_
static volatile uint8_t g_ISRFktNr_PORTB[13] =
{   (uint8_t) 0xFFu, (uint8_t) 0xFFu, (uint8_t) 0xFFu, (uint8_t) 0xFFu,
    (uint8_t) 0xFFu, (uint8_t) 0xFFu, (uint8_t) 0xFFu, (uint8_t) 0xFFu,
    (uint8_t) 0xFFu, (uint8_t) 0xFFu, (uint8_t) 0xFFu, (uint8_t) 0xFFu,
    (uint8_t) 0xFFu};
#endif
// 12 uint8_t * values in g_ISRFktNr_Modules -> 48 byte
static volatile uint8_t *g_ISRFktNr_Modules[] =
{ NULL,
#ifdef _SPIUSED_
  g_ISRFktNr_SPI0,
#endif
#ifdef _UARTUSED_
  g_ISRFktNr_UART0,
#endif
#ifdef _ADCUSED_
  g_ISRFktNr_ADC0,
#endif
#ifdef _TIMERUSED_
#ifdef _TPMUSED_
  g_ISRFktNr_TPM0,
  g_ISRFktNr_TPM1,
#endif
#ifdef _RTCUSED_
  g_ISRFktNr_RTC,
  g_ISRFktNr_RTC_SECONDS,
#endif
#ifdef _PITUSED_
  g_ISRFktNr_PIT,
#endif
#if ( ( defined( _LPTMRUSED_ ) && !defined( _RTOSUSED_ ) )|| defined ( __LP__DEBUG__ ) )
  g_ISRFktNr_LPTPMR0,
#endif
#endif
#ifdef _PORTAINT_
                                                g_ISRFktNr_PORTA,
#endif
#ifdef _PORTBINT_
                                                g_ISRFktNr_PORTB
#endif
                                            };

// 41 byte from FktNr and 48 byte from FktNr array -> 89 byte in total

static volatile FuncPtr *g_IRQArr;
static uint8_t g_IRQArrSize = (uint8_t) 0x0u;

/*
 ** ===================================================================
 *   Method      :  installIrq
 *
 *   Parameters:
 *      FuncPtr     func        Function to be called by the interrupt handler
 *      IRQIndex    module      Index of the module the interrupt belongs to
 *      uint8_t     entity      Index of the Entity the interrupt belongs to
 *
 *   Return value: none
 *
 *   Description :
 *      Installs a function inside the interrupt handler of the interrupt generator specified by module and entity
 *      The specified function is then called whenever an interrupt for the specified case occurs
 ** ===================================================================
 */
void installIrq( FuncPtr func, IRQIndex module, uint8_t entity )
{
    if ( g_ISRFktNr_Modules[module][entity] != (uint8_t)0xFFu )
    {
        g_IRQArr[g_ISRFktNr_Modules[module][entity]] = func;
    }
    else
    {
        ++g_IRQArrSize;
        if ( g_IRQArrSize != (uint8_t)1 )
        {
            g_IRQArr = (volatile FuncPtr *) realloc(
                    (FuncPtr) g_IRQArr, (uint16_t)(g_IRQArrSize * sizeof(FuncPtr) ));

        }
        else
        {
            g_IRQArr = (volatile FuncPtr *) realloc( NULL, (uint16_t)(g_IRQArrSize * sizeof(FuncPtr)));
            // calloc initializes the array with zeros
            // malloc is faster --> value is assigned afterwards, thus initilazation to zero is not needed
        }
        g_IRQArr[g_IRQArrSize - (uint8_t)0x1u] = func;    // assign the function at the corresponding index
        g_ISRFktNr_Modules[module][entity] = (uint8_t) ( g_IRQArrSize - (uint8_t)0x1u );    //write index to the modules array
    }
}

// DO NOT USE deinstallIrq
// DOES NOT WORK
// UNFINISHED
// IDEA: FREE THE SPACE OF THE FUNCTION AND OVERRIDE IT IN THE INSTALL FKT
//void deinstallIrq( IRQIndex module, uint8_t entity )
//{
//    if ( g_ISRFktNr_Modules[module][entity] != 0xFFu )
//    {
//        uint8_t shrinking = g_IRQArrSize - g_ISRFktNr_Modules[module][entity];
//        uint8_t i, j;
//        for ( i = g_ISRFktNr_Modules[module][entity]; i < g_IRQArrSize; ++i )
//        {
//            g_IRQArr[i] = g_IRQArr[i + 1];    // Replace element and shift all elements afterwards one position forward
//        }
//
//        g_ISRFktNr_Modules[module][entity] = 0xFFu;
//
//        for ( i = 0; i < NUM_INT_HANDLER_CONTAINER; ++i )
//        {
//            j = ( sizeof( *g_ISRFktNr_Modules[module] ) / sizeof(uint8_t) );
//
//        }
//
//        g_IRQArrSize--;
//        g_IRQArr = (volatile FuncPtr *) realloc( (FuncPtr)g_IRQArr, g_IRQArrSize * sizeof(FuncPtr) );
//
//    }
//}

#ifdef _SPIUSED_

/*
 ** ===================================================================
 *   Method      :  SPI0_IRQHandler
 *
 *   Parameters: none
 *   Return value: none
 *
 *   Description :
 *      Function is called in case of an SPI0 interrupt
 *      forward function call to corresponding interrupt handler
 ** ===================================================================
 */
void SPI0_IRQHandler( void )
{
    if ( g_ISRFktNr_Modules[SPI0_IRQ_INDEX][(uint8_t)0] != (uint8_t)0xFFu )
    {
        ( *g_IRQArr[g_ISRFktNr_Modules[SPI0_IRQ_INDEX][(uint8_t)0]] )();
    }
    //uart0IntHandler();
}
#endif

#ifdef _UARTUSED_
/*
 ** ===================================================================
 *   Method      :  UART0_IRQHandler
 *
 *   Parameters: none
 *   Return value: none
 *
 *   Description :
 *      Function is called in case of an UART0 interrupt
 *      forward function call to corresponding interrupt handler
 ** ===================================================================
 */
void UART0_IRQHandler( void )
{
    if ( g_ISRFktNr_Modules[UART0_IRQ_INDEX][(uint8_t)0] != (uint8_t)0xFFu )
    {
        ( *g_IRQArr[g_ISRFktNr_Modules[UART0_IRQ_INDEX][(uint8_t)0]] )();
    }
    //uart0IntHandler();
}
#endif

#ifdef _ADCUSED_
/*
 ** ===================================================================
 *   Method      :  ADC0_IRQHandler
 *
 *   Parameters: none
 *   Return value: none
 *
 *   Description :
 *      Function is called in case of an ADC0 interrupt
 *      forward function call to corresponding interrupt handler
 ** ===================================================================
 */
void ADC0_IRQHandler( void )
{
    if ( g_ISRFktNr_Modules[ADC0_IRQ_INDEX][(uint8_t)0] != (uint8_t)0xFFu )
    {
        ( *g_IRQArr[g_ISRFktNr_Modules[ADC0_IRQ_INDEX][(uint8_t)0]] )();
    }
    //rtcIntHandler();
}
#endif

#ifdef _TIMERUSED_
#ifdef _TPMUSED_
/*
 ** ===================================================================
 *   Method      :  TPM0_IRQHandler
 *
 *   Parameters: none
 *   Return value: none
 *
 *   Description :
 *      Function is called in case of an TPM0 interrupt
 *      there is no distinction between the several possible interrupts from the TPM module
 *      thus there is in evaluation which channel caused the interrupt and the corresponding action is then taken
 ** ===================================================================
 */
void TPM0_IRQHandler( void )
{
    uint8_t tpm0Channels = ( (uint8_t) ( TPM0_BASE_PTR->STATUS & (uint32_t)0x3Fu ) );
    TPM0_BASE_PTR->STATUS |= (uint32_t)0x13Fu;    // CLEAR EVERYTHING ( TOF AND CHxFs )
#ifdef _RTOSUSED_
    gOS_FLAGS.gWokenUp = (uint8_t)0x1u;
#endif
#ifdef __DEBUG__
#ifdef __DEBUG__FLOW__
    WRITE_TO_MSG_BUFF( gSysMsg, "TPM0" );
#endif
#endif
    if ( tpm0Channels & (uint8_t)0x01u )
    {
//Channel 0
        startTPMChannel( (uint8_t)0x0u, (uint8_t)0x0u );
        if ( g_ISRFktNr_Modules[TPM0_IRQ_INDEX][(uint8_t)0] != (uint8_t)0xFFu )
        {
            ( *g_IRQArr[g_ISRFktNr_Modules[TPM0_IRQ_INDEX][(uint8_t)0]] )();
        }
    }
    if ( tpm0Channels & (uint8_t)0x02u )
    {
//Channel 1
        startTPMChannel( (uint8_t)0x0u, (uint8_t)0x1u );
        if ( g_ISRFktNr_Modules[TPM0_IRQ_INDEX][(uint8_t)1] != (uint8_t)0xFFu )
        {
            ( *g_IRQArr[g_ISRFktNr_Modules[TPM0_IRQ_INDEX][(uint8_t)1]] )();
        }
    }
    if ( tpm0Channels & (uint8_t)0x04u )
    {
//Channel 2
        startTPMChannel( (uint8_t)0x0u, (uint8_t)0x2u );
        if ( g_ISRFktNr_Modules[TPM0_IRQ_INDEX][(uint8_t)2] != (uint8_t)0xFFu )
        {
            ( *g_IRQArr[g_ISRFktNr_Modules[TPM0_IRQ_INDEX][(uint8_t)2]] )();
        }
    }
    if ( tpm0Channels & (uint8_t)0x08u )
    {
//Channel 3
        startTPMChannel( (uint8_t)0x0u, (uint8_t)0x3u );
        if ( g_ISRFktNr_Modules[TPM0_IRQ_INDEX][(uint8_t)3] != (uint8_t)0xFFu )
        {
            ( *g_IRQArr[g_ISRFktNr_Modules[TPM0_IRQ_INDEX][(uint8_t)3]] )();
        }
    }
    if ( tpm0Channels & (uint8_t)0x10u )
    {
//Channel 4
        startTPMChannel( (uint8_t)0x0u, (uint8_t)0x4u );
        if ( g_ISRFktNr_Modules[TPM0_IRQ_INDEX][(uint8_t)4] != (uint8_t)0xFFu )
        {
            ( *g_IRQArr[g_ISRFktNr_Modules[TPM0_IRQ_INDEX][(uint8_t)4]] )();
        }
    }
    if ( tpm0Channels & (uint8_t)0x20u )
    {
//Channel 5
        startTPMChannel( (uint8_t)0x0u, (uint8_t)0x5u );
        if ( g_ISRFktNr_Modules[TPM0_IRQ_INDEX][(uint8_t)5] != (uint8_t)0xFFu )
        {
            ( *g_IRQArr[g_ISRFktNr_Modules[TPM0_IRQ_INDEX][(uint8_t)5]] )();
        }
    }
}

/*
 ** ===================================================================
 *   Method      :  TPM1_IRQHandler
 *
 *   Parameters: none
 *   Return value: none
 *
 *   Description :
 *      Function is called in case of an TPM1 interrupt
 *      there is no distinction between the several possible interrupts from the TPM module
 *      thus there is in evaluation which channel caused the interrupt and the corresponding action is then taken
 ** ===================================================================
 */
void TPM1_IRQHandler( void )
{
    uint8_t tpm1Channels = ( (uint8_t) ( TPM1_BASE_PTR->STATUS & (uint32_t)0x3Fu ) );
    TPM1_BASE_PTR->STATUS |= (uint32_t)0x13Fu;    // CLEAR EVERYTHING
#ifdef _RTOSUSED_
    gOS_FLAGS.gWokenUp = (uint8_t)0x1u;
#endif
#ifdef __DEBUG__
#ifdef __DEBUG__FLOW__
    WRITE_TO_MSG_BUFF( gSysMsg, "TPM1" );
#endif
#endif
    if ( tpm1Channels & (uint8_t)0x1u )
    {
//Channel 0
        startTPMChannel( (uint8_t)0x1u, (uint8_t)0x0u );
        if ( g_ISRFktNr_Modules[TPM1_IRQ_INDEX][(uint8_t)0] != (uint8_t)0xFFu )
        {
            ( *g_IRQArr[g_ISRFktNr_Modules[TPM1_IRQ_INDEX][(uint8_t)0]] )();
        }
    }
    if ( tpm1Channels & (uint8_t)0x2u )
    {
//Channel 1
        startTPMChannel( (uint8_t)0x1u, (uint8_t)0x1u );
        if ( g_ISRFktNr_Modules[TPM1_IRQ_INDEX][(uint8_t)1] != (uint8_t)0xFFu )
        {
            ( *g_IRQArr[g_ISRFktNr_Modules[TPM1_IRQ_INDEX][(uint8_t)1]] )();
        }
    }
}
#endif

#ifdef _RTCUSED_
/*
 ** ===================================================================
 *   Method      :  RTC_IRQHandler
 *
 *   Parameters: none
 *   Return value: none
 *
 *   Description :
 *      Function is called in case of an RTC interrupt
 *      forward function call to corresponding interrupt handler
 ** ===================================================================
 */
void RTC_IRQHandler( void )
{
    if ( g_ISRFktNr_Modules[RTC_IRQ_INDEX][(uint8_t)0] != (uint8_t)0xFFu )
    {
        ( *g_IRQArr[g_ISRFktNr_Modules[RTC_IRQ_INDEX][(uint8_t)0]] )();
    }
    //rtcIntHandler();
}

/*
 ** ===================================================================
 *   Method      :  RTC_Seconds_IRQHandler
 *
 *   Parameters: none
 *   Return value: none
 *
 *   Description :
 *      Function is called in case of an RTC_Seconds interrupt
 *      forward function call to corresponding interrupt handler
 ** ===================================================================
 */
void RTC_Seconds_IRQHandler( void )
{
    if ( g_ISRFktNr_Modules[RTC_Seconds_IRQ_INDEX][(uint8_t)0] != (uint8_t)0xFFu )
    {
        ( *g_IRQArr[g_ISRFktNr_Modules[RTC_Seconds_IRQ_INDEX][(uint8_t)0]] )();
    }
    //rtcIntHandler();
}
#endif

#ifdef _PITUSED_
/*
 ** ===================================================================
 *   Method      :  PIT_IRQHandler
 *
 *   Parameters: none
 *   Return value: none
 *
 *   Description :
 *      Function is called in case of an PIT interrupt
 *      forward function call to corresponding interrupt handler
 ** ===================================================================
 */
void PIT_IRQHandler( void )
{
    if ( g_ISRFktNr_Modules[PIT_IRQ_INDEX][(uint8_t)0] != (uint8_t)0xFFu )
    {
        ( *g_IRQArr[g_ISRFktNr_Modules[PIT_IRQ_INDEX][(uint8_t)0]] )();
    }
    //pitIntHandler();
}
#endif

#if ( ( defined( _LPTMRUSED_ ) && !defined( _RTOSUSED_ ) ) || defined ( __LP__DEBUG__ ) )
/*
 ** ===================================================================
 *   Method      :  LPTMR0_IRQHandler
 *
 *   Parameters: none
 *   Return value: none
 *
 *   Description :
 *      Function is called in case of an LPTMR0 interrupt
 *      forward function call to corresponding interrupt handler
 ** ===================================================================
 */
void LPTMR0_IRQHandler( void )
{
    /* RES[31:8]; TCF = 1; TIE = **; TPS = **; TPP = **; TFC = **; TMS = **; TEN = ** */
    LPTMR0_BASE_PTR->CSR |= LPTMR_CSR_TCF_MASK;
#ifdef __LP__DEBUG__
    // DISABLE LPTMR --- NO LONGER USED
    /* RES[31:8]; TCF = 0; TIE = 0; TPS = 0; TPP = 0; TFC = 0; TMS = 0; TEN = 0 */
    LPTMR0_BASE_PTR->CSR = (uint32_t) 0x0u;    // clear the register to reset
    SIM_BASE_PTR->SCGC5 &= ( (uint32_t) ( ~SIM_SCGC5_LPTMR_MASK ) );    // disable LPTMR clock
    NVIC_ClearPendingIRQ( LPTMR0_IRQn );
#endif
    if ( g_ISRFktNr_Modules[LPTMR0_IRQ_INDEX][(uint8_t)0] != (uint8_t)0xFFu )
    {
        ( *g_IRQArr[g_ISRFktNr_Modules[LPTMR0_IRQ_INDEX][(uint8_t)0]] )();
    }
}
#endif
#endif

#ifdef _PORTAINT_
/*
 ** ===================================================================
 *   Method      :  PORTA_IRQHandler
 *
 *   Parameters: none
 *   Return value: none
 *
 *   Description :
 *      Function is called in case of an PORTA interrupt
 *      forward function call to corresponding interrupt handler
 ** ===================================================================
 */
void PORTA_IRQHandler( void )
{
    EfiFreePIN causingPin = (EfiFreePIN) 0x0u;
    __disable_irq();
    __IO uint32_t *isfr = &PORTA_BASE_PTR->ISFR;

    while ( ( ( ( *isfr/* = PORTA_BASE_PTR->ISFR */) >> causingPin++ )
                    & ( (uint32_t) 0x1u ) )
            != ( (uint32_t) 0x1u ) )
    {
        ;
    }
    causingPin--;
    *isfr |= (uint32_t) ( (uint32_t)0x1u << causingPin );
    if ( g_ISRFktNr_Modules[PORTA_IRQ_INDEX][causingPin] != (uint8_t)0xFFu )
    {
        ( *g_IRQArr[g_ISRFktNr_Modules[PORTA_IRQ_INDEX][causingPin]] )();
    }

    //causingPin |= 0x0000u;    // PORTA
    //portIRQHandler( PORTA_BASE_PTR, causingPin );
    __enable_irq();
}
#endif

#ifdef _PORTBINT_
/*
 ** ===================================================================
 *   Method      :  PORTB_IRQHandler
 *
 *   Parameters: none
 *   Return value: none
 *
 *   Description :
 *      Function is called in case of an PORTB interrupt
 *      forward function call to corresponding interrupt handler
 ** ===================================================================
 */
void PORTB_IRQHandler( void )
{
    EfiFreePIN causingPin = (EfiFreePIN) 0x0u;
    __disable_irq();
    __IO uint32_t *isfr = &PORTB_BASE_PTR->ISFR;

    while ( ( ( ( *isfr/* = PORTB_BASE_PTR->ISFR */) >> causingPin++ )
                    & ( (uint32_t) 0x1u ) )
            != ( (uint32_t) 0x1u ) )
    {
        ;
    }

    causingPin--;
    if ( g_ISRFktNr_Modules[PORTB_IRQ_INDEX][causingPin] != (uint8_t)0xFFu )
    {
        ( *g_IRQArr[g_ISRFktNr_Modules[PORTB_IRQ_INDEX][causingPin]] )();
    }
    *isfr |= (uint32_t) ( (uint32_t)0x1u << causingPin );
    __enable_irq();
}
#endif
/////configuration

/*
 ** ===================================================================
 *   Method      :  setSensingForPin
 *
 *   Parameters:
 *   	const EfiFreePIN        pin			pin, which will be set to react to the defined event
 *   	const interruptEvent    sensing		defines the event that triggers an interrupt (HIGH LEVEL, LOW LEVEL, FALLING EDGE, RISING EDGE, EITHER EDGE, NONE)
 *   Return value: none
 *
 *   Description :
 *   	Set up an interrupt according to the desired event on the specified pin
 ** ===================================================================
 */
void setSensingForPin( const EfiFreePIN pin, const interruptEvent sensing )
{
    __IO uint32_t *regPin_PCR = &PORT_PCR_REG(
            ( ( PORTNR( pin ) ) ? PORTB : PORTA ), PINNR( pin ) );
    GPIO_PDDR_REG((PORTNR(pin)) ? GPIOB : GPIOA ) &= ~PINMASK( pin );    // set pin on port as input
    /* RES[31:25]; ISF = 1; RES[23:20]; IRQC = sensing; RES[15:11]; MUX = **; RES; DSE = **; RES; PFE = **; SRE = **; PE = **; PS = ** */
    *regPin_PCR &= ~PORT_PCR_IRQC_MASK;    // clear IRQC
    *regPin_PCR |= PORT_PCR_IRQC( sensing );    // set new interrupt sensing (rising/falling/either edge, logic one/zero, etc...)
}
