/**
 * \file    R_RTOS_sem.c
 * \author  Christian Neuberger (NeubergerCh50344@th-nuernberg.de)
 * \date    15.12.2015
 *
 * \brief Functions for creating, initializing, maintaining and handling a task timers.
 */

#include "R_RTOS_sem.h"
#include "R_RTOS_task.h"

#include "R_RTOS_memMngr.h"


extern TskTCB* pIDLETsk;
extern void os_SCHEDULE( void );
extern TskTCB tsk_AR[NR_OF_TSKS];

/** \var ar_Sems
 *  \brief Contains all semaphores.
 */
static Sem ar_Sems[AMOUNT_OF_SEMS ];

static MemPoolID memPoolID_SEM;

RetCode sem_InitSems( void )
{
    uint8_t i = (uint8_t) 0x0u;
    for ( ; i < AMOUNT_OF_SEMS ; ++i )
    {
        ar_Sems[i].semOccTskID = TSK_ID_NO_TSK;
        ar_Sems[i].semQTskID = TSK_ID_NO_TSK;
        ar_Sems[i].svdPrio = TSK_PRIO_ERROR;
        ar_Sems[i].takenCntr = (SemCntr) 0x0u;
    }
    memMngr_CreateMemPool( sizeof(SyncEle), MEM_OBJECTS_SEM, &memPoolID_SEM );
    return RET_OK;
}

static RetCode sem_InsertTskSemQ( PSem pSem, PTskTCB pTskToIns )
{

    if ( ( (uint32_t) pSem == (uint32_t) NULL ) || ( (uint32_t) pTskToIns
            == (uint32_t) NULL ) )
        return RET_NOK;

    if ( pSem->semQTskID == TSK_ID_NO_TSK )
    {
        // NO QUEUE YET => START A QUEUE

        pSem->semQTskID = pTskToIns->tskID;
        // given task is the start and end of the new queue
        pTskToIns->nxtTsk = TSK_ID_NO_TSK;
        pTskToIns->prvTsk = TSK_ID_NO_TSK;
    }
    else
    {
        // THERE IS A QUEUE => INSERT ACCORDING TO PRIORITY

        PTskTCB curTsk = &tsk_AR[pSem->semQTskID];
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

static RetCode sem_GetNextTskSemQ( PSem pSem )
{
    if ( (uint32_t) pSem == (uint32_t) NULL )
    {
        // NO START NODE
        return RET_NOK;
    }

    pSem->semOccTskID = pSem->semQTskID;

    if ( pSem->semQTskID != TSK_ID_NO_TSK )
    {
        PTskTCB nxtTsk = &tsk_AR[pSem->semQTskID];
        pSem->semQTskID = nxtTsk->nxtTsk;
        pSem->svdPrio = nxtTsk->tskPrio;
        tsk_ClrEvt( nxtTsk, nxtTsk->tskSync );
        memMngr_MemPoolFree( nxtTsk->tskSync, memPoolID_SEM );    // FREE CURRENT TskSyncEle
        nxtTsk->tskSync = (PSyncEle)NULL;
    }

    --( pSem->takenCntr );

    return RET_OK;
}


RetCode sem_TakeSem(
                    PTskTCB const tsk,
                     const SemNr semNr,
                     const SysTicks maxSysTicksToWait )
{
    if ( semNr >= AMOUNT_OF_SEMS )
        return RET_NOK;

    PSem sem = &ar_Sems[semNr];

    if ( sem->takenCntr != (uint8_t) 0x0u )
    {
        // CHECK IF THE SPECIFIED TASK IS NOT ALREADY WAITING FOR THIS SEMAPHORE
        if ( (uint32_t) tsk->tskSync != (uint32_t) NULL )
            return RET_NOK;

        // MAKE SURE THE TASK DOES NOT ALREADY OCCUPY THIS SEMAPHORE
        if ( sem->semOccTskID == tsk->tskID )
        {
            return RET_NOK;
        }

        // SEMAPHORE ALREADY TAKEN -> QUEUE INTO WAIT LIST

        PSyncEle semSync;
        memMngr_MemPoolMalloc( &semSync, memPoolID_SEM );
        if ( (uint32_t) semSync == (uint32_t) NULL )
        {
            tsk->tskState = TSK_STATE_ERROR;
            return RET_NOK;
        }
        //ToDO
        //semSync->maxBlckTime = maxSysTicksToWait;
        semSync->syncEleID = semNr;
        semSync->syncEleType = SyncEle_TYPE_SEM;
        //semSync->SyncEleHandle.SemSyncEle.dummy1
        tsk->tskSync = semSync;
        tsk_SetEvt( tsk, semSync );

        PTskTCB occTsk = &( tsk_AR[sem->semOccTskID] );
        if ( occTsk->tskPrio < tsk->tskPrio )
        {
            // INHERIT MAXIMUM PRIORITY OF ALL INCOMING TASKS
            tsk_ChngePrio( occTsk, tsk->tskPrio );
        }
        return sem_InsertTskSemQ( sem, tsk );    // insert the new semaphore according to its task's priority
    }
    else
    {
        ++( sem->takenCntr );
        sem->semOccTskID = tsk->tskID;
        sem->svdPrio = tsk->tskPrio;
        sem->semQTskID = TSK_ID_NO_TSK;
        return RET_OK;
    }
}

RetCode sem_GiveSem( PTskTCB const tsk, const SemNr semNr )
{
    if ( semNr >= AMOUNT_OF_SEMS )
        return RET_NOK;

    PSem sem = &( ar_Sems[semNr] );

    if ( sem->takenCntr == (uint8_t) 0x0u )    // SEMAPHORE IS NOT TAKEN
        return RET_NOK;

    if ( sem->semOccTskID == TSK_ID_NO_TSK )    // THERE SHOULD BE A STRT OF LIST IF THE SEMAPHORE WAS TAKEN
        return RET_NOK;

    if ( sem->semOccTskID != tsk->tskID )    // is this task really the one currently occupying the semaphore?
        return RET_NOK;

    if ( tsk->tskPrio != sem->svdPrio )
    {
        tsk_ChngePrio( tsk, sem->svdPrio );
    }

    return sem_GetNextTskSemQ( sem );
}

RetCode sem_GiveUpOnSem( PTskTCB const tsk )
{
    PSem sem;
    uint8_t semArCnt = (uint8_t) 0x0u;

    for ( ; semArCnt < AMOUNT_OF_SEMS ; semArCnt++ )
    {
        sem = &ar_Sems[semArCnt];
        // If the semaphore is taken and the given task is the start of the list, release the semaphore
        if ( sem->takenCntr )    //ToDo is this really needed? semOccTskID should be TSK_ID_NO_TSk if the semaphore is not taken
        {
            if ( sem->semOccTskID == tsk->tskID )
            {
                // Get the next task from the semaphore queue -> will be stored as the new start of the list
                sem_GetNextTskSemQ( sem );    //ToDo RetCode??
            }
        }
    }
    return RET_OK;
}


// WARNING! MAKE SURE THAT THE TASK !IS! IN THE SEMAPHORE WAITING TASK QUEUE!!!
RetCode sem_DeleteTskSemQ( PTskTCB const tsk )
{
    if ( ( (uint32_t) tsk->tskSync == (uint32_t) NULL ) || ( tsk->tskSync->syncEleType
            != SyncEle_TYPE_SEM ) )
        return RET_NOK;    // WTF?

    PSem sem = &ar_Sems[tsk->tskSync->syncEleID];

    if ( sem->semQTskID == tsk->tskID )
    {
        sem->semQTskID = tsk->nxtTsk;
        if ( tsk->nxtTsk != TSK_ID_NO_TSK )
        {
            tsk_AR[tsk->nxtTsk].prvTsk = TSK_ID_NO_TSK;
        }
    }
    else
    {
        if ( tsk->nxtTsk != TSK_ID_NO_TSK )
        {
            tsk_AR[tsk->nxtTsk].prvTsk = tsk->prvTsk;
        }
        if ( tsk->prvTsk != TSK_ID_NO_TSK )
        {
            tsk_AR[tsk->prvTsk].nxtTsk = tsk->nxtTsk;
        }
    }

    memMngr_MemPoolFree( tsk->tskSync, memPoolID_SEM );    // FREE CURRENT NODE

    return RET_OK;
}
