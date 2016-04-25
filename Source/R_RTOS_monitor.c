/*
 * R_RTOS_monitor.c
 *
 *  Created on: 20.02.2016
 *      Author: Christian
 */

 //ToDO !!!
 
#include "R_RTOS_monitor.h"
#include "R_RTOS_memMngr.h"
#include "R_RTOS_task.h"

extern TskTCB tsk_AR[NR_OF_TSKS];

static MemPoolID memPoolID_MNTR;

static RetCode mntr_appendToWaitrList(
                                       PMntr const mntr,
                                       PMntrWaitr const waitr )
{
    //ToDO
//    if ( (uint32_t) mntr->mntrWaitrsQEnd == (uint32_t) NULL )
//    {
//        // new list end and list start
//        waitr->ptrXOR = (PMntrWaitr) NULL;
//        mntr->mntrWaitrsQStrt = waitr;
//        mntr->mntrWaitrsQEnd = waitr;
//    }
//    else
//    {
//        // since the new list end has only a element prior (the current list end) but no element after, the ptrXOR is simply a pointer to said prior element
//        waitr->ptrXOR = mntr->mntrWaitrsQEnd;
//        // Since the ptrXOR of the list end is a pointer to the element prior to the list end, simply XOR ptrXOR with the new list end
//        mntr->mntrWaitrsQEnd->ptrXOR =
//                (PMntrWaitr) ( (uint32_t) mntr->mntrWaitrsQEnd->ptrXOR
//                        ^ (uint32_t) waitr );
//        // assign the new list end
//        mntr->mntrWaitrsQEnd = waitr;
//    }
    return RET_OK;
}

static RetCode mntr_getNextWaitr( PMntr const mntr, PMntrWaitr * waitr )
{

}

RetCode mntr_INIT( void )
{
    return memMngr_CreateMemPool(
            sizeof(Mntr), MEM_OBJECTS_MNTR, &memPoolID_MNTR );
}

RetCode mntr_CreateMntr(
                         PMntr * usrMntrHndl,
                         const Data const data,
                         const uint8_t waitrQueueMaxSize )
{
    if ( (uint32_t) ( usrMntrHndl ) == (uint32_t) NULL )
        return RET_NOK;

    if ( (uint32_t) ( *usrMntrHndl = (PMntr) malloc( sizeof(Mntr) ) ) == (uint32_t) NULL )
        return RET_NOK;
//ToDO
//    ( *usrMntrHndl )->protectedData = data;
//    ( *usrMntrHndl )->curState = MNTR_FREE_NOOP;
//    ( *usrMntrHndl )->refCntr = (mntrRfrcCnt) 0x0u;
//    //( *usrMntrHndl )->mntrWaitrsQStrt = (PMntrWaitr) NULL;
//    //( *usrMntrHndl )->mntrWaitrsQEnd = (PMntrWaitr) NULL;
//    if ( memMngr_CreateMemPool(
//            sizeof(MntrWaitr), waitrQueueMaxSize,
//            &( ( *usrMntrHndl )->memPoolID ) )
//         != RET_OK )
//    {
//        free( *usrMntrHndl );
//        *usrMntrHndl = NULL;
//        return RET_NOK;
//    }
    return RET_OK;
}

RetCode mntr_InitMntr( PMntr const mntrHndl, const Data const data )
/*
 * To simply initialize without setting data, pass NULL as data.
 */
{
    mntrHndl->protectedData = data;
    mntrHndl->curState = MNTR_FREE_NOOP;
    mntrHndl->refCntr = (mntrRfrcCnt) 0x0u;
    mntrHndl->mntrWaitrsQTskIDStrt = TSK_ID_NO_TSK;
    mntrHndl->mntrWaitrsQTskIDEnd = TSK_ID_NO_TSK;
}

RetCode mntr_DelMntr( PMntr mntrHndl )
{
   // mntrHndl->curState = MNTR_FREE_DEL;
}

RetCode mntr_DestrMntr( PMntr * usrMntrHndl )
{
    if ( (uint32_t) ( usrMntrHndl ) == (uint32_t) NULL )
        return RET_NOK;
    if ( (uint32_t) ( *usrMntrHndl ) == (uint32_t) NULL )
        return RET_NOK;
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
    memMngr_DeleteMemPool( memPoolID_MNTR );
    free( ( *usrMntrHndl )->protectedData );
    free( *usrMntrHndl );
    *usrMntrHndl = NULL;
    return RET_OK;
}

//DONE
RetCode mntr_ReqstReadAccssMntr( Mntr * const usrMntrHndl, TskID tskID )
{
    /*
     * if monitor is currently free, grant read access
     * if monitor is currently being read, grant another read access
     * if monitor is currently being written, deny read access
     *
     * monitor is blocking
     */
    if ( usrMntrHndl->curState == MNTR_LOCK_ERROR )
    {
        // MNTR IS IN ERROR STATE
        return RET_NOK;
    }
    else if ( usrMntrHndl->curState & MNTR_FREE )    // currently either free or read access
    {
        // Read access possible -> increment reference counter
        ++( usrMntrHndl->refCntr );
        return RET_OK;
    }
    else if ( usrMntrHndl->curState & MNTR_WRITE )    // currently either write or pending write lock
    {
        /* Either Write is currently active or a write operation is pending,
         * thus put requesting task into the queue
         */

        PMntrWaitr mntrWaitrRead;    // = (PMntrWaitr) malloc( sizeof(MntrWaitr) );
        //memMngr_MemPoolMalloc( &mntrWaitrRead, usrMntrHndl->memPoolID );
        if ( (uint32_t) mntrWaitrRead != (uint32_t) NULL )
        {
            mntrWaitrRead->tskID = tskID;
            mntrWaitrRead->accssType = MNTR_ACCESS_READ;

            // append to the end of the monitor's waiter list
            mntr_appendToWaitrList( usrMntrHndl, mntrWaitrRead );

            //ToDo
//            if ( tsk_SetInactive( &(tsk_AR[tskID]), TSK_STATE_WAITING_MNTR ) != RET_OK )
//            {
//                usrMntrHndl->mntrWaitrsQEnd =
//                        usrMntrHndl->mntrWaitrsQEnd->ptrXOR;
//                if ( (uint32_t) usrMntrHndl->mntrWaitrsQEnd != (uint32_t) NULL )
//                {
//                    //ToDO KILL ME
//                }
//            }
        }
        return RET_NOK;
    }
    else
    {
        // SOME UNEXPECTED ERROR?!?!
        return RET_NOK;
    }
}

//DONE
RetCode mntr_RelsReadAccssMntr( Mntr * const usrMntrHndl )
{
    if ( usrMntrHndl->curState == MNTR_LOCK_ERROR )
    {
        // MNTR IS IN ERROR STATE
        return RET_NOK;
    }
    else if ( usrMntrHndl->curState & MNTR_RPW )    // currently either read access or pending write
    {
        // Release read access possible -> decrement reference counter
        if ( --( usrMntrHndl->refCntr ) == (mntrRfrcCnt) 0x0u )
        {
            // no more read references
            //ToDO
            //if ( (uint32_t) usrMntrHndl->mntrWaitrsQStrt != (uint32_t) NULL )    // There is a writer waiting
            {
                // grant write access
                //ToDo
                //tsk_ActvTsk( &(tsk_AR[usrMntrHndl->mntrWaitrsQStrt->tskID]) );
                usrMntrHndl->curState = MNTR_LOCK_WRITE;
            }
            //ToDo
//            else
//            {
//                usrMntrHndl->curState = MNTR_FREE_NOOP;    //set NOOP
//            }
        }
        return RET_OK;
    }
    else    // FAILURE
    {
        return RET_NOK;
    }
}

RetCode mntr_ReqstWriteAccssMntr( Mntr * const usrMntrHndl, TskID tskID )
{
    /*
     * if monitor is currently free, grant write access
     * else if monitor is currently either being written or read, deny write access
     *
     * monitor is blocking
     */
    if ( usrMntrHndl->curState == MNTR_LOCK_ERROR )
    {
        // MNTR IS IN ERROR STATE
        return RET_NOK;
    }
    else if ( usrMntrHndl->curState & MNTR_FREE_NOOP )    // currently free
    {
        // Read access possible -> increment reference counter
        ++( usrMntrHndl->refCntr );
        usrMntrHndl->curState = MNTR_LOCK_WRITE;
        return RET_OK;
    }
    else    // no error, but not free... queue into waitrList
    {
        /* Either Write is currently active, a write operation is pending or,
         * thus put requesting task into the queue
         */
        //ToDO
//        MntrWaitr *mntrWaitrWrite;    // = (MntrWaitr *) malloc( sizeof(MntrWaitr) );
//        memMngr_MemPoolMalloc( &mntrWaitrWrite, usrMntrHndl->memPoolID );
//        if ( (uint32_t) mntrWaitrWrite != (uint32_t) NULL )
//        {
//            mntrWaitrWrite->tskID = tskID;
//            mntrWaitrWrite->accssType = MNTR_ACCESS_WRITE;
//
//            // append to the end of the monitor's waiter list
//            mntr_appendToWaitrList( usrMntrHndl, mntrWaitrWrite );
//
//            if ( tsk_SetInactive( &(tsk_AR[tskID]), TSK_STATE_WAITING_MNTR ) != RET_OK )
//            {
//                usrMntrHndl->mntrWaitrsQEnd =
//                        usrMntrHndl->mntrWaitrsQEnd->ptrXOR;
//                memMngr_MemPoolFree( mntrWaitrWrite, usrMntrHndl->memPoolID );
//                if ( (uint32_t) usrMntrHndl->mntrWaitrsQEnd != (uint32_t) NULL )
//                {
//                    //ToDO KILL ME
//                }
//            }
//            return RET_OK;
//        }
        return RET_NOK;
    }
}

RetCode mntr_RelsWriteAccssMntr( Mntr * const usrMntrHndl )
{
    if ( usrMntrHndl->curState == MNTR_LOCK_ERROR )
    {
        // MNTR IS IN ERROR STATE
        return RET_NOK;
    }
    else    // supposedly in write mode //ToDO Error checking
    {
        //ToDO
//        // decrement reference counter
//        if ( --( usrMntrHndl->refCntr ) == (mntrRfrcCnt) 0x0u )
//        {
//            if ( (uint32_t) usrMntrHndl->mntrWaitrsQStrt != (uint32_t) NULL )    // There is a queue
//            {
//                usrMntrHndl->curFlg = MNTR_FREE_READ;
//                PMntrWaitr temp;
//                if ( usrMntrHndl->mntrWaitrsQStrt->accssType == MNTR_ACCESS_WRITE )
//                {
//                    // the next element in the queue demands write access, thus activate only this element and leave the rest queued, since the monitor is now blocked again by a write access
//
//                    // grant write access
//                    temp = usrMntrHndl->mntrWaitrsQStrt;
//                    tsk_ActvTsk( &(tsk_AR[temp->tskID]) );
//                    usrMntrHndl->mntrWaitrsQStrt = temp->ptrXOR;
//                    usrMntrHndl->mntrWaitrsQStrt->ptrXOR =
//                            (PMntrWaitr) ( (uint32_t) usrMntrHndl->mntrWaitrsQStrt->ptrXOR
//                                    ^ (uint32_t) temp );
//                    memMngr_MemPoolFree( temp, usrMntrHndl->memPoolID );
//                    usrMntrHndl->curFlg = MNTR_WRITE;
//                }
//                else    // there is(are) read access waiter(s) at the start of the monitor's waiter queue
//                {
//                    do
//                    {
//                        if ( usrMntrHndl->mntrWaitrsQStrt->accssType == MNTR_ACCESS_WRITE )
//                        {
//                            usrMntrHndl->curFlg = MNTR_PENDING_WRITE;
//                            break;
//                        }
//                        temp = usrMntrHndl->mntrWaitrsQStrt;
//                        tsk_ActvTsk( &(tsk_AR[temp->tskID]) );
//                        ++( usrMntrHndl->refCntr );
//                        usrMntrHndl->mntrWaitrsQStrt = temp->ptrXOR;
//                        usrMntrHndl->mntrWaitrsQStrt->ptrXOR =
//                                (PMntrWaitr) ( (uint32_t) usrMntrHndl->mntrWaitrsQStrt->ptrXOR
//                                        ^ (uint32_t) temp );
//                        memMngr_MemPoolFree( temp, usrMntrHndl->memPoolID );
//                    } while ( (uint32_t) usrMntrHndl->mntrWaitrsQStrt
//                            != (uint32_t) NULL );    // while there are elements in the monitor's waiter queue keep going
//                }
//
//                if ( (uint32_t) usrMntrHndl->mntrWaitrsQStrt == (uint32_t) NULL )
//                {
//                    usrMntrHndl->mntrWaitrsQEnd = (PMntrWaitr) NULL;
//                }
//            }
//            else
//            {
//                usrMntrHndl->curFlg = MNTR_FREE_NOOP;    //set NOOP
//            }
//        }
//        else
//        {
//            return RET_NOK;    // reference counter mismatch!!!
//        }
        return RET_OK;
    }
}
