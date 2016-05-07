/**
 * \file    PortFunc.c
 * \author  Christian Neuberger (NeubergerCh50344@th-nuernberg.de)
 * \date    12.10.2015
 *
 */

#include "MKL05Z4.h"
#include "PortFunc.h"


/*
 ** ===================================================================
 *   Method      :  initPin
 *
 *   Parameters:
 *   	const EfiFreePIN    pin     pin to be initialized (see EfiFreePins DEFINES) !!! USE INPUT_PIN AND OUTPUT_PIN MAKROS FOR *pin* !!!
 *   	const uint8_t       mode    mode the pin is initialized with (see reference manual for description)
 *   	const uint8_t       pullUp  boolean value which determines wether the pin is initialized with or without pull up
 *   Return value: none
 *
 *   Description :
 *   	Initialize a single pin according to mode and pullup settings
 *   	-!!!WRAP INPUT PARAMATER 'pin' IN EITHER INPUT_PIN(pin) or OUTPUT_PIN(pin) MAKRO!!!-
 *   	IF YOU DO NOT WRAP THE 'pin' PARAMETER IN EITHER OF THESE MAKROS IT WILL BE AN INPUT BY DEFAULT
 *   	This Function can be called multiple times to allow switching from input to output and vice versa -!!!BE CAREFUL WITH MIXING INPUT AND OUTPUT THOUGH!!!-
 ** ===================================================================
 */
void initPin( const EfiFreePIN pin, const uint8_t mode, const uint8_t pullUp )
{
    if ( (pin & (EfiFreePIN)0xFFu) != NC )
    {
        // enable clock gating vor PORTx
        SIM_SCGC5 |= ( PORTNR( pin ) ) ? SIM_SCGC5_PORTB_MASK : SIM_SCGC5_PORTA_MASK; /* Clock */
//        BME_OR_W(&SIM_BASE_PTR->SCGC5, ( PORTNR( pin ) ) ? SIM_SCGC5_PORTB_MASK : SIM_SCGC5_PORTA_MASK);
        // set PORTx_PCR
        __IO uint32_t *regPin_PCR = &PORT_PCR_REG( ( PORTNR( pin ) ) ? PORTB : PORTA, PINNR( pin ) );

        /* RES[31-25]; ISF = **; RES[23-20]; IRQC = **; RES[15-11]; MUX = mode; 0*/
        *regPin_PCR &= (uint32_t)(~PORT_PCR_MUX_MASK);          // clear MUX settings
//        BME_AND_W(regPin_PCR, (uint32_t)(~PORT_PCR_MUX_MASK));
        *regPin_PCR |= (uint32_t)( PORT_PCR_MUX( mode ) );    // set according to alternative
//        BME_OR_W(regPin_PCR, (uint32_t)(PORT_PCR_MUX( mode )));
        if( pin & (EfiFreePIN)0x0100u )
        {
            //set bit for pin in PORTx_PDDR to output (logical high)
            GPIO_PDDR_REG((PORTNR(pin)) ? GPIOB : GPIOA) |= PINMASK( pin );    //set port to output
//            BME_OR_W(&GPIO_PDDR_REG((PORTNR(pin)) ? GPIOB : GPIOA), (uint32_t)(PINMASK( pin )));
        }
        else
        {
            //set bit for pin in PORTx_PDDR to input (logical low)
            GPIO_PDDR_REG((PORTNR(pin)) ? GPIOB : GPIOA) &= ~PINMASK( pin );    //set port to input
//            BME_AND_W(&GPIO_PDDR_REG((PORTNR(pin)) ? GPIOB : GPIOA), (uint32_t)(~PINMASK( pin )));
        }

        if ( pullUp != (uint8_t)0x0u )
        {
            *regPin_PCR |= (uint32_t)(PORT_PCR_PE_MASK | PORT_PCR_PS_MASK);    // set pullup
//            BME_OR_W(regPin_PCR, (uint32_t)(PORT_PCR_PE_MASK | PORT_PCR_PS_MASK));
        }
        else
        {
            *regPin_PCR &= (uint32_t)(~( PORT_PCR_PE_MASK | PORT_PCR_PS_MASK ));    // reset pullup
//            BME_AND_W(regPin_PCR, (uint32_t)(~((uint32_t)(PORT_PCR_PE_MASK | PORT_PCR_PS_MASK))));
        }
    }
}

/*
 ** ===================================================================
 *   Method      :  setPin --- DEPRECATED; USE SET_PIN_HIGH(pin) OR SET_PIN_LOW(pin) MAKRO --- KEPT FOR DOWNWARD COMPATIBILITY
 *
 *   Parameters:
 *   	const EfiFreePIN    pin    pin to be set (see EfiFreePins DEFINES)
 *   	const uint8_t       val    logic level the pin shall drive
 *
 *   Return value: none
 *
 *   Description :
 *   	set a logic level on a pin
 ** ===================================================================
 */
void setPin( const EfiFreePIN pin, const uint8_t val ) // DEPRECATED; USE SET_PIN_HIGH(pin) OR SET_PIN_LOW(pin) MAKRO --- KEPT FOR DOWNWARD COMPATIBILITY
{
    if ( pin != NC )
    {
        GPIO_Type * port = (PORTNR(pin)) ? GPIOB : GPIOA;
        //set PORTx_PDDR to output (logical high)
        GPIO_PDDR_REG(port) |= PINMASK( pin );    //set port to output
        //set PORTx_PDOR for requested PIN according to requested val
        __O uint32_t *registerToBeSet = ((val) ? (&GPIO_PSOR_REG(port)) : (&GPIO_PCOR_REG(port)));  // Use either PSOR to set or PCOR to clear a bit in PDOR --> no need to evaluate pin state
        *registerToBeSet |= PINMASK(pin);
    }
}

/*
 ** ===================================================================
 *   Method      :  togglePin --- DEPRECATED; USE TOGGLE_PIN(pin) MAKRO! --- KEPT FOR DOWNWARD COMPATIBILITY
 *
 *   Parameters:
 *   	const EfiFreePIN    pin    pin to be toggled (see EfiFreePins DEFINES)
 *
 *   Return value: none
 *
 *   Description :
 *   	toggle the logic level of a pin
 ** ===================================================================
 */
void togglePin( const EfiFreePIN pin ) // DEPRECATED; USE TOGGLE_PIN(pin) MAKRO!
{
    if ( pin != NC )
    {
        GPIO_Type * port = (PORTNR(pin)) ? GPIOB : GPIOA;
        //set PORTx_PDDR to output (logical high)
        GPIO_PDDR_REG(port) |= PINMASK( pin );    //set port to output
        //XOR(toggle) PORTx_PDOR for requested PIN according to requested val
        GPIO_PTOR_REG(port) |= PINMASK( pin );
    }
}

/*
 ** ===================================================================
 *   Method      :  readPin --- DEPRECATED; USE READ_PIN(pin)  MAKRO --- KEPT FOR DOWNWARD COMPATIBILITY
 *
 *   Parameters:
 *   	const EfiFreePIN    pin    		pin to be read (see EfiFreePins DEFINES)
 *
 *   Return value:
 *   	uint8_t             pinLevel    read back logic level of the specified pin
 *
 *   Description :
 *   	read the current logic level of a specified pin and return it
 ** ===================================================================
 */
uint8_t readPin( const EfiFreePIN pin ) // DEPRECATED; USE READ_PIN(pin)  MAKRO --- KEPT FOR DOWNWARD COMPATIBILITY
{
    uint8_t pinLevel = (uint8_t)0xFFu;
    if ( pin != NC )
    {
        __IO uint32_t *regGPIO_PDDR = &GPIO_PDDR_REG(
                ( PORTNR( pin ) ) ? GPIOB : GPIOA );
        // set port to input
        *regGPIO_PDDR &= ~PINMASK( pin );
        //read ports pdir
        pinLevel = (uint8_t) ( ( GPIO_PDIR_REG( ( PORTNR( pin ) ) ? GPIOB : GPIOA ) & PINMASK( pin ) )
                >> PINNR( pin ) );
    }
    return pinLevel;
}
