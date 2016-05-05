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

uint8_t bitM_bitPos( uint32_t bits )
{
    return ( bits ) ?
            bit32PosNrs[( (uint32_t) ( bits ) * (uint32_t) 0x04D7651Fu )
                    >> (uint8_t) 0x1Bu] :
            0x0u;
}

