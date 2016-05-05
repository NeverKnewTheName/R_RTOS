/**
 * \file    ClockFunc.h
 * \author  Christian Neuberger (NeubergerCh50344@th-nuernberg.de)
 * \date    20.10.2015
 *
 */

#ifndef HEADERS_CLOCKFUNC_H_
#define HEADERS_CLOCKFUNC_H_

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
uint32_t getBusClk(void);

#endif /* HEADERS_CLOCKFUNC_H_ */
