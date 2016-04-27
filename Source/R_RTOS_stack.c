/**
 * \file    R_RTOS_stack.c
 * \author  Christian Neuberger (NeubergerCh50344@th-nuernberg.de)
 * \date    26.11.2015
 *
 * \brief Functions for creating, initializing, maintaining and handling a task's stack.
 */

#include "R_RTOS_stack.h"
#include "R_RTOS_memMngr.h"

#ifdef __DEBUG__
#include <string.h>
#include "DevFunc.h"
extern char gSysMsg[SYS_MSG_LEN];
#endif

/** \def portINITIAL_XPSR
 *  \brief initial XPSR value for a task.
 */
#define portINITIAL_XPSR    ( (uint32_t)0x01000000u )

static void BREAK( void )
{
    while ( 1 )
    {
        ;
    }
}

RetCode stk_StackCreate(
                         register PTskTCB tsk,
                         register StackSize desiredStackSize )
{
#ifdef __DEBUG__
#ifdef __DEBUG__FLOW__
    WRITE_TO_MSG_BUFF( gSysMsg, "StkCRT" );
#endif
#endif
    // allocate memory for the stack bytes
    register StackPtrT stckPtr = (volatile StackPtrT) malloc(
            (MemSize) desiredStackSize );
    if ( (uint32_t) stckPtr != (uint32_t) NULL )
    {
        stckPtr =
                (StackPtrT) ( (uint32_t) stckPtr + (uint32_t) desiredStackSize );
        tsk->pStckTop = stckPtr;
        tsk->pStckPtr = (volatile StackPtrT) stckPtr;
        tsk->stckSze = desiredStackSize;
        /* DEBUG */
        //stck_TSTStck(tsk);
        /* DEBUG */
        return RET_OK;
    }
    else
    {
        //ALLOCATION FAILED
        tsk->pStckTop = (StackPtrT) NULL;
        tsk->pStckPtr = (volatile StackPtrT) NULL;
        tsk->stckSze = (StackSize) 0x0u;
        BREAK();
        return RET_NOK;
    }
}

RetCode stk_StackInit( register PTskTCB tsk, void *fktParam )
{
#ifdef __DEBUG__
#ifdef __DEBUG__FLOW__
    WRITE_TO_MSG_BUFF( gSysMsg, "StkINI" );
#endif
#endif
    register volatile StackPtrT stckPtr = (volatile StackPtrT) tsk->pStckTop;
    if ( (uint32_t) stckPtr != (uint32_t) NULL )
    {
        stckPtr--;
        *stckPtr = portINITIAL_XPSR;    //xPSR
        stckPtr--;
        *stckPtr = (StackTypeT) tsk->pTskStrt;    //PC
        stckPtr--;
        *stckPtr = (StackTypeT) tsk->pTskEnd;    //LR
        stckPtr -= (uint32_t) 0x5u;    // R12, R3, R2, R1
        *stckPtr = (StackTypeT) fktParam;    // R0
        stckPtr -= (uint32_t) 0x8u;    // R11 - R4

        tsk->pStckPtr = stckPtr;
        /*
         * Stack Frame
         * Exception return:
         *
         *      xPSR    -- 15
         *       v
         *      PC      -- 14
         *       v
         *      LR      -- 13
         *       v
         *      R12     -- 12
         *       v
         *      R3      -- 11
         *       v
         *      R2      -- 10
         *       v
         *      R1      -- 9
         *       v
         *      R0      -- 8
         *
         * extended
         *      R4      -- 7
         *       v
         *      R5      -- 6
         *       v
         *      R6      -- 5
         *       v
         *      R7      -- 4
         *       v
         *      R8      -- 3
         *       V
         *      R9      -- 2
         *       V
         *      R10     -- 1
         *       v
         *      R11     -- 0
         */
#ifdef __DEBUG__
#ifdef __DEBUG__DETAILED__
        WRITE_TO_MSG_BUFF( gSysMsg, "StkINI_StkPtrSet" );
#endif
#endif
        return RET_OK;
    }
    else
    {
#ifdef __DEBUG__
#ifdef __DEBUG__ERR__
        WRITE_TO_MSG_BUFF( gSysMsg, "StkINI_NStkBTPtr" );
#endif
#endif
        BREAK();
        return RET_NOK;
    }
}

//delete the stack and free the memory
RetCode stk_StackDestroy( register PTskTCB tsk )
{
#ifdef __DEBUG__
#ifdef __DEBUG__FLOW__
    WRITE_TO_MSG_BUFF( gSysMsg, "StkDS" );
#endif
#endif
    register volatile StackPtrT stckPtr = (volatile StackPtrT) tsk->pStckTop;
    if ( (uint32_t) stckPtr != (uint32_t) NULL )
    {
        // get bottom of stack
        stckPtr = (volatile StackPtrT) ( (uint32_t) stckPtr
                - (uint32_t) tsk->stckSze );
        free( stckPtr );
        tsk->pStckTop = (const StackPtrT) NULL;
        tsk->pStckPtr = (volatile StackPtrT) NULL;
        tsk->stckSze = (StackSize) 0x0u;
        return RET_OK;
    }
    else
    {
        // there is no top of stack??
        BREAK();
        return RET_NOK;;
    }
}

// FOR FUTURE USE
RetCode stk_TSTStck( PTskTCB const tsk )
{
    register volatile StackPtrT stckTopPtr = (volatile StackPtrT) tsk->pStckTop;
    register volatile StackPtrT stckPtr = (volatile StackPtrT) tsk->pStckTop;
    if ( (uint32_t) stckTopPtr != (uint32_t) NULL )
    {
        // get bottom of stack
        stckPtr = (volatile StackPtrT) ( (uint32_t) stckPtr
                - (uint32_t) tsk->stckSze );

        while( (uint32_t)stckPtr != (uint32_t)stckTopPtr )
        {
            *stckPtr = (uint32_t)0x55555555u;
            stckPtr++;
        }
        return RET_OK;
    }
    return RET_NOK;
}

// FOR FUTURE USE
RetCode stk_StackClear( PTskTCB const tsk )
{
    BREAK();
    return RET_OK;
}
