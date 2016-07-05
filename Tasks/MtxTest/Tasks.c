#include "R_RTOS_services.h"
#include "PortFunc.h"
#include "TimerFunc.h"

#include "R_RTOS_task.h"
#include "R_RTOS_timer.h"

extern void tsk_EndTheTask( void );
extern SysFkt sys_SysFkt[AMOUNT_SYS_FKT ];

extern TskTCB tsk_AR[];

void tsk1( void );
void tsk2( void );

void tsk1( void )
{
    SET_PIN_LOW(PIN_LED0);
    svc_mtx_TakeMtx( (MtxNr) 0x1u, &tsk_AR[1], 100 );
    SET_PIN_HIGH(PIN_LED0);

    SET_PIN_LOW( PIN_LED1 );
    SET_PIN_LOW( PIN_LED2 );

    svc_tsk_InitTsk( (TskID) 0x2u, &tsk2, &tsk_EndTheTask, MY_STACK_SIZE );
    svc_tsk_SetTskPrio( (TskID) 0x2u, TSK_PRIO_HIG );
    svc_tsk_ActvTsk( (TskID) 0x2u );

    SET_PIN_HIGH( PIN_LED1 );
    svc_tmr_SetTimer( (WaitTime) 500, &tsk_AR[1] );

    svc_mtx_GiveMtx( (MtxNr) 0x1u, &tsk_AR[1] );

    SET_PIN_HIGH( PIN_LED2 );
    svc_tsk_KillTsk( &tsk_AR[1] );
}
void tsk2( void )
{
    SET_PIN_LOW( PIN_LED3 );
    svc_mtx_TakeMtx( (MtxNr) 0x1u, &tsk_AR[2], 100 );


    svc_tmr_SetTimer( (WaitTime) 500, &tsk_AR[2] );
    SET_PIN_HIGH( PIN_LED3 );

    svc_mtx_GiveMtx( (MtxNr) 0x1u, &tsk_AR[2] );

    svc_tsk_KillTsk( &tsk_AR[2] );
}

void actvTsk1( void )
{
    tsk_tskInit( (TskID) 0x1u, &tsk1, &tsk_EndTheTask, MY_STACK_SIZE );
    tsk_ChngePrio(&tsk_AR[0x1u],TSK_PRIO_MED);
    tsk_ActvTsk( &tsk_AR[(TskID) 0x1u] );
    os_SCHEDULE();
}
void actvTsk2( void )
{
    tsk_tskInit( (TskID) 0x2u, &tsk2, &tsk_EndTheTask, MY_STACK_SIZE );
    tsk_ActvTsk( &tsk_AR[(TskID) 0x2u] );
    os_SCHEDULE();
}

void OS_START( void )
{
    sys_SysFkt[0].fktCallType.tmrFktCall.sysFktCall = &actvTsk1;
    sys_SysFkt[1].fktCallType.tmrFktCall.sysFktCall = &actvTsk2;
    tmr_setSysTimer( 0, 1500u, 0x1u );
    //tmr_setSysTimer( 1, 200u, 0x1u );
}
