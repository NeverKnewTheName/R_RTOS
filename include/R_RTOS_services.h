/**
 * \file    R_RTOS_services.h
 * \author  Christian Neuberger (NeubergerCh50344@th-nuernberg.de)
 * \date    18.12.2015
 *
 * \brief Service calls, which can be used by/inside tasks
 */

#ifndef HEADERS_R_RTOS_SERVICES_H_
#define HEADERS_R_RTOS_SERVICES_H_

#include "R_RTOS_inc.h"

#ifndef __STATIC_INLINE
#define __STATIC_INLINE  static inline
#endif

/** \def INPUT_ARG_1(input)
 *  \brief Sets \a input as the first input argument for a following function call.
 *
 *  \param  [in]    input  input argument - max uint32_t
 *
 *  When a function is called the Parameters are passed through the the registers r0-r3.
 *  To mimic the behavior of such a regular function call, one can manually put the arguments into the corresponding registers.
 *
 *  The first argument will be stored in R0.
 */
#define INPUT_ARG_1(input)  __asm volatile( "movs r0, %0 \n"::"l"(input) :)

/** \def INPUT_ARG_2(input)
 *  \brief Sets \a input as the second input argument for a following function call.
 *
 *  \param  [in]    input  input argument - max uint32_t
 *
 *  When a function is called the Parameters are passed through the the registers r0-r3.
 *  To mimic the behavior of such a regular function call, one can manually put the arguments into the corresponding registers.
 *
 *  The second argument will be stored in R1.
 */
#define INPUT_ARG_2(input)  __asm volatile( "movs r1, %0 \n"::"l"(input) :)

/** \def INPUT_ARG_3(input)
 *  \brief Sets \a input as the third input argument for a following function call.
 *
 *  \param  [in]    input  input argument - max uint32_t
 *
 *  When a function is called the Parameters are passed through the the registers r0-r3.
 *  To mimic the behavior of such a regular function call, one can manually put the arguments into the corresponding registers.
 *
 *  The third argument will be stored in R2.
 */
#define INPUT_ARG_3(input)  __asm volatile( "movs r2, %0 \n"::"l"(input) :)

/** \def INPUT_ARG_4(input)
 *  \brief Sets \a input as the fourth input argument for a following function call.
 *
 *  \param  [in]    input  input argument - max uint32_t
 *
 *  When a function is called the Parameters are passed through the the registers r0-r3.
 *  To mimic the behavior of such a regular function call, one can manually put the arguments into the corresponding registers.
 *
 *  The fourth argument will be stored in R3.
 */
#define INPUT_ARG_4(input)  __asm volatile( "movs r3, %0 \n"::"l"(input) :)

/** \def OUTPUT_ARG(output)
 *  \brief Retrieves an return value from a preceding function call and stores it into \a output.
 *
 *  \param  [out]   output  output argument - max uint32_t
 *
 *  When a function returns the return value is stored in r0.
 *  To mimic the behavior of such a regular function return, one can manually retrieve the return value from the exception stack frame stored using the msp.
 *  Register r0 is the last valued pushed onto the stack, thus it is the first value to pop off the stack.
 */
#define OUTPUT_ARG(output)  __asm volatile( "mrs     r1,     msp \n ldr r0, [r1] \n movs %0, r0 \n":"=l"(output): :"memory")

/** \def SVC( svcCode )
 *  \brief SVC Call with the given \a svcCode.
 *
 *  \param  [in]    svcCode  number of the SVC Call to be called
 *
 *  To make a SuperVisorCall the svc instruction has to be executed.
 *  A byte value can be passed alongside to further distinct the requested service.
 */
#define SVC( svcCode )      __asm volatile( "svc %[svc_code] \n" : : [svc_code]"I"(svcCode) : )

__attribute__( ( always_inline ) ) __STATIC_INLINE void svc_os_StartOS( void )
{
    SVC( SVC_OS_START );
    while ( 1 )
    {
        ;
    }
}

__attribute__( ( always_inline ))  __STATIC_INLINE RetCode svc_tsk_InitTsk(
                                                                         const TskID tskID,
                                                                         const TskStartAddr const tskAddr,
                                                                         const TskStartAddr const tskEndAddr,
                                                                         const StackSize stckSze )
{
    INPUT_ARG_1( tskID );
    INPUT_ARG_2( tskAddr );
    INPUT_ARG_3( tskEndAddr );
    INPUT_ARG_4( stckSze );
    SVC( SVC_TSK_INIT );
    RetCode returnVal;
    OUTPUT_ARG( returnVal );
    return returnVal;
}

__attribute__( ( always_inline ))  __STATIC_INLINE RetCode svc_tsk_SetTskPrio(
                                                                            const TskID tskID,
                                                                            const TskPrio tskPrio )
{
    INPUT_ARG_1( tskID );
    INPUT_ARG_2( tskPrio );
    SVC( SVC_TSK_SETPRIO );
    RetCode returnVal;
    OUTPUT_ARG( returnVal );
    return returnVal;
}

__attribute__( ( always_inline ))  __STATIC_INLINE RetCode svc_tsk_ActvTsk(
                                                                         const TskID tskID )
{
    INPUT_ARG_1( tskID );
    SVC( SVC_TSK_ACTV );
    RetCode returnVal;
    OUTPUT_ARG( returnVal );
    return returnVal;
}

__attribute__( ( always_inline ))  __STATIC_INLINE RetCode svc_tsk_KillTsk(
                                                                         TskTCB* const tsk )
{
    INPUT_ARG_1( tsk );
    SVC( SVC_TSK_KILL );
    RetCode returnVal;
    OUTPUT_ARG( returnVal );
    return returnVal;
}

__attribute__( ( always_inline ))  __STATIC_INLINE RetCode svc_tsk_setTskCriticalState(
                                                                                     void )
{
    SVC( SVC_TSK_SET_CRIT );
    RetCode returnVal;
    OUTPUT_ARG( returnVal );
    return returnVal;
}

__attribute__( ( always_inline ))  __STATIC_INLINE RetCode svc_tsk_resetTskCriticalState(
                                                                                       void )
{
    SVC( SVC_TSK_RESET_CRIT );
    RetCode returnVal;
    OUTPUT_ARG( returnVal );
    return returnVal;
}

__attribute__( ( always_inline ))  __STATIC_INLINE RetCode svc_sem_TakeSem(
                                                                         const SemNr semNr,
                                                                         TskTCB* const tsk,
                                                                         const SysTicks maxTimeToWait )
{
    INPUT_ARG_1( semNr );
    INPUT_ARG_2( tsk );
    INPUT_ARG_3( maxTimeToWait );
    SVC( SVC_SEM_TAKE );
    RetCode returnVal;
    OUTPUT_ARG( returnVal );
    return returnVal;
}

__attribute__( ( always_inline ))  __STATIC_INLINE RetCode svc_sem_GiveSem(
                                                                         const SemNr semNr,
                                                                         TskTCB* const tsk )
{
    INPUT_ARG_1( semNr );
    INPUT_ARG_2( tsk );
    SVC( SVC_SEM_GIVE );
    RetCode returnVal;
    OUTPUT_ARG( returnVal );
    return returnVal;
}

__attribute__( ( always_inline ))  __STATIC_INLINE RetCode svc_evt_SendEvt(
                                                                         const EvtNr evt )
{
    INPUT_ARG_1( evt );
    SVC( SVC_EVT_SEND );
    RetCode returnVal;
    OUTPUT_ARG( returnVal );
    return returnVal;
}

__attribute__( ( always_inline ))  __STATIC_INLINE RetCode svc_evt_RecvEvt(
                                                                         PTskTCB const tsk,
                                                                         EVTQSlots evtMask,
                                                                         const SysTicks maxTimeToWait )
{
    INPUT_ARG_1( tsk );
    INPUT_ARG_2( evtMask );
    INPUT_ARG_3( maxTimeToWait );
    SVC( SVC_EVT_RECV );
    RetCode returnVal;
    OUTPUT_ARG( returnVal );
    return returnVal;
}

__attribute__( ( always_inline ))  __STATIC_INLINE RetCode svc_tmr_SetTimer(
                                                                          const WaitTime msToWait,
                                                                          TskTCB* const tsk )
{
    INPUT_ARG_1( msToWait );
    INPUT_ARG_2( tsk );
    SVC( SVC_TMR_SET );
    RetCode returnVal;
    OUTPUT_ARG( returnVal );
    return returnVal;
}

__attribute__( ( always_inline ))  __STATIC_INLINE RetCode svc_sysTck_SetTimer(
                                                                             const SysTicks ticksToWait,
                                                                             TskID const tskID )
{
    INPUT_ARG_1( ticksToWait );
    INPUT_ARG_2( tskID );
    SVC( SVC_SYSTCK_SET );
    RetCode returnVal;
    OUTPUT_ARG( returnVal );
    return returnVal;
}

__attribute__( ( always_inline ))  __STATIC_INLINE RetCode svc_msgq_CrtQ(
                                                                       const QID msgQID )
{
    INPUT_ARG_1( msgQID );
    SVC( SVC_MSGQ_CRT_Q );
    RetCode returnVal;
    OUTPUT_ARG( returnVal );
    return returnVal;
}

__attribute__( ( always_inline ))  __STATIC_INLINE RetCode svc_msgq_DelQ(
                                                                       const QID msgQID )
{
    INPUT_ARG_1( msgQID );
    SVC( SVC_MSGQ_DEL_Q );
    RetCode returnVal;
    OUTPUT_ARG( returnVal );
    return returnVal;
}

__attribute__( ( always_inline ))  __STATIC_INLINE RetCode svc_msgq_RegPub(
                                                                         PTskTCB const tsk,
                                                                         const QID msgQID )
{
    INPUT_ARG_1( tsk );
    INPUT_ARG_2( msgQID );
    SVC( SVC_MSGQ_REG_PUB );
    RetCode returnVal;
    OUTPUT_ARG( returnVal );
    return returnVal;
}

__attribute__( ( always_inline ))  __STATIC_INLINE RetCode svc_msgq_RegTskSub(
                                                                            PTskTCB const tsk,
                                                                            const QID msgQID )
{
    INPUT_ARG_1( tsk );
    INPUT_ARG_2( msgQID );
    SVC( SVC_MSGQ_REG_TSK_SUB );
    RetCode returnVal;
    OUTPUT_ARG( returnVal );
    return returnVal;
}

__attribute__( ( always_inline ))  __STATIC_INLINE RetCode svc_msgq_RegSysSub(
                                                                            const SysFktID sysID,
                                                                            const QID msgQID )
{
    INPUT_ARG_1( sysID );
    INPUT_ARG_2( msgQID );
    SVC( SVC_MSGQ_REG_SYS_SUB );
    RetCode returnVal;
    OUTPUT_ARG( returnVal );
    return returnVal;
}

__attribute__( ( always_inline ))  __STATIC_INLINE RetCode svc_msgq_PubMsg(
                                                                         const QID msgQID,
                                                                         const DataSize dataSize,
                                                                         const DataType dataType,
                                                                         CData const data )
{
    INPUT_ARG_1( msgQID );
    INPUT_ARG_2( dataSize );
    INPUT_ARG_3( dataType );
    INPUT_ARG_4( data );
    SVC( SVC_MSGQ_MSG_PUB );
    RetCode returnVal;
    OUTPUT_ARG( returnVal );
    return returnVal;
}

__attribute__( ( always_inline ))  __STATIC_INLINE RetCode svc_msgq_MsgRead(
                                                                          const QID msgQID,
                                                                          const TskID tskID,
                                                                          const PMQData * dataBuffer )
{
    INPUT_ARG_1( msgQID );
    INPUT_ARG_2( tskID );
    INPUT_ARG_3( dataBuffer );
    SVC( SVC_MSGQ_MSG_READ );
    RetCode returnVal;
    OUTPUT_ARG( returnVal );
    return returnVal;
}

__attribute__( ( always_inline ))  __STATIC_INLINE RetCode svc_msgq_MsgRead_AllNew(
                                                                                 const QID msgQID,
                                                                                 const TskID tskID,
                                                                                 Data dataBuffer )
{
    INPUT_ARG_1( msgQID );
    INPUT_ARG_2( tskID );
    INPUT_ARG_3( dataBuffer );
    SVC( SVC_MSGQ_MSG_READALLNEW );
    RetCode returnVal;
    OUTPUT_ARG( returnVal );
    return returnVal;
}

__attribute__( ( always_inline ))  __STATIC_INLINE RetCode svc_msgq_MsgRead_All(
                                                                              const QID msgQID,
                                                                              const TskID tskID,
                                                                              Data dataBuffer )
{
    INPUT_ARG_1( msgQID );
    INPUT_ARG_2( tskID );
    INPUT_ARG_3( dataBuffer );
    SVC( SVC_MSGQ_MSG_READALL );
    RetCode returnVal;
    OUTPUT_ARG( returnVal );
    return returnVal;
}

__attribute__( ( always_inline ))  __STATIC_INLINE RetCode svc_msgq_MsgTake(
                                                                          const QID msgQID,
                                                                          const TskID tskID,
                                                                          Data dataBuffer )
{
    INPUT_ARG_1( msgQID );
    INPUT_ARG_2( tskID );
    INPUT_ARG_3( dataBuffer );
    SVC( SVC_MSGQ_MSG_TAKE );
    RetCode returnVal;
    OUTPUT_ARG( returnVal );
    return returnVal;
}

__attribute__( ( always_inline ))  __STATIC_INLINE RetCode svc_msgq_MsgTake_AllNew(
                                                                                 const QID msgQID,
                                                                                 const TskID tskID,
                                                                                 Data dataBuffer )
{
    INPUT_ARG_1( msgQID );
    INPUT_ARG_2( tskID );
    INPUT_ARG_3( dataBuffer );
    SVC( SVC_MSGQ_MSG_TAKEALLNEW );
    RetCode returnVal;
    OUTPUT_ARG( returnVal );
    return returnVal;
}

__attribute__( ( always_inline ))  __STATIC_INLINE RetCode svc_msgq_MsgTake_All(
                                                                              const QID msgQID,
                                                                              const TskID tskID,
                                                                              Data dataBuffer )
{
    INPUT_ARG_1( msgQID );
    INPUT_ARG_2( tskID );
    INPUT_ARG_3( dataBuffer );
    SVC( SVC_MSGQ_MSG_TAKEALL );
    RetCode returnVal;
    OUTPUT_ARG( returnVal );
    return returnVal;
}

__attribute__( ( always_inline ))  __STATIC_INLINE RetCode svc_os_Scheduler( void )
{
    SVC( SVC_OS_SCHEDULE );
    RetCode returnVal;
    OUTPUT_ARG( returnVal );
    return returnVal;
}

__attribute__( ( always_inline ))  __STATIC_INLINE RetCode svc_cll_FktWithPrivileges(
                                                                                   const TskStartAddr const fktToCall )
{
    INPUT_ARG_1( fktToCall );
    SVC( SVC_CALL_FKT_PRIV );
    RetCode returnVal;
    OUTPUT_ARG( returnVal );
    return returnVal;
}

__attribute__( ( always_inline ))  __STATIC_INLINE RetCode svc_lp_EnterLPMode(
                                                                            void )
{
    SVC( SVC_LP_ENTER );
    RetCode returnVal;
    OUTPUT_ARG( returnVal );
    return returnVal;
}

__attribute__( ( always_inline ))  __STATIC_INLINE RetCode svc_trc_OutputTrace(
                                                                             void *msg )
{
    INPUT_ARG_1( msg );
    SVC( SVC_TRC_OUPUT );
    RetCode returnVal;
    OUTPUT_ARG( returnVal );
    return returnVal;
}

#endif /* HEADERS_R_RTOS_SERVICES_H_ */
