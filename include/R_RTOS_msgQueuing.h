/**
 * \file    R_RTOS_msgQueuing.h
 * \author  Christian Neuberger (NeubergerCh50344@th-nuernberg.de)
 * \date    02.02.2016
 *
 * \addtogroup msging Messaging
 * \{
 * \addtogroup MsgQ Message Queue
 * \{
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

#ifndef HEADERS_R_RTOS_MSGQUEUING_H_
#define HEADERS_R_RTOS_MSGQUEUING_H_

#include "R_RTOS_inc.h"
#include "R_RTOS_monitor.h"

/** \def MAX_MSGQ_SIZE
 *  \brief Maximum size of one single message queue.
 *  \note MUST BE A POWER OF TWO!
 *  \warning If the amount of data elements in the message queue exceeds the MAX_MSGQ_SIZE the oldest element is dropped!
 */
#define MAX_MSGQ_SIZE   (uint8_t)0x8u
/** \def MAX_MSGQ_MSK
 *  \brief Mask used to keep a counter within the range of MAX_MSGQ_SIZE
 */
#define MAX_MSGQ_MSK    (uint8_t)(MAX_MSGQ_SIZE-(uint8_t)0x1u)

/** \enum partIDType
 *  \brief Enumeration of PartID types.
 */
/** \typedef PartIDType
 *  \brief partIDType
 */
typedef enum partIDType
{
    PartID_TSK = (uint8_t) 0x0u, //!< Task PartID Type
    PartID_SYS = (uint8_t) 0x1u  //!< System PartID Type
} PartIDType;

/** \struct mqDummyElmnt
 *  \brief Dummy of a message queue element
 */
/** \typedef MQDummyElmnt
 *  \brief mqDummyElmnt
 */
/** \typedef PMQDummyElmnt
 *  \brief Pointer to a mqDummyElmnt
 */
typedef struct mqDummyElmnt
{
    void *element;                  //!< Dummy element
} MQDummyElmnt, *PMQDummyElmnt;

/** \struct mqPub
 *  \brief Publisher element related to a message queue.
 */
/** \typedef MQPub
 *  \brief mqPub
 */
/** \typedef PMQPub
 *  \brief Pointer to a mqPub
 */
typedef struct mqPub
{
    volatile PTskTCB publisher;      //!< pointer to the TskTCB of the publisher
} MQPub, *PMQPub;

/** \typedef MQPubs
 *  \brief Pointer to MQPub elements for a publisher list.
 */
typedef PMQPub MQPubs;

/** \struct mqTskSub
 *  \brief Task subscriber element related to a message queue.
 */
/** \typedef MQTskSub
 *  \brief mqTskSub
 */
/** \typedef PMQTskSub
 *  \brief Pointer to a mqTskSub
 */
typedef struct mqTskSub
{
    volatile PTskMB tskMailBox;             //!< mailBox of the subscriber
} MQTskSub, *PMQTskSub;

/** \struct mqSysSub
 *  \brief System subscriber element related to a message queue.
 */
/** \typedef MQSysSub
 *  \brief mqSysSub
 */
/** \typedef PMQSysSub
 *  \brief Pointer to a mqSysSub
 */
typedef struct mqSysSub
{
    volatile PMsgFktCall msgCallBack;    //!< callback function of the system function subscriber
} MQSysSub, *PMQSysSub;

/** \struct mqSub
 *  \brief Unified subscriber element related to a message queue.
 */
/** \typedef MQSub
 *  \brief mqSub
 */
/** \typedef PMQSub
 *  \brief Pointer to a mqSub
 */
typedef struct mqSub
{
    union
    {
        MQTskSub tskSub;
        MQSysSub sysSub;
    } mqSubT; //!< unified subscribers
} MQSub, *PMQSub;

/** \typedef MQSubs
 *  \brief Pointer to MQSub elements for a subscriber list.
 */
typedef PMQSub MQSubs;

/** \enum mqPrtcpntTypeEnum
 *  \brief Enumeration of message queue participant types
 */
/** \typedef MQPrtcpntType
 *  \brief mqPrtcpntTypeEnum
 */
typedef enum mqPrtcpntTypeEnum
{
    MQPrtcpnt_TskPub = (uint8_t) 0x1u,//!< Task publisher type
    MQPrtcpnt_TskSub = (uint8_t) 0x3u,//!< Task subscriber type
    MQPrtcpnt_SysSub = (uint8_t) 0x4u //!< System subscriber type
} MQPrtcpntType;

/** \struct mqPrtcpnt
 *  \brief Message queue participant structure for task and system subscribers and publishers.
 */
/** \typedef MQPrtcpnt
 *  \brief mqPrtcpnt
 */
/** \typedef PMQPrtcpnt
 *  \brief Pointer to amqPrtcpnt
 */
typedef struct mqPrtcpnt
{
    struct mqPrtcpnt * nxtMQPrtcpnt;  //!< pointer to the next participant in the list
    PartID mqPrtcpntID; //!< PartID of the participant
    MQPrtcpntType prtcpntType; //!< type of the participant \sa mqPrtcpntType
    uint8_t DUMMY; //!< unused dummy byte
    union
    {
        MQPub pub;
        MQSub sub;
        MQDummyElmnt dummy;
    } MQElmnt; //!< specialized participant structures in a union
} MQPrtcpnt, *PMQPrtcpnt;

/** \typedef MQPrtcpnts
 *  \brief Pointer to MQPrtcpnt elements for a list.
 */
typedef PMQPrtcpnt MQPrtcpnts;

/** \def MAX_QUEUE_DATA_ELEMENT_SIZE
 *  \brief Defines the amount of data one queue can hold.
 *  \warning CHOOSE WITH CAUTION! MEMORY IS EXPENSIVE!
 */
#define MAX_QUEUE_DATA_ELEMENT_SIZE (uint8_t)0x10u

/** \struct msgQ
 *  \brief Message queue which contains publishers, subscribers, data as well as information about the queue.
 *
 *  A message queue keeps track of its publishers and subscribers.
 *  Also data which is published to the queue is stored in a circular buffer.
 *  Therefore the Queue keeps track of the buffer start and end.
 *  The start of the buffer is therefore the offset to the index of the array.
 *  The queue keeps track of the number of subscribers.
 */
/** \typedef MsgQ
 *  \brief msgQ
 */
/** \typedef PMsgQ
 *  \brief Pointer to a msgQ
 */
typedef struct msgQ
{
    MQData dataQueue[MAX_MSGQ_SIZE ];    //!< circular buffer of Data
    MQPrtcpnts pubs;               //!< list of all publishers for the queue
    MQPrtcpnts subs;              //!< list of all subscribers to the queue
    QID queueID;                     //!< identifier of the message queue
    uint8_t dataQueueStart;    //!< first element in the queue ( ALSO THE OFFSET FOR THE CIRCULAR ARRAY BUFFER!!! )
    uint8_t dataQueueEnd;            //!< last element in the queue
    uint8_t subscbrCnt;              //!< amount of subscribers to this queue
    //uint8_t msgQSize; //Dynamic message queue sizing... instead of subscrbrCnt
} MsgQ, *PMsgQ;

/** \fn RetCode msgQ_initQueue( QID msgQID);
 *  \brief Initialize the message queue with the given QID.
 *
 *  \param [in] msgQID QID of the message queue to initialize
 *  \return Return the success of the operation.
 */
RetCode msgQ_initQueue( QID msgQID);

/** \fn RetCode msgQ_delQueue( const QID msgQID );
 *  \brief Delete the message queue with the given QID.
 *
 *  \param [in] msgQID QID of the message queue to delete.
 *  \return Return the success of the operation.
 */
RetCode msgQ_delQueue( const QID msgQID );

/** \fn RetCode msgQ_regTskPub( PTskTCB const pubTsk, const QID msgQID );
 *  \brief Register a task to the message queue related to the QID as a publisher.
 *
 *  \param [in] pubTsk Task to register to the message queue
 *  \param [in] msgQID QID of the message queue the task shall be registered to
 *  \return Return the success of the operation.
 */
RetCode msgQ_regTskPub( PTskTCB const pubTsk, const QID msgQID );

/** \fn RetCode msgQ_regSysPub( const uint8_t participant, const QID msgQID );
 * \brief Register a system function to the message queue related to the QID as a publisher
 *
 *  //ToDO change participant argument to SysFktID
 *
 *  \param [in] participant ID of the system function to be registered to the message queue
 *  \param [in] msgQID QID of the message queue the system function shall be registered to
 *  \return Return the success of the operation.
 */
RetCode msgQ_regSysPub( const uint8_t participant, const QID msgQID );

/** \fn RetCode msgQ_regTskSub( PTskTCB const subTsk, const QID msgQID );
 * \brief Register a task to the message queue related to the QID as a subscriber.
 *
 * \param [in] subTsk Task to register to the message queue
 * \param [in] msgQID QID of the message quuee the task shall be registered to
 * \return Return the success of the operation.
 */
RetCode msgQ_regTskSub(
                        PTskTCB const subTsk,
                        const QID msgQID);

/** \fn RetCode msgQ_regSysSub( const SysFktID subSysFktID, const QID msgQID );
 *  \brief Register a system function to the message queue related to the QID as a subscriber
 *
 * \param [in] subSysFktID SysFktID of the system function to register to the message queue
 * \param [in] msgQID QID of the message queue the system function shall be registered to
 * \return Return the success of the operation.
 */
RetCode msgQ_regSysSub( const SysFktID subSysFktID, const QID msgQID );

/** \fn RetCode msgQ_unSub( const QID msgQID, const uint16_t id );
 *  \brief Unsubscribe the participant specified by id from the message queue related to the QID.
 *
 * \param [in] msgQID QID of the message queue to unsubscribe from
 * \param [in] id ID of the participant to unsubscribe.
 * \return Return the success of the operation.
 */
RetCode msgQ_unSub( const QID msgQID, const uint16_t id );

/** \fn RetCode msgQ_pubDataToQ( const QID msgQID, const DataSize size, const DataType type, CData const data );
 *  \brief Publish constant data of a given size and type to the message queue related to the QID.
 *
 * \param [in] msgQID QID of the message queue to publish to
 * \param [in] size Size of the data to publish
 * \param [in] type Type of the data to publish
 * \param [in] data Data to publish
 * \return Return the success of the operation.
 *
 * \note the publishing instance needn't be registered to the message queue as a publisher.
 */
RetCode msgQ_pubDataToQ(
                         const QID msgQID,
                         const DataSize size,
                         const DataType type,
                         CData const data );
/** \fn RetCode msgQ_readDataFrmQ( const QID msgQID, const TskID tskID, PMQData *data);
 *  \brief Read the most recent unread data from the message queue related to QID.
 *
 * \param [in] msgQID QID of the message queue to read from
 * \param [in] tskID TskID of the task subscriber that wants to read from the message queue
 * \param [in] data Pointer to a PMQData object that will receive the data and its parameters
 * \return Return the success of the operation.
 *
 * \warning A task calling this function (via SVC) has to have registered to the message queue as a subscriber beforehand!
 */
RetCode msgQ_readDataFrmQ(
                           const QID msgQID,
                           const TskID tskID,
                           PMQData * data );

/** \fn RetCode msgQ_takeDataFrmQ( const QID msgQID, const TskID tskID, PMQData * data );
 * \warning DO NOT USE!
 *
 * \param [in] msgQID QID of the message queue to take the data from
 * \param [in] tskID TskID of the task subscriber that wants to take from the message queue
 * \param [in] data Pointer to a PMQData object that will receive the data and its parameters
 * \return Return the success of the operation.
 */
RetCode msgQ_takeDataFrmQ(
                           const QID msgQID,
                           const TskID tskID,
                           PMQData * data );

/**
 * \}
 * \}
 */
#endif /* HEADERS_R_RTOS_MSGQUEUING_H_ */
