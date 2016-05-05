#include "PortFunc.h"
#include "TimerFunc.h"

#include "R_RTOS_services.h"

#include "R_RTOS_task.h"
#include "R_RTOS_timer.h"
#include "R_RTOS_SysTickTMR.h"

extern void tsk_EndTheTask( void );

extern TskTCB tsk_AR[];
extern SysFkt sys_SysFkt[];

void tsk1( void );
void tsk2( void );
void tsk3( void );
void tsk4( void );

void tsk1( void )
{
    SET_PIN_LOW( PIN_LED0 );
    svc_sysTck_SetTimer( (SysTicks) 2u, (TskID) 0x1u );
    SET_PIN_HIGH( PIN_LED0 );

    svc_tsk_KillTsk( &tsk_AR[1] );
}
void tsk2( void )
{
    SET_PIN_LOW( PIN_LED1 );
    svc_sysTck_SetTimer( (SysTicks) 1u, (TskID) 0x2u );
    SET_PIN_HIGH( PIN_LED1 );

    svc_tsk_KillTsk( &tsk_AR[2] );
}
void tsk3( void )
{
    SET_PIN_LOW( PIN_LED2 );
    svc_sysTck_SetTimer( (SysTicks) 1u, (TskID) 0x3u );
    SET_PIN_HIGH( PIN_LED2 );
    svc_sysTck_SetTimer( (SysTicks) 1u, (TskID) 0x3u );
    SET_PIN_LOW( PIN_LED2 );
    svc_sysTck_SetTimer( (SysTicks) 1u, (TskID) 0x3u );
    SET_PIN_HIGH( PIN_LED2 );

    svc_tsk_KillTsk( &tsk_AR[3] );
}
void tsk4( void )
{
    SET_PIN_LOW( PIN_LED3 );
    svc_sysTck_SetTimer( (SysTicks) 3u, (TskID) 0x4u );
    SET_PIN_HIGH( PIN_LED3 );
    svc_sysTck_SetTimer( (SysTicks) 1u, (TskID) 0x4u );
    SET_PIN_LOW( PIN_LED3 );
    svc_sysTck_SetTimer( (SysTicks) 5u, (TskID) 0x4u );
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
    //sys_SysFkt[0].fktCallType.sysTckFktCall.sysFktCall = &actvTsk1;
    //sys_SysFkt[0].fktCallType.sysTckFktCall.reloadTime = 4u;
    sys_SysFkt[1].fktCallType.sysTckFktCall.sysFktCall = &actvTsk2;
    sys_SysFkt[1].fktCallType.sysTckFktCall.reloadTime = 4u;
    sys_SysFkt[2].fktCallType.sysTckFktCall.sysFktCall = &actvTsk3;
    sys_SysFkt[2].fktCallType.sysTckFktCall.reloadTime = 8u;
    sys_SysFkt[3].fktCallType.sysTckFktCall.sysFktCall = &actvTsk4;
    sys_SysFkt[3].fktCallType.sysTckFktCall.reloadTime = 17u;
    tmr_setSysTimer( 0, 2000u, 0x1u );
    //sysTck_setSysTckTMR( 4u, SysTckObj_SysFktWait, (uint8_t) 0x0u );
    sysTck_setSysTckTMR( 4u, SysTckObj_SysFktWait, (uint8_t) 0x1u );
    sysTck_setSysTckTMR( 6u, SysTckObj_SysFktWait, (uint8_t) 0x2u );
    sysTck_setSysTckTMR( 8u, SysTckObj_SysFktWait, (uint8_t) 0x3u );
}
