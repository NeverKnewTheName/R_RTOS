/**
 * \file    R_RTOS_monitor.c
 * \author  Christian Neuberger (NeubergerCh50344@th-nuernberg.de)
 * \date    21.02.2016
 *
 *  \addtogroup mntr
 *
 *  \{
 *
 */

#include "R_RTOS_monitor.h"
#include "R_RTOS_memMngr.h"
#include "R_RTOS_task.h"

extern TskTCB tsk_AR[NR_OF_TSKS];

/**
 * \var memPoolID_MNTR
 * \brief Memory pool ID for Monitors
 *
 * \ref SyncEle for blocked tasks are allocated from this memory pool
 */
static MemPoolID memPoolID_MNTR;

/**
 * \var ar_Mntr
 * \brief Array that holds all available Monitors
 */
static Mntr ar_Mntr[NR_OF_MNTRS ];

/**
 * \fn static RetCode mntr_appendToWaitrList( PMntr const mntr, PTskTCB const waitrTsk )
 * \brief Append the specified Task to the specified Monitor's wait queue
 *
 * \param [in] mntr Monitor the function is called for
 * \param [in] waitrTsk Task that shall be appended to the monitor's wait queue
 * \return RetCode
 * \returns RET_OK
 * \returns RET_NOK
 */
static RetCode mntr_appendToWaitrList(
                                       PMntr const mntr,
                                       PTskTCB const waitrTsk )
{
    if ( mntr->mntrWaitrsQTskIDEnd == TSK_ID_NO_TSK )
    {
        // new list end and list start
        waitrTsk->prvTsk = TSK_ID_NO_TSK;
        waitrTsk->nxtTsk = TSK_ID_NO_TSK;
        mntr->mntrWaitrsQTskIDStrt = waitrTsk->tskID;
        mntr->mntrWaitrsQTskIDEnd = waitrTsk->tskID;
    }
    else
    {
        // assign the new list end
        waitrTsk->nxtTsk = mntr->mntrWaitrsQTskIDEnd;
        tsk_AR[mntr->mntrWaitrsQTskIDEnd].prvTsk = waitrTsk->tskID;
        mntr->mntrWaitrsQTskIDEnd = waitrTsk->tskID;
        if ( mntr->mntrWaitrsQTskIDStrt == TSK_ID_NO_TSK )
        {
            // if there is no start to the list, the current task is the end as well as the start
            mntr->mntrWaitrsQTskIDStrt = waitrTsk->tskID;
        }
    }
    return RET_OK;
}


/**
 * \fn static RetCode mntr_getNextWaitr( PMntr const mntr )
 * \brief Examine the specified Monitor's wait queue and release the entities accordingly
 *
 * \param[in] mntr Monitors whose wait queue is examined
 * \return RetCode
 * \returns RET_OK
 * \returns RET_NOK
 */
static RetCode mntr_getNextWaitr( PMntr const mntr )
{
    if ( mntr->refCntr )    // Reference counter should be zero!
        return RET_NOK;

    mntr->curState = MNTR_FREE_NOOP;
    if ( mntr->mntrWaitrsQTskIDEnd == TSK_ID_NO_TSK )
    {
        // there is no queue, thus the monitor is free
        return RET_NOK;
    }

    while ( mntr->mntrWaitrsQTskIDStrt != TSK_ID_NO_TSK )
    {
        PTskTCB tsk = &tsk_AR[mntr->mntrWaitrsQTskIDStrt];
        ACCSSType accssType = tsk->tskSync->SyncEleHandle.MntrSyncEle.mntrAccssType;

        if ( accssType == MNTR_ACCESS_WRITE )
        {
            /* if there is a waiter with write request
             * evaluate whether there have already been released waiter with read requests
             */
            if ( mntr->curState == MNTR_FREE_READ )
            {
                // current monitor state is read, abort release of write waiter -> write pending
                mntr->curState = MNTR_PENDING_WRITE;
                break;
            }
        }
        mntr->mntrWaitrsQTskIDStrt = tsk->prvTsk;    // advance in list
        tsk_ClrEvt( tsk, tsk->tskSync );
        memMngr_MemPoolFree( tsk->tskSync, memPoolID_MNTR );
        tsk->tskSync = (PSyncEle)NULL;
        mntr->refCntr++;
        if ( accssType == MNTR_ACCESS_WRITE )
        {
            mntr->curState = MNTR_LOCK_WRITE;
            break;
        }
        mntr->curState = MNTR_FREE_READ;
    }
    if(mntr->mntrWaitrsQTskIDStrt == TSK_ID_NO_TSK)
        mntr->mntrWaitrsQTskIDEnd = TSK_ID_NO_TSK;

    return RET_OK;
}

RetCode mntr_INIT( void )
{
    uint8_t mntrCntr = NR_OF_MNTRS;
    while(mntrCntr--)
    {
        mntr_InitMntr(mntrCntr, NULL);
    }
    return memMngr_CreateMemPool(
            sizeof(SyncEle), MEM_OBJECTS_MNTR, &memPoolID_MNTR );
}

RetCode mntr_InitMntr( const MntrNr mntrNr, const Data const data /* = NULL */)
/*
 * To simply initialize without setting data, pass NULL as data.
 */
{
    PMntr mntr = &ar_Mntr[mntrNr];
    mntr->protectedData = data;
    mntr->curState = MNTR_FREE_NOOP;
    mntr->refCntr = (mntrRfrcCnt) 0x0u;
    mntr->mntrWaitrsQTskIDStrt = TSK_ID_NO_TSK;
    mntr->mntrWaitrsQTskIDEnd = TSK_ID_NO_TSK;
    return RET_OK;
}

RetCode mntr_DelMntr( const MntrNr mntrNr )
{
    // mntrHndl->curState = MNTR_FREE_DEL;
}

RetCode mntr_DestrMntr( const MntrNr mntrNr )
{
    PMntr mntr = &ar_Mntr[mntrNr];
//ToDO
//    MemPoolID memPoolID = ( *usrMntrHndl )->memPoolID;
//    while ( (uint32_t) ( ( *usrMntrHndl )->mntrWaitrsQEnd ) != (uint32_t) NULL )
//    {
//        PMntrWaitr temp = ( *usrMntrHndl )->mntrWaitrsQEnd;
//        ( *usrMntrHndl )->mntrWaitrsQEnd =
//                (PMntrWaitr) ( (uint32_t) ( *usrMntrHndl )->mntrWaitrsQEnd->ptrXOR
//                        ^ (uint32_t) ( *usrMntrHndl )->mntrWaitrsQEnd );
//        memMngr_MemPoolFree( temp, memPoolID );
//    }
    return RET_OK;
}

RetCode mntr_ReqstReadAccssMntr( const MntrNr mntrNr, PTskTCB const tsk )
{
    PMntr mntr = &ar_Mntr[mntrNr];
    /*
     * if monitor is currently free, grant read access
     * if monitor is currently being read, grant another read access
     * if monitor is currently being written, deny read access -> queue into wait list
     *
     * monitor is blocking
     */
    if ( mntr->curState == MNTR_LOCK_ERROR )
    {
        // MNTR IS IN ERROR STATE
        return RET_NOK;
    }
    else if ( mntr->curState & MNTR_FREE )    // currently either free or read access
    {
        // Read access possible -> increment reference counter
        mntr->curState = MNTR_FREE_READ;
        ++( mntr->refCntr );
        return RET_OK;
    }
    else if ( mntr->curState & MNTR_WRITE )    // currently either write or pending write lock
    {
        /* Either Write is currently active or a write operation is pending,
         * thus put requesting task into the queue
         */
        PSyncEle mntrWaitrRead;    // = (PMntrWaitr) malloc( sizeof(MntrWaitr) );
        memMngr_MemPoolMalloc( &mntrWaitrRead, memPoolID_MNTR );
        if ( (uint32_t) mntrWaitrRead != (uint32_t) NULL )
        {
            mntrWaitrRead->syncEleType = SyncEle_TYPE_MNTR;
            mntrWaitrRead->syncEleID = mntrNr;
            mntrWaitrRead->SyncEleHandle.MntrSyncEle.mntrAccssType =
                    MNTR_ACCESS_READ;

            tsk->tskSync = mntrWaitrRead;
            // append to the end of the monitor's waiter list

            if ( tsk_SetInactive( tsk, TSK_STATE_WAITING_MNTR ) == RET_OK )
            {
                return mntr_appendToWaitrList( mntr, tsk );
            }
        }
        memMngr_MemPoolFree( mntrWaitrRead, memPoolID_MNTR );
        return RET_NOK;
    }
    else
    {
        // SOME UNEXPECTED ERROR?!?!
        return RET_NOK;
    }
}

RetCode mntr_ReqstWriteAccssMntr( const MntrNr mntrNr, PTskTCB const tsk )
{
    PMntr mntr = &ar_Mntr[mntrNr];
    /*
     * if monitor is currently free, grant write access
     * else if monitor is currently either being written or read, deny write access
     * -> set write pending
     *
     * monitor is blocking
     */
    if ( mntr->curState == MNTR_LOCK_ERROR )
    {
        // MNTR IS IN ERROR STATE
        return RET_NOK;
    }
    else if ( mntr->curState == MNTR_FREE_NOOP )    // currently free
    {
        // Write access possible -> increment reference counter
        if ( !( mntr->refCntr ) )
            return RET_NOK;    // REFERENCES DETECTED... MNTR SHOULD BE FREE THOUGH!

        ++( mntr->refCntr );
        mntr->curState = MNTR_LOCK_WRITE;
        return RET_OK;
    }
    else    // no error, but not free... queue into waitrList
    {
        /* Either Write is currently active, a write operation is pending or,
         * thus put requesting task into the queue
         */
        PSyncEle mntrWaitrWrite;    // = (MntrWaitr *) malloc( sizeof(MntrWaitr) );
        memMngr_MemPoolMalloc( &mntrWaitrWrite, memPoolID_MNTR );
        if ( (uint32_t) mntrWaitrWrite != (uint32_t) NULL )
        {
            mntrWaitrWrite->syncEleType = SyncEle_TYPE_MNTR;
            mntrWaitrWrite->syncEleID = mntrNr;
            mntrWaitrWrite->SyncEleHandle.MntrSyncEle.mntrAccssType =
                    MNTR_ACCESS_WRITE;
            tsk->tskSync = mntrWaitrWrite;
            // append to the end of the monitor's waiter list

            if ( tsk_SetInactive( tsk, TSK_STATE_WAITING_MNTR ) == RET_OK )
            {
                mntr->curState = MNTR_PENDING_WRITE;
                return mntr_appendToWaitrList( mntr, tsk );
            }
        }
        memMngr_MemPoolFree( mntrWaitrWrite, memPoolID_MNTR );
        return RET_NOK;
    }
}

RetCode mntr_ReleaseAccssMntr( const MntrNr mntrNr )
{
    PMntr mntr = &ar_Mntr[mntrNr];
    if ( mntr->curState == MNTR_LOCK_ERROR )
    {
        return RET_NOK;    // MNTR IS IN ERROR STATE
    }
    else
    {
        if ( mntr->refCntr )
        {
            // decrement reference counter
            if ( --( mntr->refCntr ) == (mntrRfrcCnt) 0x0u )
            {
                // no more references -> grant access to entities in wait queue if any
                return mntr_getNextWaitr( mntr );
            }
        }
        //else // No references -> ERROR --- cannot release if no reference given!
    }
    // FAILURE
    return RET_NOK;
}

/**
 * \}
 */
