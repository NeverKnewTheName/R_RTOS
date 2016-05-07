#include "PortFunc.h"
#include "TimerFunc.h"

#include "R_RTOS_services.h"

#include "R_RTOS_task.h"
#include "R_RTOS_timer.h"
#include "R_RTOS_msgQueuing.h"

extern void tsk_EndTheTask( void );

extern TskTCB tsk_AR[];
extern SysFkt sys_SysFkt[];
extern PTskTCB p_cur_tsk_tcb;

void tsk1( void );
void tsk2( void );
void tsk3( void );
void tsk4( void );

void tsk1( void )
{
    /*
     * Producer Task
     */
    uint32_t dataToPub = 0x0u;
    svc_msgq_RegPub( p_cur_tsk_tcb, (const QID) 0x1u );
    while ( 1 )
    {
        svc_msgq_PubMsg(
                (const QID) 0x1u, (const DataSize) 0x4u, DataT_Int,
                (CData) dataToPub );
        ++dataToPub;
        svc_tmr_SetTimer( 100, p_cur_tsk_tcb );
    }

    svc_tsk_KillTsk( p_cur_tsk_tcb );
}
void tsk2( void )
{
    /*
     * Producer Task
     */
    uint32_t dataToPub = 0xFFFFFFFFu;
    svc_msgq_RegPub( p_cur_tsk_tcb, (const QID) 0x1u );
    while ( 1 )
    {
        svc_msgq_PubMsg(
                (const QID) 0x1u, (const DataSize) 0x4u, DataT_Int,
                (const Data) dataToPub );
        --dataToPub;
        svc_tmr_SetTimer( 100, p_cur_tsk_tcb );
    }
    svc_tsk_KillTsk( p_cur_tsk_tcb );
}
void tsk3( void )
{
    /*
     * Consumer Task
     */
    const PMQData dataBuffer = (const PMQData) NULL;
    uint32_t retrievedData;
    svc_msgq_RegTskSub( p_cur_tsk_tcb, (const QID) 0x1u );
    while ( 1 )
    {
        svc_msgq_MsgRead(
                (const QID) 0x1u, (const TskID) p_cur_tsk_tcb->tskID,
                (const PMQData *) &dataBuffer );
        if ( (uint32_t) dataBuffer != (uint32_t) NULL )
        {
            retrievedData = dataBuffer->data;
            retrievedData &= 0x3u;
            switch ( retrievedData )
            {
                case 0:
                    TOGGLE_PIN( PIN_LED0 );
                    break;
                case 1:
                    TOGGLE_PIN( PIN_LED1 );
                    break;
                case 2:
                    TOGGLE_PIN( PIN_LED2 );
                    break;
                case 3:
                    TOGGLE_PIN( PIN_LED3 );
                    break;
            }
        }
        svc_msgq_MsgRead(
                (const QID) 0x1u, (const TskID) p_cur_tsk_tcb->tskID,
                (const PMQData *) &dataBuffer );
        if ( (uint32_t) dataBuffer != (uint32_t) NULL )
        {
            retrievedData = dataBuffer->data;
            retrievedData &= 0x3u;
            switch ( retrievedData )
            {
                case 0:
                    TOGGLE_PIN( PIN_LED0 );
                    break;
                case 1:
                    TOGGLE_PIN( PIN_LED1 );
                    break;
                case 2:
                    TOGGLE_PIN( PIN_LED2 );
                    break;
                case 3:
                    TOGGLE_PIN( PIN_LED3 );
                    break;
            }
        }
        svc_tmr_SetTimer( 100, p_cur_tsk_tcb );
    }
    svc_tsk_KillTsk( p_cur_tsk_tcb );
}
void tsk4( void )
{
    /*
     * Consumer Task
     */
    const PMQData dataBuffer = (const PMQData) NULL;
    ;
    uint32_t retrievedData;
    svc_msgq_RegTskSub( p_cur_tsk_tcb, (const QID) 0x1u );
    while ( 1 )
    {
        svc_msgq_MsgRead(
                (const QID) 0x1u, (const TskID) p_cur_tsk_tcb->tskID,
                (const PMQData *) &dataBuffer );
        if ( (uint32_t) dataBuffer != (uint32_t) NULL )
        {
            retrievedData = dataBuffer->data;
//            TOGGLE_PIN( PIN_LED0 );
        }
        svc_tmr_SetTimer( 100, p_cur_tsk_tcb );
    }
    svc_tsk_KillTsk( p_cur_tsk_tcb );
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
    msgQ_initQueue( (QID) 0x1u );
    sys_SysFkt[0].fktCallType.tmrFktCall.sysFktCall = &actvTsk1;
    sys_SysFkt[1].fktCallType.tmrFktCall.sysFktCall = &actvTsk2;
    sys_SysFkt[2].fktCallType.tmrFktCall.sysFktCall = &actvTsk3;
    sys_SysFkt[3].fktCallType.tmrFktCall.sysFktCall = &actvTsk4;
    tmr_setSysTimer( 0, 160u, 0x0u );
    tmr_setSysTimer( 1, 140u, 0x0u );
    tmr_setSysTimer( 2, 120u, 0x0u );
    tmr_setSysTimer( 3, 100u, 0x0u );
}
