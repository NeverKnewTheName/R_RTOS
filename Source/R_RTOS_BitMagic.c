/**
 * \file    R_RTOS_BitMagic.c
 * \author  Christian Neuberger (NeubergerCh50344@th-nuernberg.de)
 * \date    05.03.2016
 *
 * \brief Functions for creating, maintaining and handling tasks.
 */
#define BITMAGIC_SRC

#include "R_RTOS_BitMagic.h"

static const uint8_t bit32PosNrs[] =
{ 0, 1, 2, 24, 3, 19, 6, 25, 22, 4, 20, 10, 16, 7, 12, 26, 31, 23, 18, 5, 21, 9,
  15, 11, 30, 17, 8, 14, 29, 13, 28, 27 };

// Depth - 0
uint8_t bitM_bitPos( uint32_t bits )
{
    // Hacker's Delight p. 112
    return ( bits ) ?
            bit32PosNrs[( (uint32_t) ( bits ) * (uint32_t) 0x04D7651Fu )
                    >> (uint8_t) 0x1Bu] :
            0x0u;
}

//void bitTests( void )
//{
//    uint8_t bitMask;
//    uint8_t error = 0x0u;
//
//    bitMask = 0b11001010;
//    if ( (uint8_t)BITM_RMB_TURN_BIT_OFF( (uint8_t)bitMask ) != (uint8_t)0b11001000 )
//        error |= 0x1;
//    bitMask = 0b11000101;
//    if ( (uint8_t)BITM_RMB_TURN_BIT_ON( (uint8_t)bitMask ) != (uint8_t)0b11000111 )
//        error |= 0x2;
//    bitMask = 0b10101111;
//    if ( (uint8_t)BITM_RMB_TURN_TRAIL_OFF( (uint8_t)bitMask ) != (uint8_t)0b10100000 )
//        error |= 0x4;
//    bitMask = 0b10100000;
//    if ( (uint8_t)BITM_RMB_TURN_TRAIL_ON( (uint8_t)bitMask ) != (uint8_t)0b10111111 )
//        error |= 0x8;
//    bitMask = 0b10101111;
//    if ( (uint8_t)BITM_RMB_EXTRCT_SNGL_OFF( (uint8_t)bitMask ) != (uint8_t)0b00010000 )
//        error |= 0x10;
//    bitMask = 0b0100100;
//    if ( (uint8_t)BITM_RMB_EXTRCT_SNGL_ON( (uint8_t)(uint8_t)bitMask ) != (uint8_t)0b11111011 )
//        error |= 0x11;
//    bitMask = 0b10101000;
//    if ( BITM_RMB_EXTRCT_TRAIL_OFF( (uint8_t)bitMask ) != (uint8_t)0b00000111 )
//        error |= 0x11;
//    bitMask = 0b0100111;
//    if ( (uint8_t)BITM_RMB_EXTRCT_TRAIL_ON( (uint8_t)bitMask ) != (uint8_t)0b11111000 )
//        error |= 0x12;
//    bitMask = 0b10101100;
//    if ( (uint8_t)BITM_RMB_ISOLT_ON( (uint8_t)bitMask ) != (uint8_t)0b00000100 )
//        error |= 0x14;
//
//    if(error)
//        while(1){;}
//}

