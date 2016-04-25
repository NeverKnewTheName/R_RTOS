/**
 * \file    main.c
 * \author  Christian Neuberger (NeubergerCh50344@th-nuernberg.de)
 * \date    07.01.2016
 *
 * \brief Example of using the R_RTOS and its functionalities
 */

#include "MKL05Z4.h"
#include "PortFunc.h"
#include "TimerFunc.h"
#include "InterruptFunc.h"
#include "LPFunc.h"

#include "R_RTOS_services.h"
#include "R_RTOS_system.h"

#include "R_RTOS_irqMngr.h"

#ifdef __DEBUG__
#include <string.h>
#include "DevFunc.h"
char gSysMsg[SYS_MSG_LEN ];
#endif

void portInit( void );

void someFkt( void )
{
    while(1){/*DOSOMEWORK*/;}
}

/** \fn main
 *  \brief Function that is called after start up
 *
 * Initializes the R_RTOS and calls os_StartOS
 */
int main( void )
{
    __disable_irq();
//    SIM_CLKDIV1 &= ~ SIM_CLKDIV1_OUTDIV1_MASK;
//    SIM_CLKDIV1 |= SIM_CLKDIV1_OUTDIV1(0xFu);
//    SystemCoreClockUpdate();
//    SystemCoreClock;

    portInit();
    irqMngr_INIT();
    //irqMngr_installISR(&someFkt, 0x22, 0);
#ifdef __LP__MODE__
    /* WAKE UP SOURCES */
    addWakeUpSource( LLWU_LPTMR0, 0x0u );
    NVIC_ClearPendingIRQ( LLWU_IRQn );
    addWakeUpSource( LLWU_PTB2, INT_FALL );
    /* WAKE UP SOURCES \ */
#endif

    __initOS();
    __enable_irq();

    // CALL OS START
    svc_os_StartOS();

    // do forever
    while ( 1 )
    {
    }
    /* Never leave main */
    return 0;
}

void portInit( void )
{
    // Init all needed modules ********************************************************************
    initPin( PTB5, 0x1u, 0x1u );    // PIN FOR SPEAKER IS NOT CONNECTED; INIT WITH PULLUP
    initPin( OUTPUT_PIN( PIN_LED0 ), 0x1u, 0 );    // red LED
    initPin( OUTPUT_PIN( PIN_LED1 ), 0x1u, 0 );    // yellow LED
    initPin( OUTPUT_PIN( PIN_LED2 ), 0x1u, 0 );    // green LED
    initPin( OUTPUT_PIN( PIN_LED3 ), 0x1u, 0 );    // 'orange' LED

    //initPin( PIN_IRQ_TAS0, 0x1u, 0x1u );    // PIN

    // SET ALL LEDS OFF BY DEFAULT (LOW-ACTIVE)
    SET_PIN_HIGH( PIN_LED0 );
    SET_PIN_HIGH( PIN_LED1 );
    SET_PIN_HIGH( PIN_LED2 );
    SET_PIN_HIGH( PIN_LED3 );
}

/* EOF */
