#include "PortFunc.h"
#include "TimerFunc.h"

#include "R_RTOS_services.h"

#include "R_RTOS_task.h"
#include "R_RTOS_timer.h"

extern void tsk_EndTheTask( void );
extern void os_SCHEDULE(void);

extern TskTCB tsk_AR[];
extern SysFkt sys_SysFkt[AMOUNT_SYS_FKT ];

void tsk1( void );
void tsk2( void );
void tsk3( void );
void tsk4( void );
void tsk5( void );

void tsk1( void )
{
    SET_PIN_LOW( PIN_LED0 );

    svc_tsk_InitTsk( (TskID) 0x2u, &tsk2, &tsk_EndTheTask, MY_STACK_SIZE );
    //svc_tsk_SetTskPrio( (TskID) 0x2u, TSK_PRIO_MED );
    svc_tsk_ActvTsk( (TskID) 0x2u );

    svc_tsk_KillTsk( &tsk_AR[1] );
}
void tsk2( void )
{
    SET_PIN_HIGH( PIN_LED0 );
    SET_PIN_LOW( PIN_LED1 );

    svc_tsk_InitTsk( (TskID) 0x3u, &tsk3, &tsk_EndTheTask, MY_STACK_SIZE );
    //svc_tsk_SetTskPrio( (TskID) 0x3u, TSK_PRIO_MED );
    svc_tsk_ActvTsk( (TskID) 0x3u );

    svc_tsk_KillTsk( &tsk_AR[2] );
}
void tsk3( void )
{
    SET_PIN_HIGH( PIN_LED1 );

    svc_tsk_InitTsk( (TskID) 0x1u, &tsk1, &tsk_EndTheTask, MY_STACK_SIZE );
    //svc_tsk_SetTskPrio( (TskID) 0x1u, TSK_PRIO_MED );
    svc_tsk_ActvTsk( (TskID) 0x1u );

    svc_tsk_KillTsk( &tsk_AR[3] );
}

void tsk4( void )
{
    TOGGLE_PIN( PIN_LED3 );

    svc_tsk_KillTsk( &tsk_AR[4] );
}

void tsk5( void )
{
    TOGGLE_PIN( PIN_LED3 );

    svc_tsk_KillTsk( &tsk_AR[5] );
}

void actvTsk1( void )
{
    tsk_tskInit( (TskID) 0x1u, &tsk1, &tsk_EndTheTask, MY_STACK_SIZE );
    tsk_ChngePrio( &tsk_AR[0x1u], TSK_PRIO_MED );
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
    RetCode error = RET_OK;
    error = tsk_tskInit(
            (TskID) 0x4u, &tsk4, &tsk_EndTheTask, MY_STACK_SIZE );
    error = tsk_ChngePrio(&tsk_AR[(TskID)0x4u], TSK_PRIO_ABOVMED);
    error = tsk_ActvTsk( &tsk_AR[(TskID) 0x4u] );
    error = tsk_tskInit(
            (TskID) 0x5u, &tsk5, &tsk_EndTheTask, MY_STACK_SIZE );
    error = tsk_ChngePrio(&tsk_AR[(TskID)0x5u], TSK_PRIO_ABOVMED);
    error = tsk_ActvTsk( &tsk_AR[(TskID) 0x5u] );
//    error = tsk_tskInit( (TskID) 0x6u, &tsk6, &tsk_EndTheTask, MIN_STACK_SIZE + 8u );
//    error = tsk_ActvTsk( &tsk_AR[(TskID) 0x6u] );
//    error = tsk_tskInit( (TskID) 0x7u, &tsk7, &tsk_EndTheTask, MIN_STACK_SIZE + 8u );
//    error = tsk_ActvTsk( &tsk_AR[(TskID) 0x7u] );
//    error = tsk_tskInit( (TskID) 0x8u, &tsk8, &tsk_EndTheTask, MIN_STACK_SIZE + 8u );
//    error = tsk_ActvTsk( &tsk_AR[(TskID) 0x8u] );
//    error = tsk_tskInit( (TskID) 0x9u, &tsk9, &tsk_EndTheTask, MIN_STACK_SIZE + 4u );
//    error = tsk_ActvTsk( &tsk_AR[(TskID) 0x9u] );
//    error = tsk_tskInit( (TskID) 0xAu, &tsk10, &tsk_EndTheTask, MIN_STACK_SIZE + 4u );
//    error = tsk_ActvTsk( &tsk_AR[(TskID) 0xAu] );
    os_SCHEDULE();
}

void OS_START( void )
{
    sys_SysFkt[0].fktCallType.tmrFktCall.sysFktCall = &actvTsk1;
    sys_SysFkt[1].fktCallType.tmrFktCall.sysFktCall = &actvTsk2;
    sys_SysFkt[2].fktCallType.tmrFktCall.sysFktCall = &actvTsk3;
    sys_SysFkt[3].fktCallType.tmrFktCall.sysFktCall = &actvTsk4;
    tmr_setSysTimer( 0, 200u, 0x0u );
//    tmr_setSysTimer( 1, 200u, 0x1u );
//    tmr_setSysTimer( 2, 200u, 0x1u );
    tmr_setSysTimer( 3, 200u, 0x1u );


    SET_PIN_LOW( PIN_LED1 );
    WAIT_MS( (uint8_t ) 100u );
    SET_PIN_HIGH( PIN_LED1 );
    WAIT_MS( (uint8_t ) 100u );
    SET_PIN_LOW( PIN_LED1 );
    WAIT_MS( (uint8_t ) 100u );
    SET_PIN_HIGH( PIN_LED1 );
    WAIT_MS( (uint8_t ) 100u );
    SET_PIN_LOW( PIN_LED1 );
    WAIT_MS( (uint8_t ) 100u );
    SET_PIN_HIGH( PIN_LED1 );
}
