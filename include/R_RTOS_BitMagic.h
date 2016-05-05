/**
 * \file    R_RTOS_BitMagic.h
 * \author  Christian Neuberger (NeubergerCh50344@th-nuernberg.de)
 * \date    05.03.2016
 *
 * \brief Functions for manipulating bits and bytes and stuff.
 */

#ifndef HEADERS_R_RTOS_BITMAGIC_H_
#define HEADERS_R_RTOS_BITMAGIC_H_

#include "R_RTOS_inc.h"

// Manipulating rightmost Bits
// Turn off rightmost 1 bit
// 1100 1010 -> 1010 1000
#define BITM_RMB_TURN_BIT_OFF(x) (((uint32_t)x)&(((uint32_t)x)-(uint32_t)1u))
// Turn on rightmost 0 bit
// 1010 0101 -> 1010 0111
#define BITM_RMB_TURN_BIT_ON(x) (((uint32_t)x)|(((uint32_t)x)+(uint32_t)1u))
// Turn off trailing 1's
// 1010 1111 -> 1010 0000
#define BITM_RMB_TURN_TRAIL_OFF(x) (((uint32_t)x)&(((uint32_t)x)+(uint32_t)1u))
// Turn on trailing 0's
// 1010 0000 -> 1011 1111
#define BITM_RMB_TURN_TRAIL_ON(x) (((uint32_t)x)|(((uint32_t)x)-(uint32_t)1u))
// Single 1 bit at position of rightmost 0 bit; zero if none
// 1010 1011 -> 0000 0100
#define BITM_RMB_EXTRCT_SNGL_OFF(x) ((~((uint32_t)x))&(((uint32_t)x)+(uint32_t)1u))
// Single 0 bit at position of rightmost 1 bit; all 1's if none
// 1010 0100 -> 1111 1011
#define BITM_RMB_EXTRCT_SNGL_ON(x) ((~((uint32_t)x))|(((uint32_t)x)-(uint32_t)1u))
// 1 bits instead of trailing 0 bits, 0 bits elsewhere; zero if none
// 1010 1000 -> 0000 0111
#define BITM_RMB_EXTRCT_TRAIL_OFF(x) (~(((uint32_t)x)|(-((uint32_t)x))))
// 0 bits instead of trailing 1 bits, 1 bits elsewhere; all 1's if none
// 1010 0111 -> 1111 1000
#define BITM_RMB_EXTRCT_TRAIL_ON(x) ((~((uint32_t)x))|(((uint32_t)x)+(uint32_t)1u))
// 1 bits instead of trailing 0 bits, 0 bits elsewhere; zero if none
// 1010 1000 -> 0000 0111
#define BITM_RMB_TURN_LEAD_OFF(x) (((uint32_t)x)|(-((uint32_t)x)))
// 0 bits instead of trailing 1 bits, 1 bits elsewhere; all 1's if none
// 1010 0111 -> 1111 1000
#define BITM_RMB_EXTRCT_LEAD_ON(x) ((~((uint32_t)x))|(((uint32_t)x)+(uint32_t)1u))
// isolate rightmost 1 bit; zero if none
// 1010 1100 -> 0000 0100
#define BITM_RMB_ISOLT_ON(x) (((uint32_t)x)&(-((uint32_t)x)))

/** \fn bitM_bitPos(uint32_t bits);
 *
 * @param [in] bits bitarray to query the position of the set bit of
 * @return Position of the set bit in the given bitarray
 *
 * \note returns zero if no bit is set
 */
uint8_t bitM_bitPos(uint32_t bits);

#endif /* HEADERS_R_RTOS_BITMAGIC_H_ */
