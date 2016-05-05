/**
 * \file    PortFunc.h
 * \author  Christian Neuberger (NeubergerCh50344@th-nuernberg.de)
 * \date    12.10.2015
 *
 */


#ifndef HEADERS_PORTFUNC_H_
#define HEADERS_PORTFUNC_H_

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

typedef uint16_t PortPIN;
typedef PortPIN EfiFreePIN;

#define NC   ((PortPIN)0xFFu)
#define PTA0 ((PortPIN)0x0u)
#define PTA1 ((PortPIN)0x4u)
#define PTA2 ((PortPIN)0x8u)
#define PTA3 ((PortPIN)0xcu)
#define PTA4 ((PortPIN)0x10u)
#define PTA5 ((PortPIN)0x14u)
#define PTA6 ((PortPIN)0x18u)
#define PTA7 ((PortPIN)0x1cu)
#define PTA8 ((PortPIN)0x20u)
#define PTA9 ((PortPIN)0x24u)
#define PTA10 ((PortPIN)0x28u)
#define PTA11 ((PortPIN)0x2cu)
#define PTA12 ((PortPIN)0x30u)
#define PTA13 ((PortPIN)0x34u)
#define PTA14 ((PortPIN)0x38u)
#define PTA15 ((PortPIN)0x3cu)
#define PTA16 ((PortPIN)0x40u)
#define PTA17 ((PortPIN)0x44u)
#define PTA18 ((PortPIN)0x48u)
#define PTA19 ((PortPIN)0x4cu)
#define PTB0 ((PortPIN)0x1000u)
#define PTB1 ((PortPIN)0x1004u)
#define PTB2 ((PortPIN)0x1008u)
#define PTB3 ((PortPIN)0x100cu)
#define PTB4 ((PortPIN)0x1010u)
#define PTB5 ((PortPIN)0x1014u)
#define PTB6 ((PortPIN)0x1018u)
#define PTB7 ((PortPIN)0x101cu)
#define PTB8 ((PortPIN)0x1020u)
#define PTB9 ((PortPIN)0x1024u)
#define PTB10 ((PortPIN)0x1028u)
#define PTB11 ((PortPIN)0x102cu)
#define PTB12 ((PortPIN)0x1030u)
#define PTB13 ((PortPIN)0x1034u)
#define PTB14 ((PortPIN)0x1038u)
#define PTB15 ((PortPIN)0x103cu)
#define PTB16 ((PortPIN)0x1040u)
#define PTB17 ((PortPIN)0x1044u)
#define PTB18 ((PortPIN)0x1048u)
#define PTB19 ((PortPIN)0x104cu)
#define PTB20 ((PortPIN)0x1050)
// Hex codes for the KL05 PINS

#define PIN_SWDCLK PTA0
#define PIN_RESET PTA1
#define PIN_SWDIO PTA2
#define PIN_SOPWR PTA5
#define PIN_MISO PTA6
#define PIN_MOSI PTA7
#define PIN_LED0 OUTPUT_PIN(PTA8)
#define PIN_LED1 OUTPUT_PIN(PTA9)
#define PIN_LED2 OUTPUT_PIN(PTA10)
#define PIN_LED3 OUTPUT_PIN(PTA11)
#define PIN_MICRO PTA12
#define PIN_S PTA13
#define PIN_SCK PTB0
#define PIN_IRQ_TAS0 PTB1
#define PIN_IRQ_CANC PTB2
#define PIN_U_TXD PTB3
#define PIN_U_RXD PTB4
#define PIN_LS PTB5
#define PIN_PCS2_SD PTB6
#define PIN_SD_DETECT PTB7
#define PIN_TAS0 PTB8
#define PIN_TAS1 PTB9
#define PIN_TAS2 PTB10
#define PIN_TAS3 PTB11
#define PIN_PCS1_33999 PTB12
#define PIN_PCS0_CANC PTB13
// EfiFREE pins applied to the KL05


#define PORT_SHIFT (uint8_t)12u

#define PORTSELECT( port_num ) ( ( port_num ) ? PORTB_BASE_PTR : PORTA_BASE_PTR )  // parse port out of port num
#define PTSELECT( port_num ) ( ( port_num ) ? PTB_BASE_PTR : PTA_BASE_PTR )        // parse pt out of port num

#define PORTNR(pin) ((uint8_t)( (PortPIN)pin >> PORT_SHIFT )) // shift until port number is left (port a -> 0, port b -> 1)
#define PINNR(pin)  ((uint8_t)((( (PortPIN)pin & (PortPIN)0xF0FFu ) & (PortPIN)0x7C) >> 0x2u )) // mask with 0x7c ( 1111100 ) and shift to right twice -> get pin number
#define PINMASK(pin) ((uint32_t)( 0x1u << PINNR((PortPIN)pin) ) ) // get mask with bit at position of pin set

#define INPUT_PIN(pin) ((PortPIN)( (PortPIN)pin & 0xF0FFu ))
#define OUTPUT_PIN(pin) ((PortPIN)( (PortPIN)pin | 0x0100u ))

#define GET_PIN_DDR_PORT(pin,port)  (uint32_t)( GPIO_PDDR_REG(port) & PINMASK((PortPIN)pin))
#define GET_PIN_DDR(pin)     GET_PIN_DDR_PORT(pin, ((PORTNR((PortPIN)pin)) ? GPIOB : GPIOA))

#define SET_PIN_HIGH_PORT(pin,port) (((PortPIN)pin != NC) && GET_PIN_DDR_PORT(pin,port)) ? ( GPIO_PSOR_REG(port) |= PINMASK((PortPIN)pin)) : NC     //SET PIN HIGH USING PSOR --- safety: check if pin is output
#define SET_PIN_HIGH(pin)    SET_PIN_HIGH_PORT(pin, ((PORTNR((PortPIN)pin)) ? GPIOB : GPIOA))
#define SET_PIN_LOW_PORT(pin,port)  (((PortPIN)pin != NC) && GET_PIN_DDR_PORT(pin,port)) ? ( GPIO_PCOR_REG(port) |= PINMASK((PortPIN)pin)) : NC     //SET PIN LOW USING PCOR --- safety: check if pin is output
#define SET_PIN_LOW(pin)     SET_PIN_LOW_PORT(pin, ((PORTNR((PortPIN)pin)) ? GPIOB : GPIOA))
#define TOGGLE_PIN_PORT(pin,port)   (((PortPIN)pin != NC) && GET_PIN_DDR_PORT(pin,port)) ? ( GPIO_PTOR_REG(port) |= PINMASK((PortPIN)pin)) : NC     //SET PIN LOW USING PCOR --- safety: check if pin is output
#define TOGGLE_PIN(pin)      TOGGLE_PIN_PORT(pin, ((PORTNR((PortPIN)pin)) ? GPIOB : GPIOA))
#define GET_PIN_LVL_PORT(pin,port)  (uint8_t)((((PortPIN)pin != NC) && GET_PIN_DDR_PORT(pin,port)) ? ((GPIO_PDOR_REG(port) & PINMASK( (PortPIN)pin ) ) >> PINNR( (PortPIN)pin )) : NC)                      //CHECK IF PIN IS HIGH USING PDOR --- safety: check if pin is output
#define GET_PIN_LVL(pin)     GET_PIN_LVL_PORT(pin, ((PORTNR((PortPIN)pin)) ? GPIOB : GPIOA))

#define READ_PIN_PORT(pin,port)     (uint8_t)((((PortPIN)pin == NC) || GET_PIN_DDR_PORT(pin,port)) ? NC : ( GPIO_PDIR_REG(port) & PINMASK( (PortPIN)pin ) ) >> PINNR( (PortPIN)pin )) //READ PIN USING PDIR --- safety: check if pin is input
#define READ_PIN(pin)        READ_PIN_PORT(pin, ((PORTNR((PortPIN)pin)) ? GPIOB : GPIOA))


//*********************************************************************************************
// defines //
//*********************************************************************************************

//*********************************************************************************************
// typedefs
//*********************************************************************************************

//*********************************************************************************************
// typedefs //
//*********************************************************************************************

/*
 ** ===================================================================
 *   Method      :  initPin
 *
 *   Parameters:
 *   	pin    pin to be initialized (see EfiFreePins DEFINES)
 *   	mode   mode the pin is initialized with (see reference manual for description)
 *   	pullUp boolean value which determines wether the pin is initialized with or without pull up
 *   Return value: none
 *
 *   Description :
 *   	Initialize a single pin
 ** ===================================================================
 */
void initPin( const EfiFreePIN pin, const uint8_t mode, const uint8_t pullUp );

/*
 ** ===================================================================
 *   Method      :  setPin
 *
 *   Parameters:
 *   	pin    pin to be set (see EfiFreePins DEFINES)
 *   	val    logic level the pin shall drive
 *
 *   Return value: none
 *
 *   Description :
 *   	set a logic level on a pin
 ** ===================================================================
 */
void setPin( const EfiFreePIN pin, const uint8_t val );

/*
 ** ===================================================================
 *   Method      :  togglePin
 *
 *   Parameters:
 *   	pin    pin to be toggled (see EfiFreePins DEFINES)
 *
 *   Return value: none
 *
 *   Description :
 *   	toggle the logic level of a pin
 ** ===================================================================
 */
void togglePin( const EfiFreePIN pin );

/*
 ** ===================================================================
 *   Method      :  readPin
 *
 *   Parameters:
 *   	pin    		pin to be read (see EfiFreePins DEFINE)
 *
 *   Return value:
 *   	pinLevel    read logic level of the specified pin
 *
 *   Description :
 *   	read the current logic level of a specified pin and return it
 ** ===================================================================
 */
uint8_t readPin( const EfiFreePIN pin );

#endif /* HEADERS_PORTFUNC_H_ */
