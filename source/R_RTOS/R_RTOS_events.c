/**
 * \file    R_RTOS_events.c
 * \author  Christian Neuberger (NeubergerCh50344@th-nuernberg.de)
 * \date    02.02.2016
 *
 * \brief Event services for sending/receiving events in tasks.
 */

#include "R_RTOS_inc.h"
#include "R_RTOS_events.h"
#include "R_RTOS_memMngr.h"
#include "R_RTOS_task.h"
#include "R_RTOS_BitMagic.h"

extern void os_SCHEDULE( void );
extern TskTCB tsk_AR[NR_OF_TSKS];

static Evt gEvts[AMOUNT_OF_EVTS ];

static MemPoolID memPoolID_EVT;

static void BREAK(void)
{
    while(1){;}
}

void evt_INIT( void )
{
    register uint8_t cntr = AMOUNT_OF_EVTS;
    register uint8_t evtQCntr;
    while ( cntr-- )
    {
        gEvts[cntr].evtQ_Slots = (EVTQSlots) 0x0u;
        evtQCntr = EVT_QUEUE_SIZE;
        while ( evtQCntr-- )
        {
            gEvts[cntr].evtObjs[evtQCntr] = TSK_ID_NO_TSK;
        }
    }
    memMngr_CreateMemPool( sizeof(SyncEle), MEM_OBJECTS_EVT, &memPoolID_EVT );
}

RetCode evt_WaitForEvts(
                         PTskTCB const tsk,
                         EVTQSlots evtMask,
                         const SysTicks maxWaitTime )
{
    uint32_t evtNrHelper;
    PSyncEle evtSync;
    PEvt evt;
    memMngr_MemPoolMalloc( &evtSync, memPoolID_EVT );
    if ( (uint32_t) evtSync != (uint32_t) NULL )
    {
        //ToDO
        //evtSync->maxBlckTime = maxWaitTime;
        evtSync->syncEleType = SyncEle_TYPE_EVT;
        evtSync->syncEleID = SyncEle_TYPE_EVT;
        evtSync->SyncEleHandle.EvtSyncEle.evtMsk = evtMask;
        tsk->tskSync = evtSync;

        while ( evtMask )
        {
            // extract rightmost bit indicating lowest event number to wait for
            evtNrHelper = evtMask & ( -evtMask );
            // clear extracted bit in the event mask
            evtMask &= ~evtNrHelper;
            // get event to corresponding event number
            evt = &gEvts[bitM_bitPos( evtNrHelper )];
            // get lowest free event queue slot
            evtNrHelper = ~evt->evtQ_Slots & ( evt->evtQ_Slots + 1u );
            if ( evtNrHelper != 0x0u )
            {
                //ToDO KILL ME
                // THERE ARE NO FREE SLOTS LEFT
                // UNQUEUE THE TASK FROM ALL PREVIOUS EVENTS...
            }
            // mark retrieved slot as taken
            evt->evtQ_Slots |= evtNrHelper;
            // queue task id into event queue
            evt->evtObjs[bitM_bitPos( evtNrHelper )] =
                    tsk->tskID;
        }

        tsk_SetEvt( tsk, evtSync );

        //os_SCHEDULE();
        return RET_OK;
    }
    return RET_NOK;
}

RetCode evt_SendEvt( const EvtNr evtNr )
{
    uint32_t evtNrHelper;
    PEvt evt = &gEvts[evtNr];
    EVTQSlots evtQSlotsHelper = evt->evtQ_Slots;
    PTskTCB tsk;

    while ( evtQSlotsHelper )
    {
        // get lowest taken slot
        evtNrHelper = evtQSlotsHelper & ( -evtQSlotsHelper );
        // set retrieved slot as free
        evtQSlotsHelper &= ~evtNrHelper;
        // queue task id into event queue
        evtNrHelper = bitM_bitPos( evtNrHelper );
        tsk = &tsk_AR[evt->evtObjs[evtNrHelper]];
        evt->evtObjs[evtNrHelper] = TSK_ID_NO_TSK;
        if(tsk->tskID == TSK_ID_IDLE)
        {
            BREAK();
        }

        if ( ( (uint32_t) tsk->tskSync != (uint32_t) NULL ) && !( tsk->tskSync->SyncEleHandle.EvtSyncEle.evtMsk &=
                ~( 0x1u << evtNr ) ) )
        {
            tsk_ClrEvt( tsk, tsk->tskSync );
            memMngr_MemPoolFree( tsk->tskSync, memPoolID_EVT );
            tsk->tskSync = (PSyncEle) NULL;
        }
    }
    evt->evtQ_Slots = evtQSlotsHelper;
    //os_SCHEDULE();
    return RET_OK;
}

RetCode evt_GiveUpOnEvts( PTskTCB const tsk )
{
    EVTQSlots evtHelper = tsk->tskSync->SyncEleHandle.EvtSyncEle.evtMsk;
    EVTQSlots evtQSlotsHelper;
    uint32_t evtNrHelper;
    PEvt evt;

    // Browse events the task is waiting for
    while ( evtHelper )
    {
        // extract rightmost bit indicating lowest event number to wait for
        evtNrHelper = evtHelper & ( -evtHelper );
        // clear extracted bit in the event mask
        evtHelper &= ~evtNrHelper;
        // get event to corresponding event number
        evt = &gEvts[bitM_bitPos( evtNrHelper )];
        // get lowest free event queue slot
        evtQSlotsHelper = evt->evtQ_Slots & ( -evt->evtQ_Slots );
        // browse tasks in the event queue to find the task's position
        while ( evtQSlotsHelper )
        {
            // extract rightmost bit indicating lowest taken slot in the event's queue
            evtNrHelper = evtQSlotsHelper & ( -evtQSlotsHelper );
            if ( tsk->tskID == evt->evtObjs[bitM_bitPos( evtNrHelper )
                    ] )
            {
                evt->evtQ_Slots &= ~evtNrHelper;
                break;
            }
            evtQSlotsHelper &= ~evtNrHelper;
        }
    }
    memMngr_MemPoolFree( tsk->tskSync, memPoolID_EVT );
    tsk->tskSync = (PSyncEle) NULL;
    return RET_OK;
}
