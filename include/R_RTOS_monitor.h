/**
 * \file    R_RTOS_monitor.h
 * \author  Christian Neuberger (NeubergerCh50344@th-nuernberg.de)
 * \date    21.02.2016
 * \addtogroup sync
 * \{
 *  \addtogroup mntr Monitor
 *  \brief Functions for creating, initializing, maintaining and handling monitors.
 *
 *  \{
 *
 */
 
#ifndef HEADERS_R_RTOS_MONITOR_H_
#define HEADERS_R_RTOS_MONITOR_H_

#include "R_RTOS_inc.h"
#include "R_RTOS_memMngr.h"

#define MEM_OBJECTS_MNTR (uint8_t)0x4u

#define NR_OF_MNTRS (uint8_t)0x2u


/**
 * \typedef mntrFlgs
 * \brief 8 bit representation of the current monitor access type
 */
typedef uint8_t mntrFlgs;

/**
 * \enum mntrAccessState
 * \brief Access types for the monitor
 *
 * The access flags are independent of the state flags.
 * Thus a monitor can be locked or set free regardless of its state.
 * Convenience flags, however, are introduced for common combinations.
 *
 * State Flags:
 * Flag | Meaning
 *  :-: | :---:
 * Free | Monitor can be accessed
 * Pending | A blocking operation is pending, therefore further access is denied
 * Lock | Monitor is locked and no access is granted
 *
 * Access Flags:
 * Flag     |   Meaning     | State
 * :--:     |   :----:      | :---:
 * NOOP     | No operation  | Free
 * Read     | Read access   | Free
 * Write    | Write access  | Pending or Lock
 */
/**
 * \typedef MntrState
 * \brief See \ref mntrAccessState
 */
typedef enum mntrAccessState
{
    //MNTR_LOCK_TO_BE_DELETED_ON_RELEASE
    MNTR_LOCK_ERROR = (mntrFlgs) 0x00u,     //!< Error state
    MNTR_READ = (mntrFlgs) 0x1u,            //!< Read access
    MNTR_WRITE = (mntrFlgs) 0x2u,           //!< Write Access

    MNTR_NOOP = (mntrFlgs) 0x8u,            //!< No operation

    MNTR_FREE = (mntrFlgs) 0x10u,           //!< Free state
    MNTR_FREE_READ = (mntrFlgs) 0x11u,      //!< MNTR_FREE | MNTR_READ
    MNTR_FREE_NOOP = (mntrFlgs) 0x18u,      //!< MNTR_FREE | MNTR_NOOP

    MNTR_PENDING = (mntrFlgs) 0x20u,        //!< Pending state
    MNTR_PENDING_WRITE = (mntrFlgs) 0x22u,  //!< MNTR_PENDING | MNTR_WRITE

    MNTR_LOCK = (mntrFlgs) 0x40u,           //!< Lock state
    MNTR_LOCK_WRITE = (mntrFlgs) 0x42u,     //!< MNTR_LOCK | MNTR_WRITE

    MNTR_RW = (mntrFlgs) 0x3u,              //!< MNTR_READ | MNTR_WRITE
    MNTR_RPW = (mntrFlgs) 0x72u,            //!< MNTR_FREE | MNTR_PENDING | MNTR_LOCK | MNTR_READ | MNTR_WRITE
    MNTR_WPW = (mntrFlgs) 0x62u             //!< MNTR_FREE | MNTR_PENDING | MNTR_WRITE
} MntrState;

/**
 * \typedef mntrRfrcCnt
 * \brief Reference counter data type
 */
typedef uint8_t mntrRfrcCnt;

/**
 * \struct mntr
 * \brief Monitor for synchronized access
 *
 * The monitor structure keeps track of its wait queue, its state and a reference counter that
 * keeps track of how many instances currently have access to the monitor. If the value of the
 * reference counter reaches zero it is considered to be free and therefore the wait queue is
 * queried for currently blocked instances. If there are no elements in the wait queue, the
 * monitor's state is set to MNTR_NOOP.
 *
 */
typedef struct mntr
{
    Data protectedData;      //!> Pointer to the data to protect
    TskID mntrWaitrsQTskIDStrt;    //!> TskID of the task containing the start of the waiters list
    TskID mntrWaitrsQTskIDEnd;    //!> TskID of the task containing the end of the waiters list
    MntrState curState;         //!> Current (access) state of the monitor
    mntrRfrcCnt refCntr;    //!> Reference counter for current accesses to the monitor
    //MemPoolID   memPoolID;      //!> MemPoolID of the memory pool the waiter element memory need is served
} Mntr, *PMntr;

/**
 * \fn RetCode mntr_INIT( void )
 * \brief Initialize the Monitor functionality
 * \return RetCode
 * \returns RET_OK Everything is ok
 *
 * \warning Must be called before any monitor function/operation is called!
 */
RetCode mntr_INIT( void );

/**
 * \fn RetCode mntr_InitMntr( const MntrNr mntrNr, const Data const data  )
 * \brief Initialize the monitor with the given MntrNr
 *
 * \param [in] mntrNr Number of the monitor the function is called for
 * \param [in] data   Data to be protected by the monitor
 * \return RetCode
 * \returns RET_OK Successful
 * \returns RET_NOK Failed
 *
 * \note This function is called by \ref mntr_INIT for all available monitors with default values.
 */
RetCode mntr_InitMntr( const MntrNr mntrNr, const Data const data /* = NULL */  );


RetCode mntr_DelMntr( const MntrNr mntrNr );

/**
 * \fn RetCode mntr_ReqstReadAccssMntr( const MntrNr mntrNr, PTskTCB const tsk )
 * \brief Request read access to the data protected by the monitor
 *
 * \param[in] mntrNr Number of the monitor the function is called for
 * \param[in] tsk Task the read access request is made for
 * \return RetCode
 * \returns RET_OK Successful
 * \returns RET_NOK Failed
 *
 * \note Multiple simultaneous read accesses are possible, whereas only one write access can be given.
 */
RetCode mntr_ReqstReadAccssMntr( const MntrNr mntrNr, PTskTCB const tsk );

/**
 * \fn RetCode mntr_ReqstWriteAccssMntr( const MntrNr mntrNr, PTskTCB const tsk )
 * \brief Request write access to the data protected by the monitor
 *
 * \param[in] mntrNr Number of the monitor the function is called for
 * \param[in] tsk Task the write access request is made for
 * \return RetCode
 * \returns RET_OK Successful
 * \returns RET_NOK Failed
 *
 * \note Only one write access at a time is granted.
 */
RetCode mntr_ReqstWriteAccssMntr( const MntrNr mntrNr, PTskTCB const tsk );

/**
 * \fn RetCode mntr_ReleaseAccssMntr( const MntrNr mntrNr )
 * \brief Release a previously made access request (read or write).
 *
 * \param[in] mntrNr Number of the monitor the function is called for
 * \return RetCode
 * \returns RET_OK Successful
 * \returns RET_NOK Failed
 *
 * \note This function is used to release both: read and write accesses.
 */
RetCode mntr_ReleaseAccssMntr( const MntrNr mntrNr );

/**
 * \}
 * \}
 */
#endif /* HEADERS_R_RTOS_MONITOR_H_ */
