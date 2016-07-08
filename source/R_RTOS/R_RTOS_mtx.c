/**
 *  \file    R_RTOS_mtx.c
 *  \author  Christian Neuberger (NeubergerCh50344@th-nuernberg.de)
 *  \date    14.05.2016
 *
 *
 *  \addtogroup mtx
 *  \{
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
        while ( curTsk->tskPrio.visibleTskPrio >= pTskToIns->tskPrio.visibleTskPrio )
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
        pMtx->svdTskPrio = nxtTsk->tskPrio.visibleTskPrio;
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
        if ( occTsk->tskPrio.visibleTskPrio < tsk->tskPrio.visibleTskPrio )
        {
            // INHERIT MAXIMUM PRIORITY OF ALL INCOMING TASKS
            tsk_ChngePrio( occTsk, tsk->tskPrio.visibleTskPrio );
        }
        return mtx_InsertTskMtxQ( pMtx, tsk );    // insert task into the mutex's wait queue
    }
    else
    {
        pMtx->mtxOccTskID = tsk->tskID; // current task is now the occupying task
        pMtx->svdTskPrio = tsk->tskPrio.visibleTskPrio; // save the task priority for the priority inversion protocol
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

    if ( tsk->tskPrio.visibleTskPrio != pMtx->svdTskPrio )
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
/**
 * \}
 */
