/**
 * \file    ClockFunc.c
 * \author  Christian Neuberger (NeubergerCh50344@th-nuernberg.de)
 * \date    20.10.2015
 *
 */

#include "MKL05Z4.h"
#include "ClockFunc.h"

/*
 ** ===================================================================
 *   Method      :  getBusClk
 *
 *   Parameters:    none
 *
 *   Return value:
 *      const uint32_t  BusCLK  CurrentValue of the bus clock
 *
 *   Description :
 *      Return the current value of the bus clock's speed
 ** ===================================================================
 */
uint32_t getBusClk(void)
{
    SystemCoreClockUpdate();
	return ((uint32_t)((uint32_t)SystemCoreClock / (uint32_t)(((SIM->CLKDIV1 & SIM_CLKDIV1_OUTDIV4_MASK) >> SIM_CLKDIV1_OUTDIV4_SHIFT) + 1)));
}
