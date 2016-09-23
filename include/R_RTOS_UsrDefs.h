/**
 * \file    R_RTOS_UsrDefs.h
 * \author  Christian Neuberger (NeubergerCh50344@th-nuernberg.de)
 * \date    08.07.2016
 *
 * \brief User Defines for controlling the system
 */

#ifndef INCLUDE_R_RTOS_USRDEFS_H_
#define INCLUDE_R_RTOS_USRDEFS_H_

#include <stdint.h>

//SYSCTRL
/** \addtogroup SysTickTMR
 * \{
 */
/**
 *  \brief Period of time between two SysTicks in ms
 *  \note User Defined
 */
#define TIME_SLICE_AMOUNT                  ((uint16_t)500u)  // Time slice in ms
/** \} */


/** \addtogroup tsk
 * \{
 */
/**
 *  \brief Number of tasks in the system.
 *  \note User Defined
 */
#define NR_OF_TSKS          ((uint8_t)0x5u) // max tasks

/**
 *  \brief Number of available priority levels in the system.
 *
 *  \note User defined.
 *  \note Maximum 256, minimum 2
 */
#define TSK_PRIO_LEVELS_NR ((uint8_t)0xFu)
/** \}*/


/** \addtogroup MsgQ
 * \{
 */
/**
 *  \brief Number of message queues in the system.
 *  \note user defined.
 */
#define AMOUNT_OF_MSGQ  ((uint8_t)0x2u)

/**
 *  \brief Defines the amount of data one queue can hold.
 *  \warning CHOOSE WITH CAUTION! MEMORY IS EXPENSIVE!
 *  \note User Defined
 */
#define MAX_QUEUE_DATA_ELEMENT_SIZE ((uint8_t)0x10u)
/** \}*/


/** \addtogroup sem
 * \{
 */
/**
 *  \brief  Defines the maximum amount of different semaphores in the system.
 *  \note User Defined
 */
#define     AMOUNT_OF_SEMS  ((uint8_t)0x2u)

/**
 *  \brief Number of #SyncEle that will be allocated by the Semaphore mechanism in its memory pool
 *
 *  \note User defined
 */
#define MEM_OBJECTS_SEM ((uint8_t)0x4u)
/**\}*/


/**
 * \addtogroup mtx
 * \{
 */
/**
 * \brief Number of #SyncEle that will be allocated by the Mutex mechanism in its memory pool
 *
 * \note User defined
 */
#define MEM_OBJECTS_MTX (uint8_t)0x4u

/**
 * \brief Number of Mutexes in the system.
 *
 * \note User Defined
 */
#define AMOUNT_OF_MTXS (uint8_t)0x2u
/**\}*/


/**
 * \addtogroup mntr
 * \{
 */
/**
 * \brief Number of #SyncEle that will be allocated by the Monitor mechanism in its memory pool
 * \note User Defined
 */
#define MEM_OBJECTS_MNTR ((uint8_t)0x4u)

/**
 * \brief Number of Mutexes in the system.
 *
 * \note User Defined
 */
#define NR_OF_MNTRS ((uint8_t)0x2u)
/**\}*/


/** \addtogroup evt
 * \{
 */
/**
 *  \brief  Defines the maximum amount of different events in the system
 * \note User Defined
 */
#define AMOUNT_OF_EVTS  ((uint8_t)0x4u)

/**
 *  \brief  Defines the maximum size of the event queues.
 *
 *  \note Multiples of four are recommended.
 *  \note User Defined
 */
#define EVT_QUEUE_SIZE  ((uint8_t)0x4u)

/**
 *  \brief Number of #SyncEle that will be allocated by the Event mechanism in its memory pool
 *  \note User Defined
 */
#define MEM_OBJECTS_EVT ((uint8_t)0x4u)
/** \}*/


/** \addtogroup SysTickTMR
 * \{
 */
/**
 *  \brief Number of slots for the system tick slot array.
 *  \note The more slots the more memory will be need,
 *  but therefore the distribution of elements to the slots will be better.
 *  \note User Defined
 */
#define SYSTCK_AR_RES (uint8_t)0x8u
/**
 *  \brief Mask used to keep a counter within the range of SYSTCK_AR_RES
 *  \note User Defined
 */
#define SYSTCK_AR_RES_MSK (uint8_t)(SYSTCK_AR_RES - (uint8_t)0x1u)

/**
 * \brief Number of #SyncEle that will be allocated by the Timer mechanism in its memory pool
 * \note User Defined
 */
#define MEM_OBJECTS_SysTckTMR ((uint8_t)0x4u)
/**\}*/


/** \addtogroup StckdSWTmr
 * \{
 */
/**
 * \brief Number of #SyncEle that will be allocated by the Timer mechanism in its memory pool
 * \note User Defined
 */
#define MEM_OBJECTS_TMR ((uint8_t)0x4u)
/**\}*/
#endif /* INCLUDE_R_RTOS_USRDEFS_H_ */
