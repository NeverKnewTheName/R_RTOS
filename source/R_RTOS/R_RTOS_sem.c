/**
 *  \file    R_RTOS_sem.c
 *  \author  Christian Neuberger (NeubergerCh50344@th-nuernberg.de)
 *  \date    15.12.2015
 *
 *
 * \addtogroup sem
 * \{
 *
 */

#include "R_RTOS_sem.h"
#include "R_RTOS_task.h"
#include "R_RTOS_BitMagic.h"
#include "R_RTOS_memMngr.h"

extern TskTCB tsk_AR[NR_OF_TSKS];

/** \var ar_Sems
 *  \brief Contains all semaphores.
 */
static Sem ar_Sems[AMOUNT_OF_SEMS ];

/** \var ar_SemsWaitQueue
 *  \brief Contains the \ref TskID of the start of the respective semaphore's wait queue.
 */
static volatile TskID ar_SemsWaitQueue[AMOUNT_OF_SEMS];

/** \var memPoolID_SEM
 *  \brief ID of the memory pool memory allocation request of semaphores are served from.
 */
static volatile MemPoolID memPoolID_SEM;

RetCode sem_InitSems( void )
{
    memMngr_CreateMemPool( sizeof(SyncEle), MEM_OBJECTS_SEM, &memPoolID_SEM );
    return RET_OK;
}

/**
 * \fn static RetCode sem_InsertTskSemQ( PSem const pSem, const SemNr semNr, PTskTCB const pTskToIns )
 * \brief Insert the given Task into the Semaphore's wait queue
 *
 * \param[in] pSem Semaphore to which the wait queue belongs
 * \param[in] semNr Number of the semaphore
 * \param[in] pTskToIns Task to insert into the wait queue
 *
 * \return RetCode
 * \returns RET_OK
 * \returns RET_NOK
 */
static RetCode sem_InsertTskSemQ( PSem const pSem, const SemNr semNr, PTskTCB const pTskToIns )
{
    //DEBUG
    if ( ( (uint32_t) pSem == ( uint32_t ) NULL ) || ( (uint32_t) pTskToIns
            == ( uint32_t ) NULL ) )
        return RET_NOK;
    //\DEBUG

    if ( ar_SemsWaitQueue[semNr] == TSK_ID_NO_TSK )
    {
        // NO QUEUE YET => START A QUEUE

        ar_SemsWaitQueue[semNr] = pTskToIns->tskID;
        // given task is the start and end of the new queue
        pTskToIns->nxtTsk = TSK_ID_NO_TSK;
        pTskToIns->prvTsk = TSK_ID_NO_TSK;
    }
    else
    {
        // THERE IS A QUEUE => INSERT ACCORDING TO ACTUAL PRIORITY
        PTskTCB curTsk = &tsk_AR[ar_SemsWaitQueue[semNr]];
        while ( curTsk->tskPrio.actualTskPrio >= pTskToIns->tskPrio.actualTskPrio )
        {
            if ( curTsk->nxtTsk == TSK_ID_NO_TSK )
            {
                //End of list reached... append task!
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

/**
 * \fn static TskID sem_GetNextTskSemQ( PSem const pSem, const SemNr semNr )
 * \brief Retrieve the next Task from the Semaphore's wait queue
 *
 * \param[in] pSem Semaphore to which the wait queue belongs to
 * \param[in] semNr Number of the Semaphore
 *
 * \return TskID
 */
static TskID sem_GetNextTskSemQ( PSem const pSem, const SemNr semNr )
{
    //DEBUG
    if ( (uint32_t) pSem == ( uint32_t ) NULL )
    {
        // NO START NODE
        return TSK_ID_NO_TSK;
    }
    //\DEBUG

    if ( ar_SemsWaitQueue[semNr] != TSK_ID_NO_TSK ) // If there is a task in the queue -> IF NOT: ERROR!
    {
        PTskTCB const nxtTsk = &tsk_AR[ar_SemsWaitQueue[semNr]];
        ar_SemsWaitQueue[semNr] = nxtTsk->nxtTsk; // advance in list -- end is NULL, therefore no problem here!
        tsk_ClrEvt( nxtTsk, nxtTsk->tskSync );
        memMngr_MemPoolFree( nxtTsk->tskSync, memPoolID_SEM );    // FREE CURRENT TskSyncEle -- return to MemPool
        nxtTsk->tskSync = (PSyncEle) NULL;
        return nxtTsk->tskID;
    }

    return TSK_ID_NO_TSK;
}

RetCode sem_initBinSem( const SemNr semNr )
{
    PSem const sem = &ar_Sems[semNr];

    sem->semSignal.semBinSig = (uint8_t) 1u;
    sem->maxCntrVal = (uint8_t) 1u;
    sem->semType = SemBin;
    ar_SemsWaitQueue[semNr] = TSK_ID_NO_TSK;
    return RET_OK;
}

RetCode sem_initCntSem( const SemNr semNr, const SemCntr ressourceCntr )
{
    PSem const sem = &ar_Sems[semNr];

    sem->semSignal.semCntrSig = ressourceCntr;
    sem->maxCntrVal = ressourceCntr;
    sem->semType = SemCnt;
    ar_SemsWaitQueue[semNr] = TSK_ID_NO_TSK;
    return RET_OK;
}

RetCode sem_wait(
                  const SemNr semNr,
                  PTskTCB const tsk,
                  const SysTicks maxSysTicksToWait )
{
    PSem const sem = &ar_Sems[semNr];
    volatile uint8_t semOcc = 0;
    if ( sem->semType == SemBin )
    {
        if ( sem->semSignal.semBinSig )
        {
            //Semaphore available
            semOcc = 0;
            sem->semSignal.semBinSig = 0;
        }
        else
        {
            //Semaphore occupied
            semOcc = 1;
        }
    }
    else if ( sem->semType == SemCnt )
    {
        if ( sem->semSignal.semCntrSig )
        {
            //Semaphore available
            semOcc = 0;
            sem->semSignal.semCntrSig--;
        }
        else
        {
            //Semaphore occupied
            semOcc = 1;
        }
    }
    else
    {
        return RET_NOK;
    }

    if ( semOcc )
    {
        // Semaphore is currently occupied, thus put task in wait queue
        //DEBUG
        if ( (uint32_t) tsk->tskSync != ( uint32_t ) NULL )
            return RET_NOK;
        //\DEBUG

        PSyncEle semSync;
        memMngr_MemPoolMalloc( &semSync, memPoolID_SEM );
        if ( (uint32_t) semSync == ( uint32_t ) NULL )
        {
            tsk->tskState = TSK_STATE_ERROR;
            return RET_NOK;
        }
        //ToDO
        //        if(maxSysTicksToWait != 0)
        //        tsk->sysTckTmr = *newSysTickTimerObject*
        //        tsk->sysTckTmr->remSysTicks = maxSysTicksToWait;
        semSync->syncEleID = semNr;
        semSync->syncEleType =
                ( sem->semType == SemCnt ) ?
                        SyncEle_TYPE_CntSEM : SyncEle_TYPE_BinSEM;
        tsk->tskSync = semSync;
        tsk_SetEvt( tsk, semSync );

        sem_InsertTskSemQ( sem, semNr, tsk );
    }

    return RET_OK;
}

RetCode sem_signal( const SemNr semNr )
{
    PSem const sem = &ar_Sems[semNr];
    volatile uint8_t semaphoreFree = 0;
    if ( sem->semType == SemBin )
    {
        if ( sem->semSignal.semBinSig == 1 )
        {
            //SEMAPHORE WAS NOT OCCUPIED
            return RET_NOK;
        }
        if ( ar_SemsWaitQueue[semNr] == TSK_ID_NO_TSK )
        {
            sem->semSignal.semBinSig = 1;
            semaphoreFree = 1;
        }
    }
    else if ( sem->semType == SemCnt )
    {
        if ( sem->semSignal.semCntrSig == sem->maxCntrVal )
        {
            return RET_NOK;
        }
        if ( ar_SemsWaitQueue[semNr] != TSK_ID_NO_TSK )
        {
            sem->semSignal.semCntrSig++;
            semaphoreFree = 1;
        }
    }
    else
    {
        return RET_NOK;
    }

    if ( !semaphoreFree )
    {
        // GET NEXT TASK
        const TskID nxtTskID = sem_GetNextTskSemQ( sem, semNr );
        if ( nxtTskID == TSK_ID_NO_TSK )
        {
            return RET_NOK;
        }
    }
    return RET_OK;
}

RetCode sem_GiveUpOnSem( PTskTCB const tsk )
{
    //ToDO

//    PSem sem;
//    uint8_t semArCnt = (uint8_t) 0x0u;
//
//    for ( ; semArCnt < AMOUNT_OF_SEMS ; semArCnt++ )
//    {
//        sem = &ar_Sems[semArCnt];
//        // If the semaphore is taken and the given task is the start of the list, release the semaphore
//        if ( sem->takenCntr )    //ToDo is this really needed? semOccTskID should be TSK_ID_NO_TSk if the semaphore is not taken
//        {
//            if ( sem->semOccTskID == tsk->tskID )
//            {
//                // Get the next task from the semaphore queue -> will be stored as the new start of the list
//                sem_GetNextTskSemQ( sem );    //ToDo RetCode??
//            }
//        }
//    }
    return RET_OK;
}

// WARNING! MAKE SURE THAT THE TASK !IS! IN THE SEMAPHORE WAITING TASK QUEUE!!!
RetCode sem_DeleteTskSemQ( PTskTCB const tsk )
{
    //ToDO !!!
//    if ( ( (uint32_t) tsk->tskSync == ( uint32_t ) NULL ) || ( tsk->tskSync->syncEleType
//            != SyncEle_TYPE_SEM ) )
//        return RET_NOK;    // WTF?
//
//    PSem sem = &ar_Sems[tsk->tskSync->syncEleID];
//
//    if ( sem->semQTskID == tsk->tskID )
//    {
//        sem->semQTskID = tsk->nxtTsk;
//        if ( tsk->nxtTsk != TSK_ID_NO_TSK )
//        {
//            tsk_AR[tsk->nxtTsk].prvTsk = TSK_ID_NO_TSK;
//        }
//    }
//    else
//    {
//        if ( tsk->nxtTsk != TSK_ID_NO_TSK )
//        {
//            tsk_AR[tsk->nxtTsk].prvTsk = tsk->prvTsk;
//        }
//        if ( tsk->prvTsk != TSK_ID_NO_TSK )
//        {
//            tsk_AR[tsk->prvTsk].nxtTsk = tsk->nxtTsk;
//        }
//    }
//
//    memMngr_MemPoolFree( tsk->tskSync, memPoolID_SEM );    // FREE CURRENT NODE

    return RET_OK;
}
/**
 * \}
 */
