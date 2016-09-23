/**
 * \file    R_RTOS_inc.h
 * \author  Christian Neuberger (NeubergerCh50344@th-nuernberg.de)
 * \date    26.11.2015
 *
 * \brief Defines, Typedefs and Macros for the whole system.
 */

#ifndef HEADERS_R_RTOS_INC_H_
#define HEADERS_R_RTOS_INC_H_

/*
 * ##################################################
 * INCLUDES
 * ##################################################
 */

#include <stdint.h>
#include "R_RTOS_UsrDefs.h"

/*
 * ##################################################
 * END INCLUDES
 * ##################################################
 */

/*
 * ##################################################
 * DEFINES
 * ##################################################
 */

/* HELPER */
#undef NULL
/**
 *  \brief NULL pointer.
 *
 *  Due to the fact that this is a void pointer it can be casted to whatever pointer type needed.
 */
#define NULL ((void *)0x0u)

/**
 *  \brief Get absolute value of x.
 *
 *  Remove sign from a signed value, so to speak compute its absolute value.
 */
#define ABS(x)  (((x)<0) ? (-1*(x)) : (x))

/**
 *  \brief Implementation of the OFFSETOF makro to retrieve the offset of a structure member
 */
#define OFFSETOF(type, field)    ((uint8_t) &(((type *) 0)->field))
/* END HELPER */

/** \addtogroup tsk
 * \{
 */

/**
 *  \brief Maximum number of tasks in the system.
 *
 *  The Maximum number of tasks in the system is influenced by the amount of heap available.
 */
#define MAX_TASKS           NR_OF_TSKS
/** \}*/

/* STACK */
/** \addtogroup stack
 * \{
 */
#define MIN_STACK_SIZE  ((StackSize)0x40u) // 64 Byte

/**
 *  \brief Default value for a task's stack size.
 */
#define MY_STACK_SIZE       ((StackSize)0x80u)  // 128 byte ??

/**
 *  \brief Stack size for the IDLE Task.
 */
#define IDLE_TSK_STACK_SIZE ((StackSize)0x60u)  // 96 byte
/**
 *  \brief Size of one stack element in byte.
 */
#define STACK_BLOCK_SIZE    ((uint8_t)0x4u)  // 4 byte blocksize
/** \} */
/* END STACK */

/* MESSAGE QUEUE */

/** \addtogroup MsgQ
 * \{
 */
/**
 *  \brief Position of the user/task id in PartiID.
 */
#define MSGQ_TSK_ID_POS (uint8_t)0x0u
/**
 *  \brief Position of the system id in PartiID.
 */
#define MSGQ_SYS_ID_POS (uint8_t)0x1u

/**
 *  \brief Mask for the system id in PartiID.
 */
#define SYS_ID_MSK  (uint16_t)0xFF00u
/**
 *  \brief Mask for the user/task id in PartiID.
 */
#define TSK_ID_MSK  (uint16_t)0x00FFu

/** \}*/

/* END MESSAGE QUEUE */

/* SEMAPHORES */

/* END SEMAPHORES */

/* EVENTS */

/* END EVENTS */

/* SYSTICKTMR */

/* END SYSTICKTMR */

/* TIMER */

/* END TIMER */

/* TASK */
/** \addtogroup tsk
 * \{
 */
/**
 *  \brief Reserved TskID for the IDLE Task.
 *
 *  TskID 0 is reserved for the IDLE Task to ensure it always has the same ID
 *  \warning NO TASK EXCEPT THE IDLE TASK SHALL HAVE THIS ID!
 */
#define TSK_ID_IDLE                         ((TskID)0x0u)
/**
 *  \brief Reserved ID for no task.
 *
 *  TSK_ID_NO_TSK is a specially reserved TskID to indicate that there is no task.
 *  \warning NO TASK SHALL HAVE THIS ID!
 */
#define TSK_ID_NO_TSK                       TSK_ID_IDLE//((TskID)0xfu)


/**\}*/
/* END TASK */

/* FKT */
/**
 *  \brief Number of user defined system functions.
 *
 *  \note User defined.
 */
#define AMOUNT_SYS_FKT (uint8_t)0x8u
/**
 *  \brief Indicates an invalid system function ID.
 *
 *  This define should be used whenever the validity of a SysFktID has to be evaluated.
 */
#define SYSFKT_INVALID_SYSFKT_ID (SysFktID)0xFFu
/* END FKT */

/* SYNC */

/* END SYNC */
/*
 * ##################################################
 * END DEFINES
 * ##################################################
 */

/*
 * ##################################################
 * MAKROS
 * ##################################################
 */
/* HELPER */
/* END HELPER */
/* STACK */
/* END STACK */

/* MESSAGE QUEUE */
/** \addtogroup MsgQ
 * \{
 */
//ToDO
#define DATATYPE_IS_PTR( dataType )     (uint8_t)( dataType & (uint8_t)0x4u)

/**
 *  \brief Given the id as uint8_t compute the system id to use as PartiID.
 */
#define MAKE_SYS_ID( id )   (uint16_t)((uint16_t)((uint8_t)id & (uint8_t)0xFFu) << (uint8_t)0x8u)

/**
 *  \brief Given the id as uint8_t compute the user/task id to use as PartiID.
 */
#define MAKE_TSK_ID( id )   (uint16_t)(uint16_t)((uint8_t)id & (uint8_t)0xFFu)
/**
 *  \brief Given the id as uint16_t (fullID of partiID) evaluate whether the id belongs to a task or not.
 */
#define MQ_IS_TSK_ID( id )  (uint8_t)((uint16_t)id & (uint16_t)0xFFu)
/**\}*/
/* END MESSAGE QUEUE */

/* SEMAPHORES */

/* END SEMAPHORES */

/* EVENTS */
/**
 * \addtogroup evt
 * \{
 */
/**
 *  \brief Makro that can be used to create an event mask for a group of event flags.
 *
 *  Multiple events can be set using an ORed combination of this makro.
 */
#define CREATE_EVT_MSK(evtNr)   (EVTQSlots)((EVTQSlots)0x1u << evtNr)
/**\}*/
/* END EVENTS */

/* TIMER */

/* END TIMER */

/* TASK */
/**
 * \addtogroup tsk
 * \{
 */
/**
 *  \brief Given a pointer to a TskTCB, retrieve the current state of the task.
 */
#define TSK_GETSTATE(pTsk) (TskState)(pTsk->tskState)

/**
 *  \brief Evaluate if the task is in an error state.
 */
#define TSK_STATE_IS_ERROR(pTsk) (TskState)(TSK_GETSTATE(pTsk) == TSK_STATE_ERROR)

/**
 *  \brief Evaluate if the task is in an active state.
 */
#define TSK_STATE_IS_ACTIVE(pTsk) (TskState)(TSK_GETSTATE(pTsk) & TSK_STATE_ACTIVE)

/**
 *  \brief Evalutate if the task is currently in the ACTIVE_RUNNING state.
 */
#define TSK_STATE_IS_ACTIVE_RUNNING(pTsk) (TskState)(TSK_GETSTATE(pTsk) == TSK_STATE_ACTIVE_RUNNING )
/**
 *  \brief Evalutate if the task is currently in the ACTIVE_SUSPENDED state.
 */
#define TSK_STATE_IS_ACTIVE_SUSPENDED(pTsk) (TskState)(TSK_GETSTATE(pTsk) == TSK_STATE_ACTIVE_SUSPENDED )
/**
 *  \brief Evalutate if the task is currently in the ACTIVE_READY state.
 */
#define TSK_STATE_IS_ACTIVE_READY(pTsk) (TskState)(TSK_GETSTATE(pTsk) == TSK_STATE_ACTIVE_READY )
/**
 *  \brief Evalutate if the task is currently in the ACTIVE_CRITSEC state.
 *
 *  The task is currently running and also within a critical section.
 */
#define TSK_STATE_IS_ACTIVE_CRITSEC(pTsk) (TskState)(TSK_GETSTATE(pTsk) == TSK_STATE_ACTIVE_CRITSEC )

/**
 *  \brief Evalutate if the task is in a waiting state.
 */
#define TSK_STATE_IS_WAITING(pTsk) (TskState)(TSK_GETSTATE(pTsk) & TSK_STATE_WAITING)
/**
 *  \brief Evalutate if the task is in a waiting state, waiting for a software timer to expire.
 */
#define TSK_STATE_IS_WAITING_TMR(pTsk) (TskState)(TSK_GETSTATE(pTsk) == TSK_STATE_WAITING_TMR)
/**
 *  \brief Evalutate if the task is in a waiting state, waiting for a message to be received.
 */
#define TSK_STATE_IS_WAITING_MSGRCV(pTsk) (TskState)(TSK_GETSTATE(pTsk) == TSK_STATE_WAITING_MSGRCV)
/**
 *  \brief Evalutate if the task is in a waiting state, waiting for a message to be send.
 */
#define TSK_STATE_IS_WAITING_MSGSND(pTsk) (TskState)(TSK_GETSTATE(pTsk) == TSK_STATE_WAITING_MSGSND)
/**
 *  \brief Evalutate if the task is in a waiting state, waiting for an event or a group of events.
 */
#define TSK_STATE_IS_WAITING_EVT(pTsk) (TskState)(TSK_GETSTATE(pTsk) == TSK_STATE_WAITING_EVT)
/**
 *  \brief Evalutate if the task is in a waiting state, waiting for an occupied semaphore.
 */
#define TSK_STATE_IS_WAITING_SEM(pTsk) (TskState)(TSK_GETSTATE(pTsk) == TSK_STATE_WAITING_SEM)
/**
 *  \brief Evalutate if the task is in a waiting state, waiting for a currently blocked monitor.
 */
#define TSK_STATE_IS_WAITING_MNTR(pTsk) (TskState)(TSK_GETSTATE(pTsk) == TSK_STATE_WAITING_MNTR)

/**
 *  \brief Evalutate if the task is in an uninitialized state.
 *
 *  \warning IF THE TASK IS UNINITIALIZED, DO NOT ATTEMPT TO FORCEFULLY RUN A TASK.
 */
#define TSK_STATE_IS_UNINIT(pTsk) (TskState)(TSK_GETSTATE(pTsk) & TSK_STATE_UNINIT)
/**
 *  \brief Evalutate if the task has not yet been initialized correctly.
 */
#define TSK_STATE_IS_UNINIT_UNINIT(pTsk) (TskState)(TSK_GETSTATE(pTsk) == TSK_STATE_UNINIT_UNINIT)
/**
 *  \brief Evalutate if the task is in an uninitialized state due to a system failure.
 */
#define TSK_STATE_IS_UNINIT_FAILED(pTsk) (TskState)(TSK_GETSTATE(pTsk) == TSK_STATE_UNINIT_FAILED)
/**
 *  \brief Evalutate if the task is in an uninitialized state because it finished its execution.
 */
#define TSK_STATE_IS_UNINIT_ENDED(pTsk) (TskState)(TSK_GETSTATE(pTsk) == TSK_STATE_UNINIT_ENDED)
/**\}*/
/* END TASK */

/* FKT */

/* END FKT */

/* SYNC */

/* END SYNC */
/*
 * ##################################################
 * END MAKROS
 * ##################################################
 */

/*
 * ##################################################
 * TYPEDEFS
 * ##################################################
 */
/*
 * ##################################################
 * SIMPLE TYPES
 * ##################################################
 */
/* FKT */

/**
 *  \brief Function pointer with no arguments and no return.
 */
typedef void (*FktCall)( void );

/**
 *  \brief Function pointer with one arguments and no return.
 */
typedef void (*FktCallOneArg)( void * );

/**
 *  \brief System function ID
 */
typedef uint8_t SysFktID;
/* END FKT */
/* STACK */
/**
 * \addtogroup stack
 * \{
 */
/**
 *  \brief Used to describe the size of a stack.
 */
typedef uint16_t StackSize;

/**
 *  \brief Base type of a stack element.
 */
typedef uint32_t StackTypeT;

/**
 *  \brief Pointer to a StackTypeT.
 *
 *  Also used to point to the current, the top and the bottom StackTypeT.
 */
typedef StackTypeT *StackPtrT;
/**\}*/
/* END STACK */

/* MESSAGE QUEUE */
/**
 * \addtogroup MsgQ
 * \{
 */
/**
 *  \brief Size of the data in a data container.
 */
typedef uint8_t DataSize;    // Size of Data

/**
 *  \brief Data to store in a data container.
 */
typedef uint32_t *Data;         // pointer to Data

/**
 *
 * \brief Priority of a message queue.
 */
typedef uint8_t QPrio;      // priority of a message queue

/**
 * \brief Pointer to a function with one Data input parameter and void as return.
 */
typedef void (*CallBackOnDataRecv)( Data );

/**
 *  \brief Identifier for a message queue.
 */
typedef uint8_t QID;        // identifier for a message queue

/**
 *  \brief Counter for messages.
 */
typedef uint8_t MsgCntr;

/**
 *  \brief Identifier for a message queue participant.
 *
 *  Due to the distinction between user/task level and system level the id for a message queue participant is split.
 *  The lower byte is reserved for user/task ids whereas the upper byte serves as the system id.
 */
typedef union partID
{
    uint16_t fullID;        //!< The whole id containing upper and lower byte
    uint8_t snglID[2];      //!< The two separate bytes of the id
} PartID;
/**\}*/
/* END MESSAGE QUEUE */

/* SEMAPHORES */
/**
 * \addtogroup sem
 * \{
 */
/**
 *  \brief   Number of a semaphore.
 */
typedef uint8_t SemNr;


/**
 *  \brief Used as a counter variable for semaphores.
 */
typedef uint8_t SemCntr;
/**\}*/
/* END SEMAPHORES */

/* MUTEXES */
/** \addtogroup mtx
 * \{
 */
/**
 *  \brief   Number of a Mutex.
 */
typedef uint8_t MtxNr;
/**\}*/
/* END MUTEXES */

/* MNTRS */
/** \addtogroup mntr
 * \{
 */
typedef uint8_t MntrNr;
/**\}*/
/* END MNTRS */

/* EVENTS */
/** \addtogroup evt
 * \{
 */
/**
 *  \brief   Number of an event.
 */
typedef uint8_t EvtNr;

/**
 *  \brief Used for event masks.
 */
typedef uint32_t EvtMsk;
/**
 *  \brief Used as a bitarry for slots of an event queue.
 */
typedef uint32_t EVTQSlots;
/**\}*/
/* END EVENTS */

/* TIMER */
/** \addtogroup StckdSWTmr
 * \{
 */
/**
 *  \brief Time to wait for a Timer.
 */
typedef uint16_t WaitTime;

/**
 *  \brief Used to describe a systemtime
 */
typedef uint32_t SysTime;

/**
 *  \brief   Amount of SysTicks.
 */
typedef uint8_t SysTicks;

/**
 *  \brief   Used to describe the time of a software timer.
 */
typedef uint16_t TmrTime;

/**
 *  \brief   Used to describe time in the system as a timestamp.
 */
typedef uint32_t LifeTime;
/**\}*/
/* END TIMER */

/* TASK */
/** \addtogroup tsk
 * \{
 */
/**
 *  \brief Task identification number (ID).
 */
typedef uint8_t TskID;

//MAX 8 BITs
/**
 *  \brief Used to set the size of the task priorities.
 */
typedef uint8_t TskPrioLvl;

/**
 *  \brief Used to set the size of the task states.
 */
typedef uint8_t tskStateT;

/**
 *  \brief function pointer to a task's function with no arguments and no return.
 */
typedef FktCall TskStartAddr;

/**
 *  \brief function pointer to a function which shall be called if a task finishes its execution.
 */
typedef FktCall TskEndAddr;
/**\}*/
/* END TASK */

/* SYNC */
/** \addtogroup sync
 * \{
 */
/**
 *  \brief   ID of the synchronization element.
 *
 *  Eight bit value representing the ID assigned to the synchronization element.
 *  Every synchronization element has its own ID management.
 *  Hence the same ID can be given to different synchronization elements with different type.
 */
typedef uint8_t SyncEleID;
/**\}*/
/* END SYNC */
/*
 * ##################################################
 * END SIMPLE TYPES
 * ##################################################
 */
/*
 * ##################################################
 * TYPES
 * ##################################################
 */
/* STACK */
/* END STACK */

/* MESSAGE QUEUE */

/* END MESSAGE QUEUE */

/* SEMAPHORES */

/* END SEMAPHORES */

/* EVENTS */

/* END EVENTS */

/* TIMER */

/* END TIMER */

/* TASK */

/* END TASK */

/* FKT */

/* END FKT */

/* SYNC */

/* END SYNC */
/*
 * ##################################################
 * END TYPES
 * ##################################################
 */

/*
 * ##################################################
 * ENUM TYPES
 * ##################################################
 */
/* STACK */
/* END STACK */

/* MNTR */
/** \addtogroup mntr
 * \{
 */
/**
 *  \brief Enumeration of the access types for access on a monitor.
 */
typedef enum mntrAccssType
{
    MNTR_ACCESS_NONE = (uint8_t) 0x0u,    //!< MNTR_ACCESS_NONE
    MNTR_ACCESS_READ = (uint8_t) 0x1u,    //!< MNTR_ACCESS_READ
    MNTR_ACCESS_WRITE = (uint8_t) 0x2u,    //!< MNTR_ACCESS_WRITE
    MNTR_ACCESS_DELETE = (uint8_t) 0x4u,    //!< MNTR_ACCESS_DELETE
    MNTR_ACCESS_MODIFY = (uint8_t) 0x8u    //!< MNTR_ACCESS_MODIFY
} ACCSSType;
/**\}*/
/* END MNTR */

/* MESSAGE QUEUE */
/** \addtogroup MsgQ
 * \{
 */
/**
 *  \brief Enumeration of data types for data stored within another structure.
 */
typedef enum dataTypes
{
    DataT_Undef = (uint8_t) 0x0u,    //!< DataT_Undef
    DataT_Int = (uint8_t) 0x1u,    //!< DataT_Int
    DataT_Ptr = (uint8_t) 0x4u,    //!< DataT_Ptr
    DataT_Int_Ptr,                //!< DataT_Int_Ptr
    DataT_String,                 //!< DataT_String
    DataT_FunCall = (uint8_t) 0x8u                 //!< DataT_FunCall
} DataType;
/**\}*/
/* END MESSAGE QUEUE */

/* SEMAPHORES */
/* END SEMAPHORES */

/* EVENTS */
/* END EVENTS */

/* TIMER */
/** \addtogroup StckdSWTmr
 * \{
 */
/**
 *  \brief Enumeration of all the different types of software timers.
 */
typedef enum timerTypeEn
{
    SysTimerType = (uint8_t) 0x0u,    //!< System software timer
    TskTimerType = (uint8_t) 0x1u,    //!< Task software timer
    SysTickTimerType = (uint8_t) 0x2u    //!< System Tick software timer
} TimerType;
/**\}*/
/* END TIMER */

/* TASK */
/** \addtogroup tsk
 * \{
 */
/**
 *  \brief Task priority level.
 *
 */
typedef enum tskPrio
{
    TSK_PRIO_ERROR = (TskPrioLvl) 0x0u,    //!< Pseudo priority level indicating an error
    TSK_PRIO_LOWEST = (TskPrioLvl) 0x1u,    //!< TSK_PRIO_LOWEST
    TSK_PRIO_LOWER,                 //!< TSK_PRIO_LOWER
    TSK_PRIO_LOW,                   //!< TSK_PRIO_LOW
    TSK_PRIO_MED,                   //!< TSK_PRIO_MED
    TSK_PRIO_ABOVMED,               //!< TSK_PRIO_ABOVMED
    TSK_PRIO_HIG,                   //!< TSK_PRIO_HIG
    TSK_PRIO_HIGHER,                //!< TSK_PRIO_HIGHER
    TSK_PRIO_HIGHEST,               //!< TSK_PRIO_HIGHEST
    TSK_PRIO_ULT,                   //!< TSK_PRIO_ULT
    TSK_PRIO_IDLE = (TskPrioLvl) 0xFu    //!< Utmost highest priority is unique to the IDLE Task to ensure that it is always the start of the list regardless of the other task's priority levels
} TskPrio;


/**
 * \brief Possible states of tasks.
 *
 *
 *  State                       | Mask (bits)
 *  :----                       | :----:
 *  TSK_STATE_ERROR             | 0000 0000
 *  TSK_STATE_ACTIVE            | 0001 0000
 *  TSK_STATE_ACTIVE_RUNNING    | 0001 0001
 *  TSK_STATE_ACTIVE_SUSPENDED  | 0001 0010
 *  TSK_STATE_ACTIVE_READY      | 0001 0100
 *  TSK_STATE_ACTIVE_CRITSEC    | 0001 1000
 *  TSK_STATE_WAITING           | 0110 0000
 *  TSK_STATE_WAITING_MSGNG     | 0010 0000
 *  TSK_STATE_WAITING_MSGRCV    | 0010 0001
 *  TSK_STATE_WAITING_MSGSND    | 0010 0010
 *  TSK_STATE_WAITING_SYNC      | 0100 0000
 *  TSK_STATE_WAITING_TMR       | 0100 0001
 *  TSK_STATE_WAITING_EVT       | 0100 0010
 *  TSK_STATE_WAITING_SEM       | 0100 0100
 *  TSK_STATE_WAITING_MNTR      | 0100 1000
 *  TSK_STATE_UNINIT            | 1000 0000
 *  TSK_STATE_UNINIT_UNINIT     | 1000 0001
 *  TSK_STATE_UNINIT_FAILED     | 1000 0010
 *  TSK_STATE_UNINIT_ENDED      | 1000 1000
 *
 */
typedef enum tskState
{
    TSK_STATE_ERROR = (tskStateT) 0x00u,     //!< Error state
    TSK_STATE_ACTIVE = ( (tskStateT) 0x10u ),     //!< Active task states
    TSK_STATE_ACTIVE_RUNNING = ( (tskStateT) 0x11u ),    //!< Task is currently running
    TSK_STATE_ACTIVE_SUSPENDED = ( (tskStateT) 0x12u ),    //!< Task was preempted, hence it is suspended
    TSK_STATE_ACTIVE_READY = ( (tskStateT) 0x14u ),    //!< Task is ready to be run
    TSK_STATE_ACTIVE_CRITSEC = ( (tskStateT) 0x18u ),    //!< Task is running in a critical section
    TSK_STATE_WAITING_MSGNG = (tskStateT) 0x20u,    //!< Task messaging waiting states
    TSK_STATE_WAITING_MSGRCV = (tskStateT) 0x21u,    //!< Task is waiting for a message to be published
    TSK_STATE_WAITING_MSGSND = (tskStateT) 0x22u,    //!< Task is waiting for its message to be received
    TSK_STATE_WAITING_SYNC = (tskStateT) 0x40u,    //!< Task synchronization waiting states
    TSK_STATE_WAITING_TMR = (tskStateT) 0x41u,    //!< Task is waiting for a timer
    TSK_STATE_WAITING_EVT = (tskStateT) 0x42u,    //!< Task is waiting for an event
    TSK_STATE_WAITING_SEM_BIN = (tskStateT) 0x43u,    //!< Task is waiting for a binary semaphore
    TSK_STATE_WAITING_SEM_CNT = (tskStateT) 0x44u,    //!< Task is waiting for a coutning semaphore
    TSK_STATE_WAITING_MTX = (tskStateT) 0x45u,    //!< Task is waiting for a mutex
    TSK_STATE_WAITING_MNTR = (tskStateT) 0x46u,    //!< Task is waiting for a monitor
    TSK_STATE_WAITING = (tskStateT) 0x60u,    //!< Common task waiting states
    TSK_STATE_UNINIT = (tskStateT) 0x80u,    //!< Task is uninitialized
    TSK_STATE_UNINIT_UNINIT = (tskStateT) 0x81u,    //!< Task has not yet been initialized
    TSK_STATE_UNINIT_FAILED = (tskStateT) 0x82u,    //!< Task is uninitialized due to a system failure
    TSK_STATE_UNINIT_ENDED = (tskStateT) 0x88u,    //!< Task is uninitialized, because it finished its execution
} TskState;

/**
 *  \brief Settings of a task...
 */
typedef enum tskSettings
{
    TskSet_NONE = (uint8_t) 0x00u,    //!< NO SETTINGS
    TskSet_Periodic = (uint8_t) 0x01u,    //!< keep task context
    TskSet_OneShot = (uint8_t) 0x02u,    //!< delete after execution
    TskSet_DUMMY_0 = (uint8_t) 0x04u,    //!< TskSet_DUMMY_0
    TskSet_DUMMY_1 = (uint8_t) 0x08u,    //!< TskSet_DUMMY_1
    TskSet_DUMMY_2 = (uint8_t) 0x10u,    //!< TskSet_DUMMY_2
    TskSet_DUMMY_3 = (uint8_t) 0x20u,    //!< TskSet_DUMMY_3
    TskSet_DUMMY_4 = (uint8_t) 0x40u,    //!< TskSet_DUMMY_4
    TskSet_DUMMY_5 = (uint8_t) 0x80u    //!< TskSet_DUMMY_5
} TskSettings;
/**\}*/

/**
 * \addtogroup sync
 * \{
 */
/**
 *  \brief Enumeration of all the event types in the system.
 */
typedef enum evtType
{
    EvtTMR = (uint8_t) 0x21u,    //!< EvtTMR
    EvtMSGRCV = (uint8_t) 0x22u,    //!< EvtMSGRCV
    EvtMSGSND = (uint8_t) 0x24u,    //!< EvtMSGSND
    EvtEVT = (uint8_t) 0x41u,    //!< EvtEVT
    EvtSEM = (uint8_t) 0x42u,    //!< EvtSEM
    EvtMNTR = (uint8_t) 0x48u    //!< EvtMNTR
} EvtType;
/**\}*/
/* END TASK */

/* FKT */
/* END FKT */

/* SYNC */
/**
 * \addtogroup sync
 * \{
 */
/**
 *  \brief Enumeration of synchronization element types.
 */
typedef enum syncEleType
{
    SyncEle_TYPE_NOID = (uint8_t) 0x0u,    //!< No ID of the synchronization element (Probably error)
    SyncEle_TYPE_TMR = (uint8_t) 0x1u,    //!< ID of the software timer synchronization mechanism
    SyncEle_TYPE_EVT = (uint8_t) 0x2u,    //!< ID of the event synchronization mechanism
    SyncEle_TYPE_SEM = (uint8_t) 0x3u,    //FALLBACK
    SyncEle_TYPE_BinSEM = (uint8_t) 0x3u,    //!< ID of the binary semaphore synchronization mechanism
    SyncEle_TYPE_CntSEM = (uint8_t) 0x4u,    //!< ID of the counting semaphore synchronization mechanism
    SyncEle_TYPE_MTX = (uint8_t) 0x5u,    //!< ID of the mutex synchronization mechanism
    SyncEle_TYPE_MNTR = (uint8_t) 0x6u    //!< ID of the monitor synchronization mechanism
} SyncEleType;
/**\}*/
/* END SYNC */
/*
 * ##################################################
 * END ENUM TYPES
 * ##################################################
 */

/*
 * ##################################################
 * STRUCT TYPES
 * ##################################################
 */
/* STACK */
/* END STACK */

/* SYSTICKTMR */
/** \addtogroup SysTickTMR
 * \{
 */
/**
 * \brief Enumeration of the objects served by the system tick timer mechanism.
 *
 *  The SysTick software timer can be used a multitude of objects. Each object can also have multiple ways of using the timer ( waiting, blocking, etc...).
 */
typedef enum sysTckObjTypeEnum
{
    SysTckObj_Err = (uint8_t) 0x0u,    //!< Error of system tick object
    SysTckObj_Tsk = (uint8_t) 0x10u,    //!< common Task system tick object
    SysTckObj_TskBlck = (uint8_t) 0x11u,    //!< Task blocking system tick object
    SysTckObj_TskWait = (uint8_t) 0x12u,    //!< Task waiting system tick object used for timeouts by other synchronization mechanisms
    SysTckObj_SysFkt = (uint8_t) 0x20u,    //!< common system function system tick object
    SysTckObj_SysFktBlck = (uint8_t) 0x21u,    //!< Blocking system function system tick object
    SysTckObj_SysFktWait = (uint8_t) 0x22u,    //!< waiting system function system tick object
} SysTckEleType;

/**
 *  \brief Unified ID of a system tick element.
 *
 *  Used to keep both task IDs as well as system function IDs or any other IDs in the system that can use the system tick timer.
 */
typedef union sysTickEleIDUnion
{
    TskID tskID;
    SysFktID sysFktID;
} SysTickEleID;

/**
 * \brief Structure to keep track of system tick timer objects.
 */
typedef struct sysTickTMRStruc
{
    struct sysTickTMRStruc * nxtSysTickTMR;    //!< next SysTickTMR object in the current SysTicks slot
    struct sysTickTMRStruc * prvSysTickTMR;    //!< previous SysTickTMR object in the current SysTicks slot
    SysTckEleType sysTckObjType;    //!< Type of the object this SysTickTMR belongs to
    SysTickEleID sysTckObjID;    //!< ID of the object this SysTickTMR belongs to
    SysTicks remSysTicks;    //!< remaining SysTicks until the SysTickTMR expires
    SysTicks insrtnSysTicksTime;    //!< time in SysTicks when the timer was set
} SysTickTMR, *PSysTickTMR;
/**\}*/
/* END SYSTICKTMR */

/* MESSAGE QUEUE */
/** \addtogroup MsgQ
 * \{
 */
/**
 * \brief pointer a constant double word (32 bit) of data.
 */
typedef const uint32_t * CData;

/** \brief Pointer to a CData.
 */
typedef CData *PCData;

/** \brief Circular array backed fixed size buffer for data entities.
 *
 *  Data is stored alongside the PartiID of the publisher, its size and the type the data.
 *  The Data in a queue is stored as a circular buffer.
 *
 *  Benefits of this method include:
 *  - Reliability, because there is defined behavior in case of an overflow
 *  - Data can be allocated beforehand, thus the data queue is effectively immortal
 *  - An array has constant time for accessing an element
 *  - Deletion(head/tail) or insertion(head/tail) of a new data element are also constant time operations
 */
typedef struct mqData
{
    CData data;    //!< Data stored within the message
    PartID pubID;                  //!< PartiID of the publisher
    DataType dataType;              //!< Type of the given data
    DataSize dataSize;               //!< size of the data in the message
} MQData, *PMQData;

/**
 * \brief Message Queue provider for a mail box.
 *
 * Keep track of the message queue linked with the mailbox and the new/unread messages for the task in the queue.
 */
typedef struct msgQMsgProvStruc
{
    QID msgQID;    //!< ID of the message queue
    volatile MsgCntr msgsNew;    //!< Counter for new/unread message in the queue for the task
} MsgQMsgProv, *PMsgQMsgProv;

/**
 * \brief ID of a message.
 */
typedef uint8_t MsgID;

/**
 * \brief Task messaging provider for a mail box.
 *
 * Keep track of the sender TskID and the ID of the sent message in Task to Task direct messaging.
 */
typedef struct tskMsgProvStruc
{
    volatile TskID tskProvID;    //!< TskID of the provider task
    volatile MsgID msgID;    //!< ID of the sent message
} TskMsgProv, *PTskMsgProv;

/**
 * \brief System messaging provider for a mail box
 *
 * Keep track of which system function sent the message and which id the sent message has.
 */
typedef struct sysMsgProvStruc
{
    volatile SysFktID sysProvID;    //!< ID of the system provider's system function
    volatile MsgID msgID;    //!< ID of the sent message
} SysMsgProv, *PSysMsgProv;

typedef struct dummyMsgProvStruc
{
    uint8_t dummyID;
    uint8_t dummyDummy;
} DummyMsgProv, *PDummyMsgProv;

/**
 * \brief Types of message providers.
 */
typedef enum msgProvTypeEnum
{
    MsgQ_Prov = (uint8_t) 0x0u,    //!< MsgQ provider type
    Tsk_Prov = (uint8_t) 0x1u,    //!< TskTCB provider type
    Sys_Prov = (uint8_t) 0x2u,    //!< SysFkt provider type
    Dummy_Prov = (uint8_t) 0xFFu    //!< Dummy provider type
} MsgProvType;

/**
 *  \brief Union of all available message providers
 */
typedef union msgPrvdrsUnion
{
    /*2*/MsgQMsgProv msgQMsgProv;    //!< Message Queue message provider
    /*2*/TskMsgProv tskMsgProv;    //!< Task message provider
    /*2*/SysMsgProv sysMsgProv;     //!< System message provider
    /*2*/DummyMsgProv dummyMsgProv;    //!< Dummy message provider
} MsgPrvdrs, *PMsgPrvdrs;
/**\}*/

/** \addtogroup tsk
 * \{
 */
/**
 *  \brief Task mailbox for messaging services.
 *
 *  Mailbox to keep track of received messages and their sources.
 *  Mailbox are arranged in a single linked list.
 *  Hence a task can have multiple mailboxes of the same or different sources.
 */
typedef struct tskMailBox
{
    /*4*/volatile struct tskMailBox *nxtTskMB;    //!< pointer to next TskMB
    /*2*/MsgPrvdrs msgProv;          //!< specific message provider
    /*1*/MsgProvType msgProvType;    //!< type of the provider linked with this TskMB
    uint8_t dummyByte;
} TskMB, *PTskMB;
/**\}*/
/* END MESSAGE QUEUE */
/* FKT */

/**
 *  \brief Structure of a function call related to a software timer
 */
typedef struct tmrFktCallStruc
{
    FktCall sysFktCall;   //!< function call with no return and no arguments
    LifeTime expirationTime;    //!< LifeTime value when the timer to call this function expires
    TmrTime reloadTime;    //!< time to reload the timer with in case of expiration; 0 if non periodic timer!
    SysFktID nxtFktCall;    //!< array index of the next function call in the sysTMR queue
    SysFktID fktID;       //!< ID of the function
} TmrFktCall, *PTmrFktCall;

/**
 *  \brief Structure of a function call related to a system tick timer
 */
typedef struct sysTckFktCallstruc
{
    FktCall sysFktCall;
    volatile PSysTickTMR sysTckTmr;    //!< Pointer to SysTickTMR for various SysTick events
    SysTicks reloadTime;
    uint8_t dummy8;
    uint16_t dummy16;
} SysTckFktCall, *PSysTckFktCall;

/**
 *  \brief Structure of a function call related to a message queue
 */
typedef struct msgFktCallStruc
{
    FktCallOneArg sysFktCall;    //!< Function call with no return and a void pointer as input argument
    MsgPrvdrs msgProv;    //!< specific message provider
    MsgProvType msgProvType;    //!< type of the provider linked with this message based function call
} MsgFktCall, *PMsgFktCall;

/**
 *  \brief Structure of a dummy function call
 */
typedef struct dummyFktCallStruc
{
    void * sysFktCall;/*4*/
    uint32_t dummy32;/*4*/
    uint16_t dummy16;/*2*/
    uint8_t dummy8_1;/*1*/
    uint8_t dummy8_2;/*1*/
} DummyFktCall, *PDummyFktCall;

/**
 *  \brief Union structure to unify the different types of system function calls.
 *
 *  Since every system function call depending on its context has a different handle, yet is kept in the same sysFkt array this union is introduced.
 *  Data specific to the context can be stored alongside to the function address.
 */
typedef struct sysFkt
{
    //ToDO think about how to specify the type of the sysFkt... mind the memory usage, since the array is preallocated
    /**
     * \union sysFkt::fktCallTypeUnion
     * \brief Union of function call types
     */
    union fktCallTypeUnion
    {
        TmrFktCall tmrFktCall;    //!< function call from within a Timer context
        SysTckFktCall sysTckFktCall;    //!< function call from within a system tick timer context
        MsgFktCall msgFktCall;    //!< function call from within a messaging context
        DummyFktCall dummyfktCall; //!< DUMMY
    } fktCallType;
} SysFkt, *PSysFkt;

/* END FKT */
/* SEMAPHORES */

/** \addtogroup sem
 * \{
 */

/**
 * \brief Enumeration of Semaphore types
 */
typedef enum semTypeEnum
{
    SemBin = (uint8_t) 0x0u, //!< Binary Semaphore
    SemCnt = (uint8_t) 0x1u  //!< Counting Semaphore
} SemType;

/**
 * \brief Bytes needed to create a mask for all available tasks.
 */
//#define SEM_NR_OF_TSK_REF_BYTES (uint8_t)((NR_OF_TSKS >> 3) + 1) // NR_OF_TSKS / 8 + 1 gives the number of bits needed for all tasks

/**
 *  \brief Struct for semaphore maintenance.
 *
 *  Contains information about the semaphore.
 */
typedef struct semStruc
{
    //uint8_t tskReferences[SEM_NR_OF_TSK_REF_BYTES]; //!< Mask for all tasks referenced by the semaphore
    //TskID semQStrtTskID;        //!< TskID of the first task in the waiting queue
    //TskPrio prioInheritPrio;    //!< Initial priority of the task currently occupying the semaphore
    SemType semType;    //!< Indicates the type of semaphore (binary or counting)
    SemCntr maxCntrVal; //!< Maximum Counter value assigned at the initialization of the Semaphore
   /**
     * \union semStruc::semSignalUnion
     * \brief Signaling counter for each type of semaphore
     */
    union semSignalUnion
    {
        SemCntr semCntrSig;     //!< Counting Semaphore - signaling counter
        SemCntr semBinSig;      //!< Binary Semaphore - signaled/not signaled
    } semSignal;
} Sem, *PSem;
/**\}*/
/* END SEMAPHORES */

/* MUTEXES */
/** \addtogroup mtx
 * \{
 */
/**
 *  \brief Struct for Mutex maintenance.
 *
 *  Contains information about the Mutex.
 */
typedef struct mtxStruc
{
    TskID mtxQStrtTskID;    //!< TskID of the first task in the waiting queue
    TskID mtxOccTskID;    //!< TskID of the task currently occupying the Mutex
} Mtx, *PMtx;
/**\}*/
/* END MUTEXES */

/* EVENTS */
/**
 * \addtogroup evt
 * \{
 */
/**
 *  \brief Struct for Event maintenance.
 *
 *  Contains information about the event.
 *  \note The design limits the number of entities, which can be notified by the event, to 32.
 */
typedef struct evtStruc
{
    EVTQSlots evtQ_Slots;    //!< MASK CONTAINING BITS INDICATING IF A SLOT IN THE EVENT QUEUE IS AVAILABLE OR TAKEN
    TskID evtObjs[EVT_QUEUE_SIZE ];    //!< EVENT QUEUE CONTAINING THE TASK IDS OF THE TASK HOLDING THE EVENT OBJECT REFERENCING THIS EVENT
} Evt, *PEvt;
/**\}*/
/* END EVENTS */

/* TIMER */
/**
 * \addtogroup StckdSWTmr
 * \{
 */
/**
 *  \brief Struct for system timer maintenance.
 */
typedef struct sysTimerStruc
{
    SysFktID sysFktIDQStrt;    //!< ID of the system function belonging to the timer
} SysTimer, *PSysTimer;

/**
 *  \brief Struct for task timer maintenance.
 */
typedef struct tskTimerStruc
{
    TskID tskIDQStrt;               //!< ID of the task belonging to the timer
} TskTimer, *PTskTimer;

/**
 *  \brief Struct for timer maintenance.
 */
typedef struct timerStruc
{
    LifeTime expirationTime;    //!< contains the time the timer expires relative to the PIT value
    TimerType timerType;        //!< Type of the timer
    /**
     * \union timerStruc::specTimerUnion
     * \brief Union of specialized timers
     *
     * There are either system timers or task timers
     */
    union specTimerUnion
    {
        SysTimer sysTimer; //!< System timer: #SysTimer
        TskTimer tskTimer; //!< Task timer: #TskTimer
    } specTimer;
} Timer, *PTimer;
/** \} */
/* END TIMER */

/* SYNC */
/**
 * \addtogroup sync
 * \{
 */
/**
 *
 * \brief unified structure for all synchronization mechanism objects.
 *
 * Keep track of the synchronization mechanism, that suspended the task.
 * Also keep track of the maximum remaining blocking time (in SysTicks).
 * Each synchronization mechanism objects has its own unique attributes within the structure.
 */
typedef struct syncEleStruc
{
    SyncEleType syncEleType;    //!< Type of the synchronization element referred to
    SyncEleID syncEleID;    //!< ID of the synchronization element
    //SysTicks maxBlckTime;    //!< maximum remaining blocking time in SysTicks

    union multipurposeByte
    {
        ACCSSType mntrAccssType;    //!< ACCSSType for the Mntr access
        uint8_t someDummy;
    } MultiPurposeByte;    //!< Multipurpose byte for use by any synchronization mechanism

    /**
     * \union syncEleStruc::syncEleHandle
     * \brief Unified specialized SyncEle Handles.
     *
     * Every synchronization mechanism has its own 4 byte structure in this union.
     * The structure is used to keep data specific to the synchronization mechanism.
     *
     * Handles | Description
     * :----- | :---------
     * EvtSyncEle | Event object for synchronization with event flags
     * TmrSyncEle | Timer object for synchronization with software timers
     * SemSyncEle | Semaphore object for synchronization with semaphores
     * MntrSyncEle | Monitor object for synchronization with monitors
     */
    union syncEleHandle
    {
        //EVENT
        /**
         * \brief Event #syncEleStruc::syncEleHandle
         *
         * Saves the event task's event group as #EvtMsk
         */
        struct evtSyncEle
        {
            EvtMsk evtMsk;    //!< Bit mask of events the task is currently waiting for
        } EvtSyncEle;
        //TIMER
        /**
         * \brief Timer #syncEleStruc::syncEleHandle
         *
         * Saves the expiration time of the task as #LifeTime
         */
        struct tmrSyncEle
        {
            LifeTime expireTime;    //!< Timer expiration time as LifeTime
        } TmrSyncEle;
        //SEMAPHORE
        /**
         * \brief Semaphore #syncEleStruc::syncEleHandle
         *
         * \note Currently unused
         */
        struct semSyncEle
        {
            uint8_t dummy1;
            uint8_t dummy2;
            uint8_t dummy3;
            uint8_t dummy4;
        } SemSyncEle;
        //Mutex
        /**
         * \brief Mutex #syncEleStruc::syncEleHandle
         *
         * \note Currently unused
         */
        struct mtxSyncEle
        {
            uint8_t dummy1;
            uint8_t dummy2;
            uint8_t dummy3;
            uint8_t dummy4;
        } MtxSyncEle;
        //MONITOR
        /**
         * \brief Monitor #syncEleStruc::syncEleHandle
         *
         * Saves the task's current type of access to the Monitor
         */
        struct mntrSyncEle
        {
            ACCSSType mntrAccssType;    //!< ACCSSType for the Mntr access

        } MntrSyncEle;
    } SyncEleHandle;    //!< Union of synchronization objects
} SyncEle, *PSyncEle;
/**\}*/

/* END SYNC */

/**
 * \addtogroup tsk
 * \{
 */
/**
 *  \brief Contains the #TskPrio visible to the system and the real #TskPrio
 *
 *  Each task has a visible #TskPrio which represents the priority the task currently has as seen by the system.
 *  Additionally each task saves its actual #TskPrio for further retrieval.
 */
typedef struct advTskPrio_struc
{
    volatile TskPrio actualTskPrio; //!< Actual #TskPrio which was assigned to the task
    volatile TskPrio visibleTskPrio; //!< #TskPrio currently visible to the system
} AdvTskPrio;

/* TASK */
/**
 *  \brief Task Control Block.
 *
 *  The Task Control block contains information about the task and its state.
 *  In addition the TCB contains a XORed pointer to the next and previous task queue entry.
 */
typedef struct tskTCB
{
    /*STCK*//*4*/volatile StackPtrT pStckPtr;    //!< current stack pointer
    /*STCK*//*4*/StackPtrT pStckTop;            //!< top of the stack

    /*STAT*//*4*/TskStartAddr pTskStrt;    //!< Pointer to task's function's address
    /*STAT*//*4*/TskEndAddr pTskEnd;    //!< Pointer to task's ending function, which is executed at the end of the task (usually tsk_EndTheTask)

    /*MSGG*//*4*/volatile PTskMB tskMailBox;     //!< pointer to task mailbox

    /*SYNC*//*4*/volatile PSysTickTMR sysTckTmr;    //!< Pointer to SysTickTMR for various SysTick events
    /*SYNC*//*4*/volatile PSyncEle tskSync;    //!< Pointer to SyncEle the task is currently being blocked by

    /*STCK*//*2*/StackSize stckSze;        //!< size of the task's stack

    // /*STAT*//*1*/volatile TskSettings tskSets; //!< Settings for the task

    /*SCHD*//*1*/AdvTskPrio tskPrio;    //!< Current priority settings of the task
    /*STAT*//*1*/volatile TskState tskState;     //!< Current state of the task

    /*SCHD*//*1*/TskID tskID;                    //!< ID of the task
    /*SCHD*//*1*/volatile TskID nxtTsk;    //!< TskID of the child task to the left
    /*SCHD*//*1*/volatile TskID prvTsk;    //!< TskID of the child task to the right
} TskTCB, *PTskTCB;/*36*/

/**\}*/
/* END TASK */

/*
 * ##################################################
 * END STRUCT TYPES
 * ##################################################
 */
/*
 * ##################################################
 * END TYPEDEFS
 * ##################################################
 */

/* STACK */
/* END STACK */

/* MESSAGE QUEUE */

/* END MESSAGE QUEUE */

/* SEMAPHORES */

/* END SEMAPHORES */

/* EVENTS */

/* END EVENTS */

/* TIMER */

/* END TIMER */

/* TASK */

/* END TASK */

/* FKT */

/* END FKT */

/* SYNC */

/* END SYNC */

//SYSCTRL
/** \addtogroup mem
 * \{
 */
/**
 * \brief Number of memory pools
 */
#define NR_OF_MEMPOOLS (uint8_t)0x7u

/**\}*/
//SYSCTRL

/**
 *  \brief Codes for OS functionality.
 *
 *  might be deprecated
 */
typedef uint8_t OsCode;
/**
 *  \brief Indicates whether additional context switching is needed.
 *  might be deprecated
 */
#define OS_FULL_DISPATCH                   ((OsCode)0x2u)
/**
 *  \brief Indicates whether a dispatch is needed.
 *  might be deprecated
 */
#define OS_DISPATCH_NEEDED                 ((OsCode)0x1u)

/**
 *  \brief Return codes for functions.
 */
typedef uint8_t RetCode;
/**
 *  \brief Indicates that there was a failure or faulty or unexpected behavior.
 */
#define RET_NOK                            ((RetCode)0x0u)
/**
 *  \brief Indicates that everything was/is ok.
 */
#define RET_OK                             ((RetCode)0x1u)
/**
 *  \brief Indicates that the allocation of a task's TskTCB failed.
 */
#define RET_MEM_ALLOC_FAIL_TCB             ((RetCode)0x1Au)
/**
 *  \brief Indicates that stack allocation failed.
 */
#define RET_MEM_ALLOC_FAIL_STACK           ((RetCode)0x1Cu)
/**
 *  \brief Indicates that there are currently too many tasks in the system.
 */
#define RET_TSK_TOO_MANY                   ((RetCode)0x2Fu)
/**
 *  \brief Indicates that there is no IDLE Task.
 */
#define RET_TSK_NO_IDLE_TSK                ((RetCode)0x20u)
/**
 *  \brief Indicates that there is already a conflicting IDLE Task.
 */
#define RET_TSK_CONFLICTING_IDLE_TSK       ((RetCode)0x21u)
/**
 *  \brief Indicates that a task is still running.
 */
#define RET_TSK_STILL_RUNNING              ((RetCode)0x24u)
/**
 *  \brief Indicates that a task is about to run.
 */
#define RET_TSK_IS_ABOUT_TO_RUN            ((RetCode)0x25u)
/**
 *  \brief Indicates that the stack was/is full.
 */
#define RET_STCK_ERR_FULL                  ((RetCode)0x3Fu)
/**
 *  \brief Indicates that the stack was/is empty.
 */
#define RET_STCK_ERR_EMPTY                 ((RetCode)0x30u)
/**
 *  \brief Indicates a stack overflow occurred.
 */
#define RET_STCK_ERR_INDEX_OVERFLOW        ((RetCode)0x31u)
/**
 *  \brief Indicates a stack underflow occurred.
 */
#define RET_STCK_ERR_INDEX_UNDERFLOW       ((RetCode)0x32u)
/**
 *  \brief Indicates that there was no pointer to an element on the stack.
 */
#define RET_STCK_NO_STCKELEM_PTR           ((RetCode)0x33u)
/**
 *  \brief Indicates that there was no stack pointer.
 */
#define RET_STCK_NO_STCKPTR                ((RetCode)0x34u)

/* MEMORY_MANAGEMENT */
/**
 *  \brief Type for memory size
 */
typedef uint16_t MemSize;

/* END MEMORY_MANAGEMENT */

/* SCHEDULER */
/**
 *  \brief Struct for OS flags.
 *
 *  These Flags control the execution of low level OS functions (e.g. scheduler, context switch, low power functionalities).
 */
typedef struct gStruc_OS_FLAGS
{
    volatile uint8_t g_DispatchFlag :2;    //!< Indicates whether or not a dispatch/context switch is needed
    volatile uint8_t g_needsScheduling :1;    //!< Indicates whether or not scheduling is needed
    volatile uint8_t g_tskCriticalExecution :1;    //!< Indicates whether or not a task is in a critical state of its execution
    volatile uint8_t gLPExit :1;    //!< Indicates whether or not the low power mode has been exited
    volatile uint8_t gWokenUp :1;    //!< Indicates whether or not the system has fully woken up from a low power mode
} BitsOSFlags;

/* END SCHEDULER */

/* SVC */
/**
 * \brief   Contains the SVCCode for the SVC Call
 */
typedef enum svcCode
{
    SVC_OS_START = (uint8_t) 0x0u,      //!< Start the OS
    SVC_TSK_INIT,                       //!< Initialize a task
    SVC_TSK_SETPRIO,                    //!< Set a task's priority
    SVC_TSK_ACTV,                       //!< Activate a task
    SVC_TSK_KILL,                       //!< Kill a task
    SVC_TSK_SET_CRIT,                   //!< Set critical execution state
    SVC_TSK_RESET_CRIT,                 //!< Reset critical execution state
    SVC_MTX_TAKE,                       //!< Attempt to take a mutex
    SVC_MTX_GIVE,                       //!< Give back an occupied mutex
    SVC_SEM_WAIT,                       //!< Take a semaphore
    SVC_SEM_SIGNAL,                     //!< Release a semaphore
    SVC_MNTR_INIT_MNTR,                 //!< Initialize Monitor
    SVC_MNTR_REQ_READ_ACC,              //!< Request read access to monitor
    SVC_MNTR_REQ_WRITE_ACC,             //!< Request write access to monitor
    SVC_MNTR_REL_ACC,                   //!< Release current access to monitor
    SVC_EVT_SEND,                       //!< Send an event
    SVC_EVT_RECV,                       //!< Wait for an event
    SVC_TMR_SET,                        //!< Set up a timer
    SVC_SYSTCK_SET,                     //!< Set a system tick timer
    SVC_MSGQ_CRT_Q,                     //!< create a new message queue
    SVC_MSGQ_DEL_Q,                     //!< delete an existing message queue
    SVC_MSGQ_REG_PUB,                   //!< Register to a message queue as a publisher
    SVC_MSGQ_REG_TSK_SUB,               //!< Register to a message queue as a subscriber
    SVC_MSGQ_REG_SYS_SUB,               //!< Register system function to a message queue as a subscriber
    SVC_MSGQ_MSG_PUB,                   //!< Publish a message to a message queue
    SVC_MSGQ_MSG_READ,                  //!< Read a message from a message queue
    SVC_MSGQ_MSG_READALLNEW,            //!< Read all new messages from a message queue
    SVC_MSGQ_MSG_READALL,               //!< Read all messages from a message queue
    SVC_MSGQ_MSG_TAKE,                  //!< Read and destroy a message from a message queue
    SVC_MSGQ_MSG_TAKEALLNEW,            //!< Read and destroy all new messages from a message queue
    SVC_MSGQ_MSG_TAKEALL,               //!< Read and destroy all messages from a message queue
    SVC_OS_SCHEDULE,                    //!< Call the scheduler
    SVC_CALL_FKT_PRIV,                  //!< Call a function with privileges using main stack
    SVC_LP_ENTER,                       //!< Enter low power mode
    SVC_TRC_OUPUT,                      //!< Output the trace buffer
    SVC_OS_ERROR = (uint8_t) 0xFFu,     //!< OS ERROR
} SVCCode;

/* END SVC */
#endif /* HEADERS_R_RTOS_INC_H_ */
