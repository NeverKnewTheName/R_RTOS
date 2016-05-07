/**
 * \file    InterruptFunc.h
 * \author  Christian Neuberger (NeubergerCh50344@th-nuernberg.de)
 * \date    12.10.2015
 *
 */

#ifndef HEADERS_INTERRUPTFUNC_H_
#define HEADERS_INTERRUPTFUNC_H_

//*********************************************************************************************
// includes
//*********************************************************************************************

#include "MKL05Z4.h"

//*********************************************************************************************
// includes //
//*********************************************************************************************

//*********************************************************************************************
// defines
//*********************************************************************************************

#define NVIC_NUM_VECTORS ((uint8_t)(16u + 32u))   // CORE + MCU Peripherals
#define NVIC_USER_IRQ_OFFSET  ((uint8_t)16u)
#define NUMBER_CORE_VECS ((uint8_t)16u)

typedef uint8_t IntEdge;

// Interrupt edge flags
#define INT_NONE ((IntEdge)0x0u)
#define INT_FALL ((IntEdge)0xAu)
#define INT_RISE ((IntEdge)0x9u)
#define INT_EITHEREDGE ((IntEdge)0xBu)
#define INT_ZERO ((IntEdge)0x8u)
#define INT_ONE ((IntEdge)0xCu)

//InterruptHandler array indices
//#define SPI0_IRQ_INDEX ((IRQIndex)0x1u)
//#define UART0_IRQ_INDEX ((IRQIndex)0x2u)
//#define ADC0_IRQ_INDEX ((IRQIndex)0x3u)
//#define TPM0_IRQ_INDEX ((IRQIndex)0x4u)
//#define TPM1_IRQ_INDEX ((IRQIndex)0x5u)
//#define RTC_IRQ_INDEX ((IRQIndex)0x6u)
//#define RTC_Seconds_IRQ_INDEX ((IRQIndex)0x7u)
//#define PIT_IRQ_INDEX ((IRQIndex)0x8u)
//#define LPTMR0_IRQ_INDEX ((IRQIndex)0x9u)
//#define PORTA_IRQ_INDEX ((IRQIndex)0xAu)
//#define PORTB_IRQ_INDEX ((IRQIndex)0xBu)

//*********************************************************************************************
// defines //
//*********************************************************************************************

//*********************************************************************************************
// typedefs
//*********************************************************************************************

//typedef uint16_t EfiFreePIN;
typedef uint8_t interruptEvent;

typedef void
(*FuncPtr)( void );

typedef uint8_t IRQIndex;

typedef enum IRQIndices
{
    zeroIRQ = (IRQIndex) 0x0u,
#ifdef _SPIUSED_
    SPI0_IRQ_INDEX,
#endif
#ifdef _UARTUSED_
    UART0_IRQ_INDEX,
#endif
#ifdef _ADCUSED_
    ADC0_IRQ_INDEX,
#endif
    TPM0_IRQ_INDEX,
    TPM1_IRQ_INDEX,
#ifdef _RTCUSED_
    RTC_IRQ_INDEX,
    RTC_Seconds_IRQ_INDEX,
#endif
    PIT_IRQ_INDEX,
    LPTMR0_IRQ_INDEX,
    PORTA_IRQ_INDEX,
    PORTB_IRQ_INDEX
} IRQIndexEnum;
//*********************************************************************************************
// typedefs //
//*********************************************************************************************

void installIrq( FuncPtr func, uint8_t module, uint8_t entity );

// DO NOT USE deinstallIrq
// DOES NOT WORK
// UNFINISHED
void deinstallIrq( IRQIndex module, uint8_t entity );

#ifdef _SPIUSED_
void SPI0_IRQHandler( void );
#endif
#ifdef _UARTUSED_
void UART0_IRQHandler( void );
#endif
#ifdef _ADCUSED_
void ADC0_IRQHandler( void );
#endif
void TPM0_IRQHandler( void );

void TPM1_IRQHandler( void );
#ifdef _RTCUSED_
void RTC_IRQHandler( void );

void RTC_Seconds_IRQHandler( void );
#endif
void PIT_IRQHandler( void );
void LPTMR0_IRQHandler( void );
void PORTA_IRQHandler( void );
void PORTB_IRQHandler( void );
void setSensingForPin( const uint16_t pin, const interruptEvent sensing );

/*
 ** ===================================================================
 *   Method      :  enableIRQ
 *
 *   Parameters:
 *      irqNr       Number of the interrupt routine that shall be enabled
 *   Return value: none
 *
 *   Description :
 *      clear all pending interrupts for the specified IRQ and enable the specified IRQ afterwards
 ** ===================================================================
 */
#define enableIRQ( irqNr ) NVIC_ClearPendingIRQ( irqNr ); NVIC_EnableIRQ( irqNr )

/*
 ** ===================================================================
 *   Method      :  enableIRQ
 *
 *   Parameters:
 *      irqNr       Number of the interrupt routine that shall be disabled
 *   Return value: none
 *
 *   Description :
 *      disable the specified IRQ
 ** ===================================================================
 */
#define disableIRQ( irqNr ) NVIC_DisableIRQ( irqNr )

/*
 ** ===================================================================
 *   Method      :  clearPending
 *
 *   Parameters:
 *      irqNr       Number of the interrupt routine whose pending interrupts shall be cleared
 *   Return value: none
 *
 *   Description :
 *      clear all pending interrupts for the specified IRQ
 ** ===================================================================
 */
#define clearPending( irqNr ) NVIC_ClearPendingIRQ( irqNr )


/*
 ** ===================================================================
 *   Method      :  setIRQPrio
 *
 *   Parameters:
 *      irqNr       Number of the interrupt routine whose priority shall be set
 *      prio        Priority the IRQ shall have (3 is the lowest)
 *   Return value: none
 *
 *   Description :
 *      Set a priority for an IRQ (3 is lowest)
 ** ===================================================================
 */
#define setIRQPrio( irqNr, prio ) NVIC_SetPriority( irqNr, prio )

#endif /* HEADERS_INTERRUPTFUNC_H_ */
