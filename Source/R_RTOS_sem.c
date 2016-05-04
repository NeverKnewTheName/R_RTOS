/**
 *  \file    R_RTOS_sem.c
 *  \author  Christian Neuberger (NeubergerCh50344@th-nuernberg.de)
 *  \date    15.12.2015
 *
 *  \brief Functions for creating, initializing, maintaining Semaphores.
 *
 *  
 *  <h2>Priority Inheritance</h2>
 *  When access to a specific resource is requested, but cannot be granted, the requesting consumer is put into a wait queue.
 *  These wait queues are sorted according to the priority of their entities. Therefore a waiting high priority task will be granted
 *  access to the resource before a waiting low priority task receives the resource. But if the resouce is taken by a lower priority
 *  task and a high priority task requests access, the resource remains at the lower priority task. Therefore the high priority task
 *  is put into a waiting queue and its execution is suspended. If the lower priority task occupying the resource is suspended, because
 *  e.g. a medium priority task is activated, this medium priority task would receive processor time before the high priority task, that
 *  is currently waiting on the resource. This is called <i>Priority Inversion</i>.</br>
 *  To avoid that a lower priority task is executed before a high priority task <i>Priority Inheritance</i> is introduced. If a lower priority
 *  prority task is occupying a resouce while a high priority task requests access to said resource the lower priority task inherits the priority
 *  of the high priority task for the duration of the access to the protected resource. Hence a medium priority task cannot preempt the actually
 *  lower priority task while it is occupying the resource and the high priority task is waiting for this resouce.
 *
 *
 *  <h2>Semaphores</h2>
 *  Semaphores are a signaling mechanism to allow multiple access to a protected resource.
 *  A consumer does not get ownership of the semaphore. If a consumer is granted access the semaphore counter is decremented.
 *  When the consumer is done with accessing the protected resource the semaphore is then incremented again.
 *  As soon as the counter reaches 0 no more accesses to the protected resource will be granted. All incoming consumers
 *  are put into a wait queue and must wait for the counter to increment again and therefore for another consumer, who
 *  was previously granted access to the resource, to release the resource and hence increment the semaphore counter.
 * 
 *  <h3>Counting Semaphores</h3>
 *  Counting semaphores contain a counter which can be set to a specific value are incremented variably and decremented by one.
 *  This is used to limit access to a resource to the counter value.
 *
 *  <h3>Binary Semaphores</h3>
 *  Contrary to counting semaphores, binary semaphores can only take the values 0 or 1 (taken or free). Much like mutexes they can be used
 *  for mutual exclusion, but unlike mutexes the consumer, which is granted access, does not receive the ownership of the semaphore.
 *
 *
 *  <h2>Mutexes</h2>
 *  Mutexes are a synchronization mechanism for mutual exclusion. As soon as a consumer accesses the mutex and therefore the 
 *  protected data, it is granted ownership of the mutex, if the mutex is still available. In case of the mutex being already
 *  owned by another consumer, the current consumer is denied access and put into a wait queue until the currently owning consumer
 *  gives the mutex back to the system. The next consumer in the waiting queue is now granted access and therefore it receives 
 *  ownership of the mutex.
 *
 *
 */

#include "R_RTOS_sem.h"
#include "R_RTOS_task.h"

#include "R_RTOS_memMngr.h"

//extern void os_SCHEDULE( void );
extern TskTCB tsk_AR[NR_OF_TSKS];

/** \var ar_Sems
 *  \brief Contains all semaphores.
 */
static Sem ar_Sems[AMOUNT_OF_SEMS ];

/** \var memPoolID_SEM
 *  \brief ID of the memory pool memory allocation request of semaphores are served from.
 */
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

//ToDO
RetCode mtx_InitMutexs( void )
{
    uint8_t i = (uint8_t) 0x0u;
    for( ; i < AMOUNT_OF_MTXS ; ++i )
    {
        //ar_Mutxs[i].SomeThing = SomeThing;
    }
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
