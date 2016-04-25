/*
 * iSMG_RTOS_monitor.h
 *
 *  Created on: 21.02.2016
 *      Author: Christian
 */

#ifndef HEADERS_R_RTOS_MONITOR_H_
#define HEADERS_R_RTOS_MONITOR_H_

#include "R_RTOS_inc.h"
#include "R_RTOS_memMngr.h"

#define MEM_OBJECTS_MNTR (uint8_t)0x10u

/**
 * \typedef mntrFlgs
 * \brief 8 bit representation of the current monitor access type
 */
typedef uint8_t mntrFlgs;

/**
 * \enum mntrAccessState
 * \brief Access types for the monitor
 */
typedef enum mntrAccessState
{
    //MNTR_LOCK_TO_BE_DELETED_ON_RELEASE
    MNTR_LOCK_ERROR = (mntrFlgs) 0x00u,
    MNTR_READ = (mntrFlgs) 0x1u,
    MNTR_WRITE = (mntrFlgs) 0x2u,

    MNTR_NOOP = (mntrFlgs) 0x8u,

    MNTR_FREE = (mntrFlgs) 0x10u,
    MNTR_FREE_READ = (mntrFlgs) 0x11u, /* MNTR_FREE | MNTR_READ */
    MNTR_FREE_NOOP = (mntrFlgs) 0x18u, /* MNTR_FREE | MNTR_NOOP */

    MNTR_PENDING = (mntrFlgs) 0x20u,
    MNTR_PENDING_WRITE = (mntrFlgs) 0x22u, /* MNTR_PENDING | MNTR_WRITE */

    MNTR_LOCK = (mntrFlgs) 0x40u,
    MNTR_LOCK_WRITE = (mntrFlgs) 0x42u, /* MNTR_LOCK | MNTR_WRITE */

    MNTR_RW = (mntrFlgs) 0x3u, /* MNTR_READ | MNTR_WRITE */
    MNTR_RPW = (mntrFlgs) 0x33u, /* MNTR_FREE | MNTR_READ | MNTR_PENDING | MNTR_WRITE */
} MntrState;

typedef uint8_t mntrRfrcCnt;

//DEPRECATED
typedef struct mntrWaitr
{
    struct mntrWaitr * ptrXOR;    //!> XORed pointer to previous and next element
    ACCSSType accssType;        //!> Type of access demanded by the element
    TskID tskID;                //!> ID of the element
} MntrWaitr, *PMntrWaitr;

typedef struct mntr
{
    Data protectedData;      //!> Pointer to the data to protect
    TskID mntrWaitrsQTskIDStrt;    //!> TskID of the task containing the start of the waiters list
    TskID mntrWaitrsQTskIDEnd;    //!> TskID of the task containing the end of the waiters list
    MntrState curState;         //!> Current (access) state of the monitor
    mntrRfrcCnt refCntr;    //!> Reference counter for current accesses to the monitor
    //MemPoolID   memPoolID;      //!> MemPoolID of the memory pool the waiter element memory need is served
} Mntr, *PMntr;

RetCode mntr_INIT( void );

RetCode mntr_CreateMntr(
                         PMntr * usrMntrHndl,
                         const Data const data,
                         const uint8_t waitrQueueMaxSize );

RetCode mntr_InitMntr( PMntr const mntrHndl, const Data const data );

RetCode mntr_DelMntr( PMntr usrMntrHndl );

RetCode mntr_ReqstReadAccssMntr( Mntr * const usrMntrHndl, TskID tskID );

RetCode mntr_RelsReadAccssMntr( Mntr * const usrMntrHndl );

RetCode mntr_ReqstWriteAccssMntr( Mntr * const usrMntrHndl, TskID tskID );

RetCode mntr_RelsWriteAccssMntr( Mntr * const usrMntrHndl );

#endif /* HEADERS_R_RTOS_MONITOR_H_ */
