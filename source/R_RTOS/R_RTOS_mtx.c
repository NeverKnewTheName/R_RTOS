/**
 *  \file    R_RTOS_mtx.c
 *  \author  Christian Neuberger (NeubergerCh50344@th-nuernberg.de)
 *  \date    14.05.2016
 *
 *  \brief Functions for creating, initializing, maintaining Mutexes.
 *
 *
 *  <h2>Priority Inheritance</h2>
 *  When access to a specific resource is requested, but cannot be granted, the requesting consumer is put into a wait queue.
 *  These wait queues are sorted according to the priority of their entities. Therefore a waiting high priority task will be granted
 *  access to the resource before a waiting low priority task receives the resource. But if the resource is taken by a lower priority
 *  task and a high priority task requests access, the resource remains at the lower priority task. Therefore the high priority task
 *  is put into a waiting queue and its execution is suspended. If the lower priority task occupying the resource is suspended, because
 *  e.g. a medium priority task is activated, this medium priority task would receive processor time before the high priority task, that
 *  is currently waiting on the resource. This is called <i>Priority Inversion</i>.<br>
 *  To avoid that a lower priority task is executed before a high priority task <i>Priority Inheritance</i> is introduced. If a lower priority
 *  priority task is occupying a resource while a high priority task requests access to said resource the lower priority task inherits the priority
 *  of the high priority task for the duration of the access to the protected resource. Hence a medium priority task cannot preempt the actually
 *  lower priority task while it is occupying the resource and the high priority task is waiting for this resource.
 *
 *  <h2>Mutexes</h2>
 *  Mutexes are a synchronization mechanism for mutual exclusion. As soon as a consumer accesses the mutex and therefore the
 *  protected data, it is granted ownership of the mutex, if the mutex is still available. In case of the mutex being already
 *  owned by another consumer, the current consumer is denied access and put into a wait queue until the currently owning consumer
 *  gives the mutex back to the system. The next consumer in the waiting queue is now granted access and therefore it receives
 *  ownership of the mutex.
 *
 *
 *  <h2>Difference Mutex and Binary Semaphore</h2>
 *  Since a Binary Semaphore only depends on signaling, it can be signaled from anywhere, whereas a mutex can only be released by the task that occupies it.
 */

#include "R_RTOS_mtx.h"
#include "R_RTOS_task.h"

#include "R_RTOS_memMngr.h"

extern TskTCB tsk_AR[NR_OF_TSKS];

/** \var ar_Mtxs
 *  \brief Contains all mutexes.
 */
static Mtx ar_Mtxs[AMOUNT_OF_MTXS ];

/** \var memPoolID_MTX
 *  \brief ID of the memory pool memory allocation request of mutexes are served from.
 */
static MemPoolID memPoolID_MTX;

static RetCode mtx_InsertTskMtxQ( PMtx pMtx, PTskTCB pTskToIns )
{
    //DEBUG
    if ( ( (uint32_t) pMtx == ( uint32_t ) NULL ) || ( (uint32_t) pTskToIns
            == ( uint32_t ) NULL ) )
        return RET_NOK;
    //\DEBUG

    if ( pMtx->mtxQStrtTskID == TSK_ID_NO_TSK )
    {
        // NO QUEUE YET => START A QUEUE

        pMtx->mtxQStrtTskID = pTskToIns->tskID;
        // given task is the start and end of the new queue
        pTskToIns->nxtTsk = TSK_ID_NO_TSK;
        pTskToIns->prvTsk = TSK_ID_NO_TSK;
    }
    else
    {
        // THERE IS A QUEUE => INSERT ACCORDING TO PRIORITY
        PTskTCB curTsk = &tsk_AR[pMtx->mtxQStrtTskID];
        while ( curTsk->tskPrio >= pTskToIns->tskPrio )
        {
            if ( curTsk->nxtTsk == TSK_ID_NO_TSK )
            {
                break;
            }
            curTsk = &tsk_AR[curTsk->nxtTsk];    // advance in the list
        }
        pTskToIns->prvTsk = curTsk->tskID;    // previous task to new task is the current task
        pTskToIns->nxtTsk = curTsk->nxtTsk;    // next task to the new task is the former next task to the current task
        curTsk->nxtTsk = pTskToIns->tskID;    // new task is now the next task to the current task
    }

    return RET_OK;
}

static RetCode mtx_GetNextTskMtxQ( PMtx pMtx )
{
    //DEBUG
    if ( (uint32_t) pMtx == ( uint32_t ) NULL )
    {
        // NO START NODE
        return RET_NOK;
    }
    //\DEBUG

    pMtx->mtxOccTskID = pMtx->mtxQStrtTskID;

    if ( pMtx->mtxQStrtTskID != TSK_ID_NO_TSK )
    {
        PTskTCB nxtTsk = &tsk_AR[pMtx->mtxQStrtTskID];
        pMtx->mtxQStrtTskID = nxtTsk->nxtTsk;
        pMtx->svdTskPrio = nxtTsk->tskPrio;
        tsk_ClrEvt( nxtTsk, nxtTsk->tskSync );
        memMngr_MemPoolFree( nxtTsk->tskSync, memPoolID_MTX );    // FREE CURRENT TskSyncEle
        nxtTsk->tskSync = (PSyncEle) NULL;
    }

    return RET_OK;
}

RetCode mtx_InitMtxs( void )
{
    uint8_t i = (uint8_t) 0x0u;
    for ( ; i < AMOUNT_OF_MTXS ; ++i )
    {
        ar_Mtxs[i].mtxOccTskID = TSK_ID_NO_TSK;
        ar_Mtxs[i].mtxQStrtTskID = TSK_ID_NO_TSK;
        ar_Mtxs[i].svdTskPrio = TSK_PRIO_ERROR;
    }
    memMngr_CreateMemPool( sizeof(SyncEle), MEM_OBJECTS_MTX, &memPoolID_MTX );
    return RET_OK;
}

RetCode mtx_TakeMtx(
                     PTskTCB const tsk,
                     const MtxNr mtxNr,
                     const SysTicks maxSysTicksToWait )
{
    //DEBUG
    if ( mtxNr >= AMOUNT_OF_MTXS )
        return RET_NOK;
    //\DEBUG

    PMtx pMtx = &ar_Mtxs[mtxNr];

    // The mutex is free, when there is no occupying task
    if ( pMtx->mtxOccTskID != TSK_ID_NO_TSK )
    {
        // CHECK IF THE SPECIFIED TASK IS NOT ALREADY WAITING FOR ANY SYNC ELEMENT, WHICH IS AN ERROR!
        //DEBUG
        if ( (uint32_t) tsk->tskSync != ( uint32_t ) NULL )
            return RET_NOK;
        //\DEBUG

        PSyncEle mtxSync;
        memMngr_MemPoolMalloc( &mtxSync, memPoolID_MTX );
        if ( (uint32_t) mtxSync == ( uint32_t ) NULL )
        {
            tsk->tskState = TSK_STATE_ERROR;
            return RET_NOK;
        }
        //ToDO
//        if(maxSysTicksToWait != 0)
//        tsk->sysTckTmr = *newSysTickTimerObject*
//        tsk->sysTckTmr->remSysTicks = maxSysTicksToWait;
        mtxSync->syncEleID = mtxNr;
        mtxSync->syncEleType = SyncEle_TYPE_MTX;
        //semSync->SyncEleHandle.MtxSyncEle.dummy1
        tsk->tskSync = mtxSync;
        tsk_SetEvt( tsk, mtxSync );

        PTskTCB occTsk = &( tsk_AR[pMtx->mtxOccTskID] );
        if ( occTsk->tskPrio < tsk->tskPrio )
        {
            // INHERIT MAXIMUM PRIORITY OF ALL INCOMING TASKS
            tsk_ChngePrio( occTsk, tsk->tskPrio );
        }
        return mtx_InsertTskMtxQ( pMtx, tsk );    // insert task into the mutex's wait queue
    }
    else
    {
        pMtx->mtxOccTskID = tsk->tskID; // current task is now the occupying task
        pMtx->svdTskPrio = tsk->tskPrio; // save the task priority for the priority inversion protocol
        // If the mutex is free, there is also no waiting queue; to make sure, set the Q start to TSK_ID_NO_TSK; COULD BE OPTIMIZED OUT
        pMtx->mtxQStrtTskID = TSK_ID_NO_TSK;
        return RET_OK;
    }
}

RetCode mtx_GiveMtx( PTskTCB const tsk, const MtxNr mtxNr )
{
    //DEBUG
    if ( mtxNr >= AMOUNT_OF_MTXS )
        return RET_NOK;
    //\DEBUG

    PMtx pMtx = &( ar_Mtxs[mtxNr] );

    if ( pMtx->mtxOccTskID != tsk->tskID )    // ONLY THE OCCUPYING TASK CAN GIVE THE MUTEX
        return RET_NOK;

    if ( tsk->tskPrio != pMtx->svdTskPrio )
    {
        tsk_ChngePrio( tsk, pMtx->svdTskPrio );
    }

    return mtx_GetNextTskMtxQ( pMtx );
}

RetCode mtx_GiveUpOnMtx( PTskTCB const tsk )
{
    //ToDO
    PSyncEle pMtxSyncEle = tsk->tskSync;

    //Is task sync element valid?
    if((uint32_t)pMtxSyncEle == (uint32_t)NULL)
        return RET_NOK;

    //Is sync element a  Mutex?
    if(pMtxSyncEle->syncEleType != SyncEle_TYPE_MTX)
        return RET_NOK;

    //Retrieve corresponding mutex...EDIT: why?
    //PMtx pMtx = &(ar_Mtxs[pMtxSyncEle->syncEleID]);

    //delete task from wait queue
    tsk_AR[tsk->prvTsk].nxtTsk = tsk->nxtTsk; // since this task cannot be the start of the list there should definitely be a previous task

    //Is there a next task in the list?
    if(tsk->nxtTsk != TSK_ID_NO_TSK)
        tsk_AR[tsk->nxtTsk].prvTsk = tsk->prvTsk;

    tsk_ClrEvt( tsk, pMtxSyncEle );
    memMngr_MemPoolFree( pMtxSyncEle, memPoolID_MTX );    // FREE CURRENT TskSyncEle

    return RET_OK;
}
