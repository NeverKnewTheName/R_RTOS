/*
 * R_RTOS_irqMngr.h
 *
 *  Created on: 07.04.2016
 *      Author: neubergerch50344
 */

#ifndef HEADERS_R_RTOS_IRQMNGR_H_
#define HEADERS_R_RTOS_IRQMNGR_H_

#include "R_RTOS_inc.h"

#define NUM_ISR (uint8_t)48u
#define ISRHANDL_INVALID_NR (ISRHandlNr)0xFFu
#define IRQHANDL_INVALID_NR (IRQHandlNr)0xFFu


#define NR_IRQ_HANDLES (uint8_t)0x4u


typedef FktCall ISRFkt, *PISRFkt;
typedef FktCall IRQFkt, *PIRQFkt;

typedef uint8_t IRQNr;
typedef uint8_t IRQHandlNr, *PIRQHandlNr;
typedef uint8_t IRQModuleNr;
typedef uint8_t ISRHandlNr, *PISRHandlNr;


typedef struct irqHandlStruc
{
    ISRFkt *isrFkt;
    uint32_t isrFktSlots;
} IRQHandl, *PIRQHandl;

RetCode irqMngr_INIT( void );

RetCode irqMngr_installIRQ( const IRQFkt const irqFkt, IRQNr irqNr );

#endif /* HEADERS_R_RTOS_IRQMNGR_H_ */
