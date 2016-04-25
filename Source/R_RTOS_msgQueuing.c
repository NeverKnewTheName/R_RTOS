/**
 * \file    R_RTOS_msgQueuing.c
 * \author  Christian Neuberger (NeubergerCh50344@th-nuernberg.de)
 * \date    02.02.2016
 *
 * \brief Services for creating, managing and maintaining message queues for IPC.
 *
 * Based upon a publish/subscribe model queues are introduced.
 * Messages can be published to the queue and are then kept in a chronological order.
 * Upon the publishing of a new message all subscribers are notified. For system subscribers a callback function is executed on the data.
 * Task subscribers do have a mailbox which is maintained by the queue. The message counters within the mailbox are updated and the according event flag in the task is set.
 *
 * Messages can be read or taken. Whilst the first keeps the message in the queue for others to read, the latter destroys the message immediately.
 * The queue keeps track of its subscribers. If a message was read by all subscribers it is deleted automatically.
 */

#include "R_RTOS_msgQueuing.h"
#include "R_RTOS_memMngr.h"
#include "R_RTOS_monitor.h"
#include "R_RTOS_BitMagic.h"

extern TskTCB tsk_AR[NR_OF_TSKS];
extern SysFkt sys_SysFkt[];

/** \var msgQ_AR[AMOUNT_OF_MSGQ]
 *  \brief Array of all message queues.
 *
 *  Since accessing message queues shall be fast and constant an array is introduced.
 *  Queues can then be accessed by index (QID as index). Therefore the QIDs shall be in the range of AMOUNT_OF_MSGQ.
 *
 *  \warning QIDs must be in the range of AMOUNT_OF_MSGQ!
 */
static MsgQ msgQ_AR[AMOUNT_OF_MSGQ ];

static void BREAK( void )
{
    while ( 1 )
    {
        ;
    }
}

/** \fn msgQ_getPartFrmLst( LstElmnt *lst, uint16_t id )
 *  \brief  Search a list for a specific id and return the matching element if found.
 *
 *  \param lst [in]          Pointer to the first element of the list containing the element to retrieve
 *  \param id  [in]          fullID of the elemnt to retrieve from the given list
 *  \return  LstElmnt *     Pointer to the element of the provided list matching the provided id.
 *
 *  Traverse the given list and check each element against the provided id. If an element with matching id is found, said element is returned.#
 *  If the list does not contain an element with the provided id, NULL is returned.
 *  \note Check for NULL ptr!
 */
static PMQPrtcpnt msgQ_getPartFrmLst( MQPrtcpnts lst, uint16_t fullID )
{
    //for(;(uin32_t)lst != NULL && lst->mqPrtcpntID.fullID != id; lst = lst->nxtMQPrtcpnt);

    while ( (uint32_t) lst != (uint32_t) NULL )
    {
        if ( lst->mqPrtcpntID.fullID == fullID )
        {
            return lst;
        }
        lst = lst->nxtMQPrtcpnt;
    }
    return (PMQPrtcpnt) NULL;
}

/** \fn msgQ_emptyPublshrLst( LstElmnt **lst )
 *  \brief  Empty and clean up the whole list.
 *
 *  \param publshrLst [in]   Pointer to a pointer to the first element of the publisher list to be emptied
 *  \return RetCode          Return the success of the operation
 *
 *  Given a pointer to the publisher list, traverse the publisher list and remove every single publisher.
 *  Also free resources for every publisher in the list.
 *  \note The list has to be single linked.
 */
static RetCode msgQ_emptyPublshrLst( PMQPrtcpnt publshrLst )
{
    PMQPrtcpnt curPublshr = publshrLst;    // set current element to the start of the list
    while ( (uint32_t) curPublshr != (uint32_t) NULL )
    {
        publshrLst = curPublshr->nxtMQPrtcpnt;    // set start to the next element
        free( curPublshr );    // free resources for the current element
        curPublshr = publshrLst;    // set current element to the current start of the list
    }
    return RET_OK;
}

/** \fn msgQ_emptySubscrbrLst( MQSubs * subscrbrLst )
 *  \brief  Empty and clean up the whole list.
 *
 *  \param subscrbrLst [in]  Pointer to a pointer to the first element of the subscriber list to be emptied
 *  \return RetCode          Return the success of the operation
 *
 *  Given a pointer to the subscriber list, traverse the subscriber list and remove every single subscriber.
 *  Also free resources for every subscriber in the list.
 *  \note The list has to be single linked.
 */
static RetCode msgQ_emptySubscrbrLst( PMQPrtcpnt subscrbrLst )
{
    PMQPrtcpnt curSubscrbr = subscrbrLst;    // set current element to the start of the list
    while ( (uint32_t) curSubscrbr != (uint32_t) NULL )
    {
        subscrbrLst = curSubscrbr->nxtMQPrtcpnt;    // set start to the next element
        if ( curSubscrbr->mqPrtcpntID.snglID[PartID_TSK] )
        {
            free( curSubscrbr->MQElmnt.sub.mqSubT.tskSub.tskMailBox );
            tsk_AR[curSubscrbr->mqPrtcpntID.snglID[PartID_TSK]].tskMailBox =
                    (PTskMB) NULL;
        }
        free( curSubscrbr );    // free resources for the current element
        curSubscrbr = subscrbrLst;    // set current element to the current start of the list
    }
    return RET_OK;
}

/** \fn msgQ_emptyMsgQ( MsgQ * const queue )
 *  \brief  Empty and clean up the whole message queue.
 *
 *  \param queue [in]       Pointer to the queue to be deleted
 *  \return RetCode         Return the success of the operation
 *
 *  Empty and free resources for publishers, subscribers, data and the queue itself.
 */
static RetCode msgQ_emptyMsgQ( MsgQ * const queue )
{
    // empty publishers
    msgQ_emptyPublshrLst( queue->pubs );
    queue->pubs = (PMQPrtcpnt) NULL;
    // empty subscribers
    msgQ_emptySubscrbrLst( queue->subs );
    queue->subs = (PMQPrtcpnt) NULL;

    return RET_OK;
}

/**  \fn RetCode msgQ_regPrtcpntInQ( MQprtcpnts *prtcpntLst, PMQPrtcpnt const prtcpnt);
 *   \brief Register a participant to the specified participant list.
 *
 *   \param [in] prtcpntLst Participant list to insert the participant into
 *   \param [in] prtcpnt Participant to insert into the specified participnat list
 *   \return Return the success of the operation
 *
 *   The new participant will be inserted at the beginning of the specified participant list.
 */
static RetCode msgQ_regPrtcpntInQ(
                                   MQPrtcpnts *prtcpntLst,
                                   PMQPrtcpnt const prtcpnt )
{
    // set the nxtMQPrtcpnt to the start of the list (NULL if no list existent yet)
    prtcpnt->nxtMQPrtcpnt = *prtcpntLst;
    // new participant is now the start of the list
    ( *prtcpntLst ) = prtcpnt;
    return RET_OK;
}

/*
 * DEPRECATED
 */
//static RetCode msgQ_regSubInQ( PMsgQ const msgQ, PMQPrtcpnt const subscrbr )
//{
//    //MsgQ *msgQ = msgQ_getQFrmID( msgQID );
//
//    //queue subscriber into queue's subscriber list
//    subscrbr->nxtMQPrtcpnt = msgQ->subs;
//    msgQ->subs = subscrbr;
//    return RET_OK;
//}
//
//static RetCode msgQ_regPubInQ( PMsgQ const msgQ, PMQPrtcpnt const publshr )
//{
//    //queue publisher into queue's publisher list
//    publshr->ptrNxt = msgQ->publishers;
//    msgQ->publishers = publshr;
//    return RET_OK;
//}

/** \fn msgQ_notifySubscrbrs( MQPrtcpnts subLst )
 *  \brief Notify all subscribers to the message queue about a new message
 *
 *  \param [in] subLst List of subscribers to the message queue
 *  \return Return the success of the operation
 *
 *  \note This function is and shall only be called when a new message was published
 */
/*
 * ToDo outsource in event dispatcher thread
 */
static RetCode msgQ_notifySubscrbrs( MQPrtcpnts subLst )
{
    while ( (uint32_t) subLst != (uint32_t) NULL )
    {
        if ( MQ_IS_TSK_ID( subLst->mqPrtcpntID.fullID ) )
        {
            // TSK SUBSCRIBER
            if ( (uint32_t) subLst->MQElmnt.sub.mqSubT.tskSub.tskMailBox != (uint32_t) NULL )
            {
                subLst->MQElmnt.sub.mqSubT.tskSub.tskMailBox->msgProv.msgQMsgProv.msgsNew =
                        ( subLst->MQElmnt.sub.mqSubT.tskSub.tskMailBox->msgProv.msgQMsgProv.msgsNew + (MsgCntr) 0x1u ) & MAX_MSGQ_MSK;
            }
            else
            {
                //SEVERE ERROR, THERE IS A TASK SUBSCRIBER WITHOUT A MAILBOX! THIS MUST NOT BE!
                BREAK();
            }
        }
        else
        {
            // SYS SUBSCRIBER
            /*
             * DO NOT call system functions directly... just update system functions mail box
             * system functions will be called in the function dispatcher thread
             */
//            ( ( subLst->MQElmnt.sub.mqSubT.sysSub.msgCallBack->sysFktCall )(
//                    (void*) data ) );
            subLst->MQElmnt.sub.mqSubT.sysSub.msgCallBack->msgProv.msgQMsgProv.msgsNew =
                    ( subLst->MQElmnt.sub.mqSubT.sysSub.msgCallBack->msgProv.msgQMsgProv.msgsNew + (MsgCntr) 0x1u ) & MAX_MSGQ_MSK;
        }
        subLst = subLst->nxtMQPrtcpnt;    // advance one element in the list
    }
    return RET_OK;
}

RetCode msgQ_initQueue( QID msgQID )
{
    PMsgQ const msgQ = &msgQ_AR[msgQID];

    uint8_t dataCntr = MAX_MSGQ_SIZE;

    while ( dataCntr-- )
    {
        msgQ->dataQueue[dataCntr].dataSize = (uint8_t) 0x0u;
        msgQ->dataQueue[dataCntr].dataType = (uint8_t) 0x0u;
        msgQ->dataQueue[dataCntr].pubID.fullID = (uint16_t) 0x0u;
        msgQ->dataQueue[dataCntr].data = (CData) NULL;
    }

    msgQ->pubs = (MQPrtcpnts) NULL;
    msgQ->subs = (MQPrtcpnts) NULL;
    msgQ->queueID = msgQID;
    msgQ->dataQueueStart = (uint8_t) 0x0u;
    msgQ->dataQueueEnd = (uint8_t) 0x0u;

    return RET_OK;
}

RetCode msgQ_delQueue( const QID msgQID )
{
    PMsgQ const msgQ = &msgQ_AR[msgQID];

    // empty publishers
    msgQ_emptyPublshrLst( msgQ->pubs );
    msgQ->pubs = (PMQPrtcpnt) NULL;
    // empty subscribers
    msgQ_emptySubscrbrLst( msgQ->subs );
    msgQ->subs = (PMQPrtcpnt) NULL;

    uint8_t dataCntr = MAX_MSGQ_SIZE;

    while ( dataCntr-- )
    {
        //ToDO garbage collection of stored data!
        if ( DATATYPE_IS_PTR( msgQ->dataQueue[dataCntr].dataType ) )
        {
            // free ressources for pointer types and strings!
//            free( msgQ->dataQueue[dataCntr].data );
        }
//        msgQ->dataQueue[dataCntr].data = (Data) NULL;
        msgQ->dataQueue[dataCntr].dataSize = 0x0u;
        msgQ->dataQueue[dataCntr].dataType = 0x0u;
    }

    return RET_OK;
}

RetCode msgQ_regTskPub( PTskTCB const pubTsk, const QID msgQID )
{
    /*
     * publishers are maintained by the queue.
     * if a task tries to register as a publisher to a queue it has already registered to,
     * the pointer to the TskTCB is updated as it is assumed it is invalid by now!
     */
    PMsgQ const msgQ = &msgQ_AR[msgQID];

    PMQPrtcpnt tmpPublshr = msgQ_getPartFrmLst(
            msgQ->pubs, MAKE_TSK_ID( pubTsk->tskID ) );

    if ( (uint32_t) tmpPublshr != (uint32_t) NULL )
    {
        tmpPublshr->MQElmnt.pub.publisher = pubTsk;
        return RET_OK;
    }
    tmpPublshr = (PMQPrtcpnt) malloc( sizeof(MQPrtcpnt) );
    if ( (uint32_t) tmpPublshr != (uint32_t) NULL )
    {
        tmpPublshr->mqPrtcpntID.fullID = MAKE_TSK_ID( pubTsk->tskID );
        tmpPublshr->MQElmnt.pub.publisher = pubTsk;
        tmpPublshr->prtcpntType = MQPrtcpnt_TskPub;
        msgQ_regPrtcpntInQ( &( msgQ->pubs ), tmpPublshr );
        return RET_OK;
    }
    return RET_NOK;
}

/*
 * DEPRECATED
 *
 * SYSTEM PUBLISHERS ARE NOT KEPT TRACK OF
 */
//RetCode msgQ_regSysPub( const uint8_t participant, const QID msgQID )
//{
//    MsgQ * const msgQ = &msgQ_AR[msgQID];
//
//    MQPub * tmpPublshr = (MQPub *) msgQ_getPartFrmLst(
//            (LstElmnt*) ( msgQ->publishers ), MAKE_SYS_ID( participant ) );
//
//    if ( (uint32_t) tmpPublshr != (uint32_t) NULL )
//    {
//        tmpPublshr->publisher = NULL;
//        return RET_OK;
//    }
//    tmpPublshr = (MQPub *) malloc( sizeof(MQPub) );
//    if ( (uint32_t) tmpPublshr != (uint32_t) NULL )
//    {
//        tmpPublshr->pubID.fullID = MAKE_SYS_ID( participant );
//        tmpPublshr->publisher = NULL;
//        msgQ_regPubInQ( msgQ, (MQPub *) tmpPublshr );
//        return RET_OK;
//    }
//    return RET_NOK;
//}
RetCode msgQ_regTskSub( PTskTCB const subTsk, const QID msgQID )
{
    /*
     * subscribers are maintained by the queue.
     * if a task tries to subscribe to a queue it has already subscribed to,
     * its mailbox is simply updated, because there should already be a mailbox!
     */
    PMsgQ const msgQ = &msgQ_AR[msgQID];

    PMQPrtcpnt tmpSubscrbr = msgQ_getPartFrmLst(
            msgQ->subs, MAKE_TSK_ID( subTsk->tskID ) );

    /*
     * If the subscriber already exists (subscription does not end with the destruction of a task),
     * only the subscribing task's mailbox is updated to the mailbox stored with the subscriber.
     *
     * Since a mailbox is capable of outliving the lifetime of a task,
     * it can be used to receive messages even if the task is not yet existent.
     * This is to be used with care, since a queue has limited capabilities of storing messages!
     */
    if ( (uint32_t) tmpSubscrbr != (uint32_t) NULL )
    {
        tmpSubscrbr->MQElmnt.sub.mqSubT.tskSub.tskMailBox->nxtTskMB =
                subTsk->tskMailBox;
        subTsk->tskMailBox = tmpSubscrbr->MQElmnt.sub.mqSubT.tskSub.tskMailBox;
        //subTsk->tskMailBox->msgsNew = (uint8_t) 0x0u;    // reset new message counter
        //subTsk->tskMailBox->msgMntnr = (uint32_t) 0x0u;    // reset new msgMntnr
        return RET_OK;
    }

    tmpSubscrbr = (PMQPrtcpnt) malloc( sizeof(MQPrtcpnt) );
    if ( (uint32_t) tmpSubscrbr != (uint32_t) NULL )
    {
        /*
         * Mailboxes are maintained by the queue.
         * The task receives a reference to its mailbox if it already exists.
         * If the mailbox does not yet exit a new mailbox is created.
         */
        ++( msgQ->subscbrCnt );
        PTskMB mqMailBox = (PTskMB) malloc( sizeof(TskMB) );
        if ( (uint32_t) mqMailBox != (uint32_t) NULL )
        {
            mqMailBox->msgProvType = MsgQ_Prov;
            mqMailBox->msgProv.msgQMsgProv.msgQID = msgQID;
            mqMailBox->msgProv.msgQMsgProv.msgsNew = (uint8_t) 0x0u;
            mqMailBox->nxtTskMB = subTsk->tskMailBox;
            subTsk->tskMailBox = mqMailBox;
            tmpSubscrbr->MQElmnt.sub.mqSubT.tskSub.tskMailBox = mqMailBox;
            tmpSubscrbr->mqPrtcpntID.fullID = MAKE_TSK_ID( subTsk->tskID );
            tmpSubscrbr->prtcpntType = MQPrtcpnt_TskSub;
            msgQ_regPrtcpntInQ( &( msgQ->subs ), tmpSubscrbr );
            return RET_OK;
        }
        free( tmpSubscrbr );
        return RET_NOK;
    }
    return RET_NOK;
}

RetCode msgQ_regSysSub( const SysFktID subSysFktID, const QID msgQID )
{
    /*
     * subscribers are maintained by the queue.
     * if the system tries to subscribe to a queue it has already subscribed to,
     * the callBack function of the according participant subscriber element is updated.
     */
    PMsgQ const msgQ = &msgQ_AR[msgQID];

    PMQPrtcpnt tmpSubscrbr = (PMQPrtcpnt) msgQ_getPartFrmLst(
            msgQ->subs, MAKE_SYS_ID( subSysFktID ) );

    if ( (uint32_t) tmpSubscrbr == (uint32_t) NULL )
    {
        /*
         * system subscriber is not yet in the subscriber list, therefore add it to the subscriber list
         */
        tmpSubscrbr = (PMQPrtcpnt) malloc( sizeof(MQPrtcpnt) );
        if ( (uint32_t) tmpSubscrbr != (uint32_t) NULL )
        {
            ++( msgQ->subscbrCnt );
            tmpSubscrbr->mqPrtcpntID.fullID = MAKE_SYS_ID( subSysFktID );
            tmpSubscrbr->prtcpntType = MQPrtcpnt_SysSub;
            msgQ_regPrtcpntInQ( &( msgQ->subs ), tmpSubscrbr );
        }
        else
        {
            //COULD NOT AllOCATE MEMORY FOR THE SYSTEM SUBSCRIBER
            return RET_NOK;
        }
    }

    // Update system subscriber regardless of whether it already was in the subscriber list or has just been added
    tmpSubscrbr->MQElmnt.sub.mqSubT.sysSub.msgCallBack =
            &sys_SysFkt[subSysFktID].fktCallType.msgFktCall;
    tmpSubscrbr->MQElmnt.sub.mqSubT.sysSub.msgCallBack->msgProvType = MsgQ_Prov;
    tmpSubscrbr->MQElmnt.sub.mqSubT.sysSub.msgCallBack->msgProv.msgQMsgProv.msgQID =
            msgQID;
    tmpSubscrbr->MQElmnt.sub.mqSubT.sysSub.msgCallBack->msgProv.msgQMsgProv.msgsNew =
            (MsgCntr) 0x0u;

    return RET_OK;
}

RetCode msgQ_unSub( const QID msgQID, const uint16_t id )
{
    PMsgQ const msgQ = &msgQ_AR[msgQID];

    PMQPrtcpnt tmpSubscrbr = msgQ->subs;
    PMQPrtcpnt prvSubscrbr = (PMQPrtcpnt) NULL;

    while ( (uint32_t) tmpSubscrbr != (uint32_t) NULL )
    {
        if ( tmpSubscrbr->mqPrtcpntID.fullID == id )
        {
            if ( (uint32_t) prvSubscrbr != (uint32_t) NULL )
                prvSubscrbr->nxtMQPrtcpnt = tmpSubscrbr->nxtMQPrtcpnt;

            if ( MQ_IS_TSK_ID( id ) )
            {
                // Task subscriber -> delete mailbox and free resources
                free( tmpSubscrbr->MQElmnt.sub.mqSubT.tskSub.tskMailBox );
                tsk_AR[tmpSubscrbr->mqPrtcpntID.snglID[PartID_TSK]].tskMailBox =
                        (PTskMB) NULL;
            }
            free( tmpSubscrbr );
            --( msgQ->subscbrCnt );
            return RET_OK;
        }
        //ADVANCE IN THE LIST
        prvSubscrbr = tmpSubscrbr;
        tmpSubscrbr = tmpSubscrbr->nxtMQPrtcpnt;
    }
    return RET_NOK;
}

static PMQData msgQ_popCircBuff( PMsgQ const msgQ )
{
    if ( msgQ->dataQueueEnd == msgQ->dataQueueStart )
        return (PMQData) NULL;

    //--( msgQ->queueSize );

    // (0x0u - 0x1u)  & 0xFu = 0xFFu & 0xFu = 0xFu
    --( msgQ->dataQueueEnd );
    msgQ->dataQueueEnd &= MAX_MSGQ_MSK;    // restart circle in case of buffer overflow
    // index of new data is dataQueueEnd - 0x1u because the dataQueueEnd index points to the element after the end element
    return &( msgQ->dataQueue[msgQ->dataQueueEnd/* - (uint8_t) 0x1u*/] );
}

static PMQData msgQ_pushCircBuff( PMsgQ const msgQ )
{
    //    ++( msgQ->queueSize );

    PMQData const data = &( msgQ->dataQueue[msgQ->dataQueueEnd] );
    if ( msgQ->dataQueueEnd == msgQ->dataQueueStart )
    {
        // BUFFER OVERFLOW
        //ToDO HANDLE OVERFLOW!!!

        // increment start of list
        ++( msgQ->dataQueueStart );
        msgQ->dataQueueStart &= MAX_MSGQ_MSK;    // restart circle in case of buffer overflow

        //        --( msgQ->queueSize );
//        ovrflw = (uint8_t) 0x1u;
    }
    // SIMPLEST 'MODULO' by power of two
    ++( msgQ->dataQueueEnd );    // increment before masking, else undefined behavior (C standard)
    msgQ->dataQueueEnd &= MAX_MSGQ_MSK;    // restart circle in case of buffer overflow

    // index of new data is dataQueueEnd - 0x1u because the dataQueueEnd index points to the element after the end element
    return data;
}

RetCode msgQ_pubDataToQ(
                         const QID msgQID,
                         const DataSize size,
                         const DataType type,
                         CData const data )
{
    PMsgQ const msgQ = &msgQ_AR[msgQID];

    PMQData const dataCon = msgQ_pushCircBuff( msgQ );

    dataCon->dataSize = size;
    dataCon->dataType = type;
    dataCon->data = data;
    //mntr_InitMntr( &( dataCon->dataMntr ), data );

    msgQ_notifySubscrbrs( msgQ->subs );
    return RET_OK;
}

/*
 * Message queues follow the FIFO principle.
 * Whether data is read or taken from the queue, always the oldest data is returned.
 *
 * If a queue overflows though the LIFO principle is applied, deleting the oldest data to make space for the new message.
 *
 * In regard of these principles the user is responsible for saving messages.
 */

RetCode msgQ_readDataFrmQ( const QID msgQID, const TskID tskID, PMQData *data )
{
    PMsgQ const msgQ = &msgQ_AR[msgQID];
    PMQPrtcpnt subscrbr = (PMQPrtcpnt) msgQ_getPartFrmLst(
            msgQ->subs, (uint16_t) tskID );

    if ( (uint32_t) ( subscrbr ) == (uint32_t) NULL )
    {
        //Subscriber not found in subscriber list
        return RET_NOK;
    }

    PTskMB tskMailBox = subscrbr->MQElmnt.sub.mqSubT.tskSub.tskMailBox;

    if ( tskMailBox->msgProv.msgQMsgProv.msgsNew )
    {
        // get the monitor to the data at the end of the list minus offset of new messages to get the oldest unread message
        // ( queueEnd - offset ) & ( queueSize - 1 ) == ( (offset == queueSize) ? queueStart : (queueStart + (queueSize - offset)) )
        *data = &msgQ->dataQueue[( msgQ->dataQueueEnd
                - (uint8_t) tskMailBox->msgProv.msgQMsgProv.msgsNew )
                                 & MAX_MSGQ_MSK ];

        // decrement the new message counter for the task mailbox
        --tskMailBox->msgProv.msgQMsgProv.msgsNew;
    }
    else
    {
        /*
         * There are no new messages for the task in the message queue
         */
        *data = (PMQData) NULL;
        return RET_NOK;
    }

    return RET_OK;
}

/*
 * DO NOT USE!!!
 */
RetCode msgQ_takeDataFrmQ(
                           const QID msgQID,
                           const TskID tskID,
                           PMQData * data )
{
    return msgQ_readDataFrmQ( msgQID, tskID, data );
}
