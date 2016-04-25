/*
 * R_RTOS_Declarations.h
 *
 *  Created on: 17.12.2015
 *      Author: neubergerch50344
 */

#ifndef HEADERS_R_RTOS_DECLARATIONS_H_
#define HEADERS_R_RTOS_DECLARATIONS_H_

#include "R_RTOS_inc.h"

extern BitsOSFlags gOS_FLAGS;
extern TskTCB *p_cur_tsk_tcb;                // Pointer to current Task's TCB
extern TskTCB *pIDLETsk;    // Array of task TCBs
extern volatile uint32_t svc_EXCReturn;

extern void sem_InitSems( void );

extern RetCode os_IDLETsk(
                    TskStartAddr strtAddr,
                    TskStartAddr endAddr/*, StackPtr stackPtr */);
extern RetCode os_tskCreate(
                            TskPrio taskPrio,
                            TskID tskID,
                            TskStartAddr strtAddr,
                            TskStartAddr endAddr );
extern RetCode tskActv( TskID tskID );
extern RetCode os_tskDestroy( TskID tskID );

#endif /* HEADERS_R_RTOS_DECLARATIONS_H_ */
