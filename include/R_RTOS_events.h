/**
 * \file    R_RTOS_events.h
 * \author  Christian Neuberger (NeubergerCh50344@th-nuernberg.de)
 * \date    02.02.2016
 *
 * \addtogroup sync
 * \{
 * \addtogroup evt Events
 * \{
 * \brief Event services for sending/receiving events in tasks.
 */

#ifndef HEADERS_R_RTOS_EVENTS_H_
#define HEADERS_R_RTOS_EVENTS_H_

#include "R_RTOS_inc.h"


/** \struct evtQueue
 *  \brief A simple singly linked list serving as one event queue.
 *
 *  Tasks that are waiting on an event are queued into this list.
 *  As soon as a task or the system sends the corresponding event, all entities in the queue are notified.
 *  The according event flag of the task is updated on entry into or exit from the list.
 *  Hence if the task is not waiting on any other events,
 *  it is set suspended and therefore ready to be continued.
 */
/** \typedef EVTQueue
 *  \brief evtQueue
 */
typedef struct evtQueue
{
    struct evtQueue *ptrNxtEvtQ;  //!< Pointer to next event queue
    TskID tskID; //!< TskID stored with the event queue
} EVTQueue;

/** \fn void evt_INIT( void );
 *  \brief Initialize the event service.
 *
 *  Initialized the event queues.
 *
 *  \warning Before using the event service it has to be initialized!
 */
void evt_INIT( void );

/** \fn RetCode evt_WaitForEvts( PTskTCB const tsk, EVTQSlots evtMask, const SysTicks maxWaitTime );
 *  \brief Sets the task up to wait for the events specified by evtMask.
 *
 *  \param [in] tsk         Task, which will then be waiting on the events specified by evtMask
 *  \param [in] evtMask     Event mask specifying all events to wait on
 *  \param [in] maxWaitTime Maximum time to block a task in SysTicks
 *
 *  \return Return the success of the operation
 *
 * The task will be put into a waiting state until all of the specified events occured.
 */
RetCode evt_WaitForEvts(
                         PTskTCB const tsk,
                         EVTQSlots evtMask,
                         const SysTicks maxWaitTime );

/** \fn RetCode evt_SendEvt( const EvtNr evtNr );
 *  \brief Sends the event specified by evtNr to all entities in the corresponding event queue.
 *
 *  \param [in] evtNr     Number of the event to be sent.
 *
 *  \return RetCode    Return the success of the operation
 *
 *  The event queue related to the evt is evaluated and all entities are updated.
 */
RetCode evt_SendEvt( const EvtNr evtNr );

/** \fn RetCode evt_GiveUpOnEvts( PTskTCB const tsk );
 *  \brief Removes the specified task from all event queues it was queued into.
 *
 *  \param [in] tsk    Pointer to the TskTCB of the task giving up on all events.
 *  \return RetCode    Return the success of the operation
 *
 * Calling this function removes the specified task from all event queues and updates the rest of the queues accordingly.
 * \note Is called automatically if a task is destroyed, but has not yet received events it was waiting on.
 */
RetCode evt_GiveUpOnEvts( PTskTCB const tsk );

/**
 * \}
 * \}
 */
#endif /* HEADERS_R_RTOS_EVENTS_H_ */
