/*
 * R_RTOS_irqMngr.c
 *
 *  Created on: 07.04.2016
 *      Author: neubergerch50344
 */

#include "R_RTOS_irqMngr.h"
#include "R_RTOS_inc.h"
#include "R_RTOS_memMngr.h"
#include "R_RTOS_BitMagic.h"

#include "MKL05Z4.h"

extern ISRFkt __isr_vector;
extern ISRFkt RAM_VEC_TBL;

static PISRFkt const isrFkt_AR/*[NUM_ISR]*/= ( &RAM_VEC_TBL );


uint32_t irqHandlSlots;
IRQHandl irqHandls_AR[NR_IRQ_HANDLES ];

static void BREAK( void )
{
    while ( 1 )
    {
        ;
    }
}

RetCode irqMngr_INIT( void )
{
    PISRFkt old_vectors = &__isr_vector;
    uint8_t cntr = NUM_ISR;
    while ( cntr-- )
    {
        isrFkt_AR[cntr] = old_vectors[cntr];
    }
    SCB->VTOR = (uint32_t) &RAM_VEC_TBL;

    irqHandlSlots = 0x1u << NR_IRQ_HANDLES;
    irqHandlSlots = ((irqHandlSlots)|(-(irqHandlSlots)));
    cntr = NR_IRQ_HANDLES;
    while ( cntr-- )
    {
        irqHandls_AR[cntr].isrFktSlots = 0x0u;
        irqHandls_AR[cntr].isrFkt = (IRQFkt) NULL;
    }

    return RET_OK;
}

RetCode irqMngr_initIRQHandl(
                              PIRQHandlNr const irqHandlNr,
                              const uint8_t nrOfISRs )
{
    PIRQHandl irqHandl;
    if ( *irqHandlNr != (IRQHandlNr) IRQHANDL_INVALID_NR )
    {
        // is already in use...
        // free resources
        irqHandl = &irqHandls_AR[*irqHandlNr];
        free(irqHandl->isrFkt);
    } else
    {
        // get free slot (rightmost 0 bit)
        *irqHandlNr = bitM_bitPos((uint32_t)(~((uint32_t)irqHandlSlots))&(((uint32_t)irqHandlSlots)+(uint32_t)1u));
        irqHandl = &irqHandls_AR[*irqHandlNr];
    }

    if ( irqHandl->isrFkt != (ISRFkt *) NULL )
    {
        BREAK();
    }
}

RetCode irqMngr_installIRQ( const IRQFkt const irqFkt, const IRQNr irqNr )
{
    isrFkt_AR[irqNr] = irqFkt;
    return RET_OK;
}

RetCode irqMngr_installISR(
                            const ISRFkt const isrFkt,
                            const IRQHandlNr irqHandlNr,
                            PISRHandlNr const isrHandlNr )
{
    PIRQHandl irqHandl = &irqHandls_AR[irqHandlNr];
    if ( *isrHandlNr == (ISRHandlNr) ISRHANDL_INVALID_NR )
    {
        // get bit position of rightmost 0 bit!
        *isrHandlNr = bitM_bitPos((uint32_t)(~((uint32_t)irqHandl->isrFktSlots))&(((uint32_t)irqHandl->isrFktSlots)+(uint32_t)1u));
    }


    irqHandl->isrFkt[*isrHandlNr] = isrFkt;
}
