/**
 * \file    R_RTOS_monitor.h
 * \author  Christian Neuberger (NeubergerCh50344@th-nuernberg.de)
 * \date    21.02.2016
 *
 * \brief Functions for creating, initializing, maintaining and handling monitors.
 */
 
#ifndef HEADERS_R_RTOS_MONITOR_H_
#define HEADERS_R_RTOS_MONITOR_H_

#include "R_RTOS_inc.h"
#include "R_RTOS_memMngr.h"

#define MEM_OBJECTS_MNTR (uint8_t)0x10u

#define NR_OF_MNTRS (uint8_t)0x2u


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
    MNTR_RPW = (mntrFlgs) 0x72u, /* MNTR_FREE | MNTR_PENDING | MNTR_LOCK | MNTR_READ | MNTR_WRITE */
    MNTR_WPW = (mntrFlgs) 0x62u /* MNTR_FREE | MNTR_PENDING | MNTR_WRITE */
} MntrState;

typedef uint8_t mntrRfrcCnt;

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

RetCode mntr_InitMntr( const MntrNr mntrNr, const Data const data /* = NULL */  );

RetCode mntr_DelMntr( const MntrNr mntrNr );

RetCode mntr_ReqstReadAccssMntr( const MntrNr mntrNr, PTskTCB const tsk );

RetCode mntr_ReqstWriteAccssMntr( const MntrNr mntrNr, PTskTCB const tsk );

RetCode mntr_ReleaseAccssMntr( const MntrNr mntrNr );

#endif /* HEADERS_R_RTOS_MONITOR_H_ */
