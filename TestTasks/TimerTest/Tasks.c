#include "PortFunc.h"
#include "TimerFunc.h"

#include "R_RTOS_services.h"

#include "R_RTOS_task.h"
#include "R_RTOS_timer.h"

extern void tsk_EndTheTask( void );

extern TskTCB tsk_AR[];
extern SysFkt sys_SysFkt[];

void tsk1( void );
void tsk2( void );
void tsk3( void );
void tsk4( void );

void tsk1( void )
{
#ifdef __DEBUG__
#ifdef __DEBUG__FLOW__
    WRITE_TO_MSG_BUFF( gSysMsg, "T1" );
#endif
#endif

    SET_PIN_LOW( PIN_LED0 );
    svc_tmr_SetTimer( (WaitTime) 15, &tsk_AR[1] );
    SET_PIN_HIGH( PIN_LED0 );
//    svc_tmr_SetTimer( (WaitTime) 16, &tsk_AR[1] );
//    SET_PIN_LOW( PIN_LED0 );
//    svc_tmr_SetTimer( (WaitTime) 17, &tsk_AR[1] );
    SET_PIN_HIGH( PIN_LED0 );

    svc_tsk_KillTsk( &tsk_AR[1] );
}
void tsk2( void )
{
#ifdef __DEBUG__
#ifdef __DEBUG__FLOW__
    WRITE_TO_MSG_BUFF( gSysMsg, "T2" );
#endif
#endif
    SET_PIN_LOW( PIN_LED1 );
    svc_tmr_SetTimer( (WaitTime) 10, &tsk_AR[2] );
    SET_PIN_HIGH( PIN_LED1 );
    svc_tmr_SetTimer( (WaitTime) 10, &tsk_AR[2] );
    SET_PIN_LOW( PIN_LED1 );
    svc_tmr_SetTimer( (WaitTime) 15, &tsk_AR[2] );
    SET_PIN_HIGH( PIN_LED1 );

    svc_tsk_KillTsk( &tsk_AR[2] );
}
void tsk3( void )
{
#ifdef __DEBUG__
#ifdef __DEBUG__FLOW__
    WRITE_TO_MSG_BUFF( gSysMsg, "T3" );
#endif
#endif

    SET_PIN_LOW( PIN_LED2 );
    svc_tmr_SetTimer( (WaitTime) 15, &tsk_AR[3] );
    SET_PIN_HIGH( PIN_LED2 );
    svc_tmr_SetTimer( (WaitTime) 17, &tsk_AR[3] );
    SET_PIN_LOW( PIN_LED2 );
    svc_tmr_SetTimer( (WaitTime) 11, &tsk_AR[3] );
    SET_PIN_HIGH( PIN_LED2 );

    svc_tsk_KillTsk( &tsk_AR[3] );
}
void tsk4( void )
{
#ifdef __DEBUG__
#ifdef __DEBUG__FLOW__
    WRITE_TO_MSG_BUFF( gSysMsg, "T4" );
#endif
#endif

    SET_PIN_LOW( PIN_LED3 );
    svc_tmr_SetTimer( (WaitTime) 100, &tsk_AR[4] );
    SET_PIN_HIGH( PIN_LED3 );
    svc_tmr_SetTimer( (WaitTime) 250, &tsk_AR[4] );
    SET_PIN_LOW( PIN_LED3 );
    svc_tmr_SetTimer( (WaitTime) 1111, &tsk_AR[4] );
    SET_PIN_HIGH( PIN_LED3 );

    svc_tsk_KillTsk( &tsk_AR[4] );
}

void actvTsk1( void )
{
    tsk_tskInit( (TskID) 0x1u, &tsk1, &tsk_EndTheTask, MY_STACK_SIZE );
    tsk_ActvTsk( &tsk_AR[(TskID) 0x1u] );
    os_SCHEDULE();
}
void actvTsk2( void )
{
    tsk_tskInit( (TskID) 0x2u, &tsk2, &tsk_EndTheTask, MY_STACK_SIZE );
    tsk_ActvTsk( &tsk_AR[(TskID) 0x2u] );
    os_SCHEDULE();
}
void actvTsk3( void )
{
    tsk_tskInit( (TskID) 0x3u, &tsk3, &tsk_EndTheTask, MY_STACK_SIZE );
    tsk_ActvTsk( &tsk_AR[(TskID) 0x3u] );
    os_SCHEDULE();
}
void actvTsk4( void )
{
    tsk_tskInit( (TskID) 0x4u, &tsk4, &tsk_EndTheTask, MY_STACK_SIZE );
    tsk_ActvTsk( &tsk_AR[(TskID) 0x4u] );
    os_SCHEDULE();
}

void OS_START( void )
{
    sys_SysFkt[0].fktCallType.tmrFktCall.sysFktCall = &actvTsk1;
    sys_SysFkt[1].fktCallType.tmrFktCall.sysFktCall = &actvTsk2;
    sys_SysFkt[2].fktCallType.tmrFktCall.sysFktCall = &actvTsk3;
    sys_SysFkt[3].fktCallType.tmrFktCall.sysFktCall = &actvTsk4;
    tmr_setSysTimer( 0, 333u, 0x1u );
    tmr_setSysTimer( 1, 230u, 0x1u );
    tmr_setSysTimer( 2, 200u, 0x1u );
    tmr_setSysTimer( 3, 2000u, 0x1u );

//    SET_PIN_LOW( PIN_LED1 );
//    WAIT_MS( (uint8_t ) 100u );
//    SET_PIN_HIGH( PIN_LED1 );
//    WAIT_MS( (uint8_t ) 100u );
//    SET_PIN_LOW( PIN_LED1 );
//    WAIT_MS( (uint8_t ) 100u );
//    SET_PIN_HIGH( PIN_LED1 );
//    WAIT_MS( (uint8_t ) 100u );
//    SET_PIN_LOW( PIN_LED1 );
//    WAIT_MS( (uint8_t ) 100u );
//    SET_PIN_HIGH( PIN_LED1 );
}
