/**
< * \file    R_RTOS_memMngr.c
 * \author  Christian Neuberger (NeubergerCh50344@th-nuernberg.de)
 * \date    18.12.2015
 *
 * \brief Functions for creating, initializing, maintaining and handling a task timers.
 */

#include "R_RTOS_memMngr.h"
#include "R_RTOS_BitMagic.h"

extern const MemMngrHead __HeapBase;
extern const MemMngrHead __HeapLimit;

static MemMngrHead * const memoryHEAPBASE = (MemMngrHead * const ) &__HeapBase;
//static MemMngrHead memoryHEAPBASE[BIGGEST_BLCK/SMALLEST_BLCK] = (MemMngrHead * const ) &__HeapBase;
//static const arElWidth = SMALLEST_BLCK;

static const MemIndex failMemIndex = (MemIndex) ( 0xFFFFu );

/** \var freeMemLst
 *  \brief List of free blocks of memory.
 *
 *  Contains free blocks of memory that are not cached.
 *
 *  Initialized to NULL.
 */
static MemMngrHead * freeMemLst = (MemMngrHead *) NULL;

/** \var objCache
 *  \brief List of free cached blocks of memory.
 *
 *  As soon as a block of memory is freed it is added to the objCache.
 *  The size of the obCache is define by CACHE_SIZE. If the size exceeds this limit elements are removed according to FIFO principle.
 *
 *  Initialized to NULL.
 */
static MemMngrHead * objCache = (MemMngrHead *) NULL;

/** \var objCacheEnd
 *  \brief End of the objCache List.
 *
 *  The last element in the object cache.
 *
 *  Initialized to NULL.
 */
static MemMngrHead * objCacheEnd = (MemMngrHead *) NULL;

/** \var buddyOffset
 *  \brief Memory address offset of buddy blocks.
 *
 *  In order to be able to XOR the address of a block with its size and get its buddy, addresses have to be altered with an offset beforehand.
 *
 *  E.g.:<br>
 *  Actual address: 0x1ffff38<br>
 *  Offset: 0x8<br>
 *  Possible size:  0x20<br>
 *  Buddy block = ( (0x1ffff38 - 0x8) ^ 0x20 ) + 0x8
 *
 *  Initialized to 0x0.
 */
static uint8_t buddyOffset = (uint8_t) 0x0u;

/** \var cacheSize
 *  \brief Counter for the current size of the objCache.
 *
 *  Keeps track of the elements in the objCache. Decreases and increases automatically when objects are added, removed or kicked out.
 *
 *  Initialized to 0x0.
 */
static uint8_t cacheSize = (uint8_t) 0x0u;

static volatile uint32_t memPoolsInUse = 0x0u;
static MemMngrHead *memPools[NR_OF_MEMPOOLS ];

static void BREAK( void )
{
    while ( 1 )
    {
        ;
    }
}

//static MemSize getBlckMemSize( MemMngrHead * const blckToGetSizeOf )
//{
//
//}

static MemSize setBlckMemSize(
                               MemMngrHead * const blckToSetSizeOf,
                               MemSize newSize )
{
    if ( ( (BlckSize) ( newSize ) ) < BIGGEST_BLCK )
    {
        MEM_FLG_SET_SPLIT( blckToSetSizeOf );
    }
    else
    {
        MEM_FLG_CLR_SPLIT( blckToSetSizeOf );
    }

    blckToSetSizeOf->flagsForMemBlock =
            (MemFlags) ( blckToSetSizeOf->flagsForMemBlock
                    & (MemFlags) ( ~MEM_FLGS_SIZE_MSK ) );
    blckToSetSizeOf->flagsForMemBlock =
            (MemFlags) ( blckToSetSizeOf->flagsForMemBlock
                    | (MemFlags) ( (MemFlags) ( newSize ) & MEM_FLGS_SIZE_MSK ) );

    return newSize;
}

//static MemSize getPRVBlckMemSize( MemMngrHead * const blckToGetSizeOfPrvBlck )
//{
//
//}

static MemSize setPRVBlckMemSize(
                                  MemMngrHead * const blckToSetSizeOfPrvBlck,
                                  MemSize newSize )
{
    blckToSetSizeOfPrvBlck->additionalFlags =
            (MemFlags) ( blckToSetSizeOfPrvBlck->additionalFlags
                    & (MemFlags) ( ~MEM_FLGS_SIZE_MSK ) );
    blckToSetSizeOfPrvBlck->additionalFlags =
            (MemFlags) ( blckToSetSizeOfPrvBlck->additionalFlags
                    | (MemFlags) ( (MemFlags) ( newSize ) & MEM_FLGS_SIZE_MSK ) );
    return newSize;
}

RetCode initMEM( void )
{
    MemMngrHead * memLstTempElem = freeMemLst = (MemMngrHead*) memoryHEAPBASE;

    buddyOffset = (uint8_t) ( (uint32_t) ( memoryHEAPBASE )
            & (uint32_t) BIGGEST_BLCK_MSK );

    MemIndex prvBlck = failMemIndex;
    MemIndex curBlck = (MemIndex) 0x0u;

    while ( memLstTempElem != (stdPtr) NULL )
    {
        // get current memory block by current index
        memLstTempElem = memoryHEAPBASE + curBlck;    //&memoryHEAPBASE[curBlck];

        if ( ( (uint32_t) memLstTempElem ) >= (uint32_t) ( &__HeapLimit ) )
        {
            memLstTempElem = memoryHEAPBASE + prvBlck;
            break;
        }

        // reset flags
        memLstTempElem->flagsForMemBlock = (MemFlags) 0x0u;
        // set current size of the memory block
        setBlckMemSize( memLstTempElem, BIGGEST_BLCK );
        // reset additional flags
        memLstTempElem->additionalFlags = (MemFlags) 0x0u;
        // set as block beginning block
        MEM_FLG_SET_BLCKBEG( memLstTempElem );
        // set size of previous memory block
        setPRVBlckMemSize( memLstTempElem, BIGGEST_BLCK );
        // set index of previous memory block
        memLstTempElem->prvMemBlck = prvBlck;

        // previous index is now current index
        prvBlck = curBlck;
        // current index is now next index
        curBlck = (MemIndex) ( curBlck
                + (MemIndex) ( (MemIndex) BIGGEST_BLCK
                        / (MemIndex) SMALLEST_BLCK ) );

        // set index of next memory block
        memLstTempElem->nxtMemBlck = curBlck;
    }

    freeMemLst->prvMemBlck = failMemIndex;
    setPRVBlckMemSize( freeMemLst, (MemSize) 0x0u );
    memLstTempElem->nxtMemBlck = failMemIndex;
    MEM_FLG_SET_BLCKLAST( memLstTempElem );

    // initialize the memPoolsInUse flags
    // set the bit at the maximum number of mempools
    memPoolsInUse = (uint32_t) ( (uint32_t) 0x1u << NR_OF_MEMPOOLS );
    // reset all bits prior to the current set bit
    memPoolsInUse = (uint32_t) ( ( memPoolsInUse | -memPoolsInUse ) );

    return RET_OK;
}

/** \fn static void delMemBlck( MemMngrHead * const blckToDelete )
 *  \brief  Delete a block from the list it is contained in.
 *
 *  \param [in] blckToDelete    Pointer to the block which shall be deleted from its list.
 *
 *  Adjusts the ptrNXT and ptrPREV of the block as well as the next and previous block's pointers.
 */
static void delMemBlck( MemMngrHead * const blckToDelete )
{
    if ( blckToDelete->nxtMemBlck != failMemIndex )
    {
        //memoryHEAPBASE[blckToDelete->nxtMemBlck].prvMemBlck = blckToDelete->prvMemBlck;
        memoryHEAPBASE[blckToDelete->nxtMemBlck].prvMemBlck =
                blckToDelete->prvMemBlck;
    }
    if ( blckToDelete->prvMemBlck != failMemIndex )
    {
        //memoryHEAPBASE[blckToDelete->prvMemBlck].nxtMemBlck = blckToDelete->nxtMemBlck;
        memoryHEAPBASE[blckToDelete->prvMemBlck].nxtMemBlck =
                blckToDelete->nxtMemBlck;
    }
    else
    {
        freeMemLst = memoryHEAPBASE + blckToDelete->nxtMemBlck;    //&memoryHEAPBASE[blckToDelete->nxtMemBlck];
    }
}

/** \fn static MemMngrHead *getAdjacentPrevBlck( MemMngrHead * const curBlck )
 *  \brief Calculate and return the block prior to the given block.
 *
 *  \param [in] curBlck     Pointer to the block to return the predecessor to.
 *
 *  Using the saved size of the previous block ( in additionalFlags ) the previous block is calculated, casted to MemMngrHead * and returned.
 */
static MemMngrHead *getAdjacentPrevBlck( MemMngrHead * const curBlck )
{
    MemMngrHead * const adjPrvBlck = (MemMngrHead*) ( (uint32_t) curBlck
            - (uint32_t) MEM_FLG_GET_PREV_MEMSIZE(
                    ( curBlck )->additionalFlags ) );

    return ( (uint32_t) adjPrvBlck <= (uint32_t) ( &__HeapBase ) ) ?
            (MemMngrHead *) NULL : adjPrvBlck;
}

/** \fn static MemMngrHead *getAdjacentNxtBlck( MemMngrHead * const curBlck )
 *  \brief Calculate and return the block next to the given block.
 *
 *  \param [in] curBlck     Pointer to the block to return the successor to.
 *
 *  Using the saved size of the curBlck ( in flagsForMemBlock ) the next block is calculated, casted to MemMngrHead * and returned.
 */
static MemMngrHead *getAdjacentNxtBlck( MemMngrHead * const curBlck )
{
    MemMngrHead * const adjNxtBlck = (MemMngrHead*) ( (uint32_t) curBlck
            + (uint32_t) MEM_FLG_GET_MEMSIZE( ( curBlck )->flagsForMemBlock ) );

    return ( (uint32_t) adjNxtBlck >= (uint32_t) ( &__HeapLimit ) ) ?
            (MemMngrHead *) NULL : adjNxtBlck;
}

/** \fn static MemMngrHead *getBuddyBlck( MemMngrHead * const curBlck )
 *  \brief Calculate and return the buddy block to the given block.
 *
 *  \param [in] curBlck     Pointer to the block to return the buddy block to.
 *
 *  Using the buddyOffset the address of curBlck is XORed with the block's size to get its buddy block.
 *  The result is casted to MemMngrHead and returned.
 *
 *  \warning DO NOT USE THE BUDDY BLOCK, AS IT IS NOT GUARANTEED, THAT THE BLOCK IS FREE. NOR IS THERE ANY GUARANTEE, THAT THE BLOCK IS NOT INSIDE OF A COMBINATION OF BLOCKS. USE ONLY THE ADDRESS!
 */
static MemMngrHead *getBuddyBlck( MemMngrHead * const curBlck )
{
    return (MemMngrHead *) ( (uint32_t) ( (uint32_t) ( (uint32_t) curBlck
            - (uint32_t) buddyOffset )
                                          ^ (uint32_t) MEM_FLG_GET_MEMSIZE(
                                                  curBlck->flagsForMemBlock ) )
                             + (uint32_t) buddyOffset );
}

static MemIndex getIndex( MemMngrHead * const memBlck )
{
    if ( ( memBlck < &__HeapBase ) || ( memBlck > &__HeapLimit ) )
    {
        BREAK();
    }
    return (MemIndex) ( (MemIndex) ( (uint32_t) memBlck
            - (uint32_t) ( memoryHEAPBASE ) )
                        >> (MemIndex) SMALLER_BLCK_DIVISOR );
}

/** \fn static void fitBlckBackIntoFreeLst( MemMngrHead * curBlck )
 *  \brief Put the given block back into the free memory blocks list according to its address.
 *
 *  \param [in] curBlck     Pointer to the block to be reinserted into the free memory blocks list.
 *
 *  The next and previous free block of memory is calculated.
 *  The ptrNXT and ptrPREV of these and the curBlck are adjusted accordingly.
 *  The start of the freeMemLst is adjusted if there is no free previous block of memory.
 */
static void fitBlckBackIntoFreeLst( MemMngrHead * const curBlck )
{
//    volatile MemMngrHead *nxtFreeBlck = freeMemLst;
//    volatile MemMngrHead *prvFreeBlck = (MemMngrHead *) NULL;
    MemIndex curIndex = getIndex( curBlck );
    MemIndex nxtIndex = getIndex( freeMemLst );
    MemIndex prvIndex = failMemIndex;

//    // go through the freeMemLst until the address of the current block does no longer exceed the next element
//    // or until the list end is reached
//    while ( (uint32_t) curBlck
//            > (uint32_t) ( nxtFreeBlck ) )
//    {
//        if( nxtFreeBlck->nxtMemBlck != failMemIndex )
//        {
//            prvFreeBlck = nxtFreeBlck;
//            nxtFreeBlck = memoryHEAPBASE + nxtFreeBlck->nxtMemBlck;  //&memoryHEAPBASE[nxtFreeBlck->nxtMemBlck];
//        } else {
//            break;
//        }
//    }

    while ( curIndex > nxtIndex )
    {
        prvIndex = nxtIndex;
        nxtIndex = memoryHEAPBASE[nxtIndex].nxtMemBlck;
        if ( nxtIndex == failMemIndex )
        {
            break;
        }
    }

    curBlck->nxtMemBlck = nxtIndex;
    curBlck->prvMemBlck = prvIndex;

    if ( nxtIndex != failMemIndex )
    {
        memoryHEAPBASE[nxtIndex].prvMemBlck = curIndex;
    }
    if ( prvIndex != failMemIndex )
    {
        memoryHEAPBASE[prvIndex].nxtMemBlck = curIndex;
    }
    else
    {
        freeMemLst = curBlck;
    }
}

/** \fn static uint8_t mergeMemBlck( MemMngrHead **blckToMerge )
 *  \brief The given memory block is merged with its buddy block if it is free and not cached.
 *
 *  \param [in] blckToMerge     Pointer to a pointer to the block to be merged.
 *
 *  The next and previous free block of memory is calculated.
 *  The ptrNXT and ptrPREV of these and the curBlck are adjusted accordingly.
 *  The start of the freeMemLst is adjusted if there is no free previous block of memory.
 */
static uint8_t mergeMemBlck( MemMngrHead ** blckToMerge )
{
    BlckSize split = MEM_FLG_GET_MEMSIZE( ( *blckToMerge )->flagsForMemBlock );
    MemMngrHead* tmpBlck;

    // is this the lower buddy?
    if ( MEM_FLG_ISLOWER( ( *blckToMerge )->flagsForMemBlock ) )
    {
        MemMngrHead * nxtBlck = (MemMngrHead *) getAdjacentNxtBlck(
                (MemMngrHead*) ( *blckToMerge ) );
        if ( ( nxtBlck == (MemMngrHead *) NULL ) || ( MEM_FLG_TAKENORCACHED(
                nxtBlck ) ) )
        {
            return (uint8_t) 0x0u;
        }
        else
        {
            if ( MEM_FLG_GET_MEMSIZE((*blckToMerge)->flagsForMemBlock) == MEM_FLG_GET_MEMSIZE(
                    nxtBlck->flagsForMemBlock ) )
            {
                // adjust pointer to the nxt element (skip nxtBlck)
                ( *blckToMerge )->nxtMemBlck = nxtBlck->nxtMemBlck;
                if ( nxtBlck->nxtMemBlck != failMemIndex )    // Adjust pointer to previous element for the next element only if the next element exists
                {
                    memoryHEAPBASE[nxtBlck->nxtMemBlck].prvMemBlck = getIndex(
                            *blckToMerge );
                }
                split = (BlckSize) ( split << (BlckSize) 0x1u );    // adjust the split ( *2 )
                setBlckMemSize( ( *blckToMerge ), split );    // set the new size of the block ( new split )
                tmpBlck = getAdjacentNxtBlck( (MemMngrHead*) ( *blckToMerge ) );
                if ( tmpBlck != (MemMngrHead *) NULL )    // if there is a direct next block, ajust its PREV_MEMSIZE
                {
                    setPRVBlckMemSize( tmpBlck, split );
                }
            }
            else
            {
                return (uint8_t) 0u;
            }
        }
    }
    else
    {
        MemMngrHead *prevBlck = (MemMngrHead *) getAdjacentPrevBlck(
                (MemMngrHead *) ( *blckToMerge ) );

        if ( ( prevBlck == (MemMngrHead *) NULL ) || ( MEM_FLG_TAKENORCACHED(
                prevBlck ) ) )
        {
            return (uint8_t) 0u;
        }
        else
        {
            if ( MEM_FLG_GET_MEMSIZE((*blckToMerge)->flagsForMemBlock) == MEM_FLG_GET_MEMSIZE(
                    prevBlck->flagsForMemBlock ) )
            {
                prevBlck->nxtMemBlck = ( *blckToMerge )->nxtMemBlck;
                if ( prevBlck->nxtMemBlck != failMemIndex )
                {
                    memoryHEAPBASE[( *blckToMerge )->nxtMemBlck].prvMemBlck =
                            getIndex( prevBlck );
                }

                ( *blckToMerge ) = prevBlck;
                split = (BlckSize) ( split << (BlckSize) 0x1u );
                setBlckMemSize( ( *blckToMerge ), split );
                tmpBlck = getAdjacentNxtBlck( (MemMngrHead*) ( *blckToMerge ) );
                if ( tmpBlck != (MemMngrHead *) NULL )
                {

                    setPRVBlckMemSize( tmpBlck, split );
                }
                else
                {
                    return (uint8_t) 0u;
                }
            }
            else
            {
                return (uint8_t) 0u;
            }
        }
    }

    // evaluate if the block is an upper or a lower buddy and set flags accordingly
    if ( (uint32_t) ( *blckToMerge ) > (uint32_t) getBuddyBlck(
            (MemMngrHead*) ( *blckToMerge ) ) )
    {
        MEM_FLG_CLR_ISLOWER( ( *blckToMerge ) );
    }
    else
    {
        MEM_FLG_SET_ISLOWER( ( *blckToMerge ) );
    }
    return (uint8_t) 1u;
}

/** \fn static void reMergeMemBlck( MemMngrHead ** blckToMerge )
 *  \brief The given memory block is merged continuously with its buddy blocks as long as these are neither taken nor cached.
 *
 *  \param [in] blckToMerge     Pointer to a pointer to the block to be merged.
 *
 *  Using mergeMemBlck a Block is merged to its biggest possible size with is free and uncached buddies.
 */
static void reMergeMemBlck( MemMngrHead ** blckToMerge )
{
    while ( MEM_FLG_ISSPLIT( ( *blckToMerge )->flagsForMemBlock ) )
    {
        if ( !mergeMemBlck( blckToMerge ) )
            break;
    }
}

/** \fn static void splitMemBlck( MemMngrHead ** blckToSplit )
 *  \brief The given memory block is split into two equally sized buddies.
 *
 *  \param [in] blckToSplit     Pointer to a pointer to the block to be split.
 *
 *  The given block of memory is split in half. The flags of both blocks are adjusted accordingly.
 */
static void splitMemBlck( MemMngrHead ** const blckToSplit )
{
    const MemFlags split = (MemFlags) ( MEM_FLG_GET_MEMSIZE(
            ( ( *blckToSplit )->flagsForMemBlock ) )
                                        >> (uint8_t) 0x1u );
    MemMngrHead * const splitUpperHead =
            (MemMngrHead *) ( (uint32_t) ( *blckToSplit ) + (uint32_t) split );

    MemMngrHead * tmpBlck = getAdjacentNxtBlck(
            (MemMngrHead *) ( *blckToSplit ) );

    if ( tmpBlck != (MemMngrHead*) NULL )
    {
        setPRVBlckMemSize( tmpBlck, split );
    }

    splitUpperHead->nxtMemBlck = ( *blckToSplit )->nxtMemBlck;
    splitUpperHead->prvMemBlck = getIndex( *blckToSplit );
    if ( splitUpperHead->nxtMemBlck != failMemIndex )
    {
        memoryHEAPBASE[splitUpperHead->nxtMemBlck].prvMemBlck = getIndex(
                splitUpperHead );
    }
    ( *blckToSplit )->nxtMemBlck = getIndex( splitUpperHead );
    splitUpperHead->flagsForMemBlock = (MemFlags) 0x0u;
    splitUpperHead->additionalFlags = (MemFlags) 0x0u;
    setBlckMemSize( splitUpperHead, split );
    setPRVBlckMemSize( splitUpperHead, split );
    setBlckMemSize( ( *blckToSplit ), split );
    MEM_FLG_SET_ISLOWER( ( *blckToSplit ) );
}

/** \fn static void unMergeUnevenBlcks( MemMngrHead * const blckToUnMerge )
 *  \brief The given memory block is split into the unequal buddy blocks it consisted of.
 *
 *  \param [in] blckToUnMerge     Pointer to the block to be unmerged.
 *
 *  A block can be made up of unequally sized buddies.
 *  This function extracts these buddies and adds them back to the freeMemLst.
 *  Flags and sizes of the buddies and the preceding as well as succeeding blocks are adjusted automatically.
 */
static void unMergeUnevenBlcks( MemMngrHead * const blckToUnMerge )
{
    MemMngrHead *mrgdBlck;
    MemSize origBlckSize = (MemSize) 0x0u;
    MemSize smllrBlckSize = (MemSize) 0x0u;
    MemMngrHead * tmpBlck;

    while ( MEM_FLG_ISCOMBO( blckToUnMerge->flagsForMemBlock ) )
    {
        smllrBlckSize = MEM_FLG_SMALLER_COMBO(
                ( blckToUnMerge )->flagsForMemBlock );
        origBlckSize = (MemSize) ( MEM_FLG_GET_MEMSIZE(
                ( blckToUnMerge )->flagsForMemBlock )
                                   & (MemSize) ( ~smllrBlckSize ) );

        mrgdBlck = (MemMngrHead*) ( (uint32_t) ( blckToUnMerge )
                + (uint32_t) ( origBlckSize ) );

        mrgdBlck->flagsForMemBlock = (MemFlags) 0x0u;
        mrgdBlck->additionalFlags = (MemFlags) 0x0u;
        setBlckMemSize( ( mrgdBlck ), smllrBlckSize );
        tmpBlck = getAdjacentNxtBlck( (MemMngrHead*) mrgdBlck );
        if ( tmpBlck != (MemMngrHead *) NULL )
        {
            setPRVBlckMemSize( tmpBlck, smllrBlckSize );
        }
        setPRVBlckMemSize( mrgdBlck, (MemSize) ( origBlckSize ) );

        if ( (uint32_t) ( mrgdBlck ) > (uint32_t) getBuddyBlck(
                (MemMngrHead*) ( mrgdBlck ) ) )
        {
            MEM_FLG_CLR_ISLOWER( ( mrgdBlck ) );
        }
        else
        {
            MEM_FLG_SET_ISLOWER( ( mrgdBlck ) );
        }
        // The extracted block is sure to be free now, thus put it back into the free list
        MEM_FLG_CLR_TAKEN( mrgdBlck );
        setPRVBlckMemSize( mrgdBlck, ( origBlckSize ) );
        fitBlckBackIntoFreeLst( mrgdBlck );
        // if its size is smaller than BIGGEST_BLCK we can tell that it must be split, thus we have to remerge it to its best buddy size
        if ( smllrBlckSize < BIGGEST_BLCK )
            reMergeMemBlck( &mrgdBlck );

        setBlckMemSize( ( blckToUnMerge ), (MemSize) ( origBlckSize ) );
    }
}

/** \fn static void mergeUnevenBlocks( MemMngrHead* const basis, MemMngrHead* const added )
 *  \brief The two given memory blocks of unequal size are merged into one memory block.
 *
 *  \param [in] basis       Pointer to the block to be merged and used as the pointer to the combined memory.
 *  \param [in] added       Pointer to the block to be merged with the basis.
 *
 *  Two blocks of unequal size are merged to make up a new extraordinary sized block.
 *  Usually blocks are either split equally or merged with buddies (of the same size so to speak).
 *  In order to ease the impact of internal fragmentation, a block can be merged with only parts of its buddy.
 *  Flags and sizes of the buddies and the preceding as well as succeeding blocks are adjusted automatically.
 *
 *  Example:
 *
 *  Requested size:         0xC4<br>
 *  Next bigger block:      0x100<br>
 *  Next smaller block:     0x80<br>
 *  Loss:                   0x20<br>
 *
 *  Therefore split bigger block ( to 0x80) and add the remaining need from its ( again split) buddy (0x40).
 *  If the size is insufficient the process can be repeated. Again add a split buddy (0x10) to suffice the need best fitting (0xD0)
 *
 *  Requested size:         0xC4<br>
 *  Next bigger block:      0x100<br>
 *  Split once:             0x80<br>
 *  Remainder:              0x44<br>
 *  Split buddy:            0x40<br>
 *  Remainder:              0x4<br>
 *  Split buddy best fit:   0x10<br>
 *  Combined size:          0xD0<br>
 *  Loss:                   0xC<br>
 *  SAVED:                  0x14<br>
 *
 */
static void mergeUnevenBlocks(
                               MemMngrHead* const basis,
                               MemMngrHead* const added )
{
    const MemSize newSize = (MemSize) (
    MEM_FLG_GET_MEMSIZE(basis->flagsForMemBlock) + MEM_FLG_GET_MEMSIZE(
            added->flagsForMemBlock ) );
    if ( getAdjacentNxtBlck( added ) != (MemMngrHead *) NULL )
    {
        setPRVBlckMemSize( &memoryHEAPBASE[added->nxtMemBlck], newSize );
        //MEM_FLG_SET_PREVTAKEN( added->ptrNXT );
        memoryHEAPBASE[added->nxtMemBlck].prvMemBlck = getIndex( basis );
    }
    basis->nxtMemBlck = added->nxtMemBlck;
    if ( MEM_FLG_GET_MEMSIZE(
            added->flagsForMemBlock )
         > MEM_FLG_GET_MEMSIZE( basis->flagsForMemBlock ) )
        MEM_FLG_SET_BGGRMRGD( basis );

    setBlckMemSize( basis, newSize );
}

/** \fn static void shrinkCacheFIFO( void  )
 *  \brief Remove the last element out of the cache.
 *
 *  Simply removes the last element of the objCache and sets the new list end accordingly.
 */
static void shrinkCacheFIFO( void )
{
    if ( cacheSize != (uint8_t) 0x0u )
    {
        if ( objCacheEnd == (MemMngrHead*) NULL )
        {
            BREAK();
        }
        MemMngrHead * prvEndNode;
        if ( objCacheEnd->prvMemBlck == failMemIndex )
        {
            /*
             * There is no previous element to the end of the cache
             * thus the end is also the start.
             *
             * set the objCache and prvEndNode to NULL
             */
            objCache = (MemMngrHead *) NULL;
            prvEndNode = (MemMngrHead *) NULL;
        }
        else
        {
            /*
             * There is an element prior to the last element
             *
             * set prvEndNode to point to said element
             */
            prvEndNode = &memoryHEAPBASE[objCacheEnd->prvMemBlck];    // node before the end of the list
        }

        MEM_FLG_CLR_CACHED( objCacheEnd );
        // fully free the cached block, adding it back to the free mem block list
        rFullyFree( (MemMngrHead *) objCacheEnd );
        // assign element prior to the current end as new object cache list end
        objCacheEnd = prvEndNode;
        --cacheSize;
    }
}

/** \fn static void addBlckToCache( MemMngrHead * const blckToAdd )
 *  \brief Add the given block to the objCache.
 *
 *  \param [in]     blckToAdd       Pointer to the block to add to the cache.
 *
 *  Adds the given block to the beginning of the objCache.
 *  Check if the object is not already cached to avoid a loop in the cache!
 *  Also check the cacheSize and shrink the cache if it is bigger than the specified CACHE_SIZE.
 */
static void addBlckToCache( MemMngrHead * const blckToAdd )
{
    if ( ( MEM_FLG_ISCACHED( blckToAdd->additionalFlags ) ) )
    {
        // The provided MemMngrHead is already cached... return
        BREAK();
        return;
    }

    /*
     * Cases:
     *      There is no cache yet
     *      There is only one element in the cache, thus objCache and objCacheEnd are the same.
     *
     */
    if ( (uint32_t) objCache == (uint32_t) NULL )
    {
        /*
         * if there is no cache yet, create a new cache
         */
        blckToAdd->nxtMemBlck = failMemIndex;
        objCacheEnd = blckToAdd;
    }
    else
    {
        blckToAdd->nxtMemBlck = getIndex( objCache );
    }

    blckToAdd->prvMemBlck = failMemIndex;
    objCache = blckToAdd;

    MEM_FLG_SET_CACHED( blckToAdd );

    if ( ++cacheSize > CACHE_SIZE )
    {
        shrinkCacheFIFO();
    }
}

static MemMngrHead *findBestFitInCache( register MemSize requestedSlabSize )
{
    if ( (uint32_t) objCache != (uint32_t) NULL )
    {
        /*
         * adjust the size to fit the smallest block size,
         * since no elements smaller than that size can be allocated
         */
        if ( requestedSlabSize & (MemSize) SMALLER_BLCK_MSK )
        {
            /*
             * Mask out any bits smaller than smallest block size
             * and then add the smallest block size to the result
             * to ensure no memory smaller than the smallest block size
             * is requested
             */
            requestedSlabSize &= (MemSize) ( ~SMALLER_BLCK_MSK );
            requestedSlabSize = (MemSize) ( requestedSlabSize + SMALLEST_BLCK );
        }

        MemMngrHead *curBlckCche = objCache;

        /*
         * traverse objCache until a matching mem block is found
         * if there is no matching mem block in the cache, return NULL
         */
        while ( ( MEM_FLG_GET_MEMSIZE( curBlckCche->flagsForMemBlock )
                != requestedSlabSize ) )
        {
            if ( curBlckCche->nxtMemBlck == failMemIndex )
            {
                // No matching mem block found in cache, return NULL
                return (MemMngrHead *) NULL;
            }
            //advance one mem block in the cache list
            curBlckCche = &memoryHEAPBASE[curBlckCche->nxtMemBlck];
        }
        // matching mem block found in cache
        // remove cached flag and decrement cacheSize
        // remove mem block from cache
        MEM_FLG_CLR_CACHED( curBlckCche );

        --cacheSize;

        /*
         * store indices of previous and next block for faster access
         */
        const MemIndex prvBlockIndex = curBlckCche->prvMemBlck;
        const MemIndex nxtBlockIndex = curBlckCche->nxtMemBlck;

        /*
         * special cases to consider:
         *      Mem block is the start of the list
         *          adjust objCache
         *      Mem block is the end of the list
         *          adjust objCacheEnd
         */
        if ( prvBlockIndex != failMemIndex )
        {
            /*
             * mem block is not the start of the list
             * since it has an index of a previous element stored
             */
            memoryHEAPBASE[prvBlockIndex].nxtMemBlck = nxtBlockIndex;
            if ( nxtBlockIndex == failMemIndex )
            {
                /*
                 * mem block is the end of the list
                 * since it has no index of a next element stored
                 */
                objCacheEnd = &memoryHEAPBASE[prvBlockIndex];
            }
            else
            {
                /*
                 * mem block is not the end of the list
                 * since it is also not the start
                 */
                memoryHEAPBASE[nxtBlockIndex].prvMemBlck = prvBlockIndex;
            }
        }
        else
        {
            /*
             * mem block has no predecessor which means it is the start of the list
             * adjust objCache
             * special case, there is no next mem block, therefore adjust objCacheEnd as well.
             */
            if ( nxtBlockIndex == failMemIndex )
            {
                objCache = (MemMngrHead*) NULL;
                objCacheEnd = (MemMngrHead*) NULL;
            }
            else
            {
                objCache = &memoryHEAPBASE[nxtBlockIndex];
            }
        }
        return curBlckCche;
    }
    return (MemMngrHead *) NULL;
}

static MemMngrHead *findBestFitFree(
                                     MemMngrHead **strtToLookFor,
                                     const MemSize neededSize )
{
    MemMngrHead * bestFitMemBlck = (MemMngrHead *) NULL;
    MemMngrHead * memLstTempElem = *strtToLookFor;
    MemSize curBestFitSize = (MemSize) 0xFFFFu;

    if ( memLstTempElem == (MemMngrHead *) NULL )
        return (MemMngrHead *) NULL;

    /*
     *  search for a memory block in the free list to find a suitably sized block of memory
     */
    do
    {
        // does the block satisfy the needed size?
        if ( neededSize <= MEM_FLG_GET_MEMSIZE(
                memLstTempElem->flagsForMemBlock ) )
        {
            // is the block smaller than the most suitable block found beforehand?
            if ( curBestFitSize > MEM_FLG_GET_MEMSIZE(
                    memLstTempElem->flagsForMemBlock ) )
            {
                curBestFitSize = MEM_FLG_GET_MEMSIZE(
                        memLstTempElem->flagsForMemBlock );
                bestFitMemBlck = memLstTempElem;
            }
        }

        memLstTempElem = &memoryHEAPBASE[memLstTempElem->nxtMemBlck];    // advance in the list
        // check if somehow the block is no longer in the range of the heap
        if ( ( (uint32_t) memLstTempElem < (uint32_t) ( &__HeapBase ) ) || ( (uint32_t) memLstTempElem
                > (uint32_t) ( &__HeapLimit ) ) )
            break;
    } while ( memLstTempElem != (MemMngrHead *) NULL );

// no suitable block found... return NULL
    if ( bestFitMemBlck == (MemMngrHead *) NULL )
        return (MemMngrHead *) NULL;

//split the found mem block until the smallest chunk is to satisfy the needs is acquired
    while ( neededSize <= (MemSize) ( MEM_FLG_GET_MEMSIZE(
            bestFitMemBlck->flagsForMemBlock )
                                      >> (MemSize) 0x1u ) )
    {
        splitMemBlck( &bestFitMemBlck );
        if ( MEM_FLG_GET_MEMSIZE(bestFitMemBlck->flagsForMemBlock) == SMALLEST_BLCK )
            break;
    }
// IF THE NEEDED SIZE DOES NOT SATISFY THE NEEDS CLOSE ENOUGH, SPLIT THE BLOCK ONCE MORE AND COMBINE THE RESULT WITH A SPLIT RESULT OF THE NXT BLOCK
    if ( ( MEM_FLG_GET_MEMSIZE(
            bestFitMemBlck->flagsForMemBlock )
           > neededSize )
         && ( (MemSize) (
         MEM_FLG_GET_MEMSIZE( bestFitMemBlck->flagsForMemBlock ) - neededSize )
              > SMALLEST_BLCK ) )
    {
        splitMemBlck( &bestFitMemBlck );

        while ( ( MEM_FLG_GET_MEMSIZE(
                bestFitMemBlck->flagsForMemBlock )
                  < neededSize ) )
        {
            MemMngrHead * additionalBlck = (MemMngrHead *) getAdjacentNxtBlck(
                    (MemMngrHead *) bestFitMemBlck );

            MemSize addedNeededSize = (MemSize) ( neededSize
                    - MEM_FLG_GET_MEMSIZE( bestFitMemBlck->flagsForMemBlock ) );

            // Split the additional block until it is best fitting for the addedNeededSize
            while ( addedNeededSize <= (MemSize) ( MEM_FLG_GET_MEMSIZE(
                    additionalBlck->flagsForMemBlock )
                                                   >> (MemSize) 0x1u ) )
            {
                if ( MEM_FLG_GET_MEMSIZE(additionalBlck->flagsForMemBlock) == SMALLEST_BLCK )
                    break;
                splitMemBlck( &additionalBlck );
            }

            // can the additional block be split once more?
            if ( ( neededSize > ( MEM_FLG_GET_MEMSIZE(
                    bestFitMemBlck->flagsForMemBlock )
                                  + ( MEM_FLG_GET_MEMSIZE(
                                          additionalBlck->flagsForMemBlock )
                                      >> (MemSize) 0x1u ) ) )
                 && ( ( MEM_FLG_GET_MEMSIZE(additionalBlck->flagsForMemBlock) >> (MemSize) 0x1u ) > SMALLEST_BLCK ) )
            {
                splitMemBlck( &additionalBlck );
                mergeUnevenBlocks( bestFitMemBlck, additionalBlck );
            }
            else
            {
                mergeUnevenBlocks( bestFitMemBlck, additionalBlck );
                break;
            }
        }
    }
    return bestFitMemBlck;
}

//UNTESTED!
static void cpyMemBlock( MemMngrHead * const dest, MemMngrHead * const src )
{
    const MemSize sizeToCpy = MEM_FLG_GET_MEMSIZE( src->flagsForMemBlock );
    MemSize cntr = sizeof(uint32_t);

    if ( ( dest == (MemMngrHead *) NULL ) || ( src == (MemMngrHead *) NULL ) )
        return;

    while ( cntr <= sizeToCpy )
    {
        *( (MemMngrHead *) ( (uint32_t) dest + (uint32_t) cntr ) ) =
                *( (MemMngrHead *) ( (uint32_t) src + (uint32_t) cntr ) );
        cntr++;
    }
}

void * rMalloc( const MemSize desiredSize )
{
//needed size consists of desiredSize and the size needed for maintenance
    MemSize neededSize =
            (MemSize) ( desiredSize + (MemSize) sizeof(MemBlckHead) );
    neededSize = ( neededSize < SMALLEST_BLCK ) ? SMALLEST_BLCK : neededSize;
    MemMngrHead *tmp = findBestFitInCache( neededSize );
    if ( (uint32_t) tmp == (uint32_t) NULL )
    {
        tmp = findBestFitFree( &freeMemLst, neededSize );
        while ( ( (uint32_t) tmp == (uint32_t) NULL ) && ( (uint32_t) objCache
                != (uint32_t) NULL ) )
        {
            shrinkCacheFIFO();
            tmp = findBestFitFree( &freeMemLst, neededSize );
        }

        if ( (uint32_t) tmp == (uint32_t) NULL )
            BREAK();        //return tmp;

        delMemBlck( tmp );
    }

    MEM_FLG_SET_TAKEN( tmp );

    return MEM_MNGR_GET_PTRTOMEM( tmp );
}

void * rCalloc( const MemSize desiredSize )
{
    stdPtr* tmp = rMalloc( desiredSize );
    stdPtr* tmp2;
    MemSize cnt = desiredSize;
    while ( --cnt )
    {
        tmp2 = (stdPtr) ( (uint32_t) tmp + (uint32_t) cnt );
        *tmp2 = (uint8_t) 0x0u;
    }
    return (void *) tmp;
}

void * rRealloc( void * const ptrToExistingMem, const MemSize desiredSize )
{
    if ( ptrToExistingMem == NULL )
    {
        return malloc( desiredSize );
    }
    else
    {
        //needed size consists of desiredSize and the size needed for maintenance
        MemSize neededSize = (MemSize) ( desiredSize
                + (MemSize) sizeof(MemBlckHead) );
        neededSize =
                ( neededSize < SMALLEST_BLCK ) ? SMALLEST_BLCK : neededSize;

        MemMngrHead * tmp = MEM_MNGR_GET_MEMMNGRHEAD( ptrToExistingMem );
        MemMngrHead * tmpNxt;
        while ( MEM_FLG_GET_MEMSIZE(tmp->flagsForMemBlock) < neededSize )
        {
            tmpNxt = (MemMngrHead *) getAdjacentNxtBlck( (MemMngrHead *) tmp );

            if ( MEM_FLG_TAKENORCACHED( tmpNxt ) )
                break;

            delMemBlck( tmpNxt );

            setBlckMemSize(
                    tmp,
                    (MemSize) ( MEM_FLG_GET_MEMSIZE( tmp->flagsForMemBlock )
                            + MEM_FLG_GET_MEMSIZE( tmpNxt->flagsForMemBlock ) ) );
            setPRVBlckMemSize(
                    tmpNxt, MEM_FLG_GET_MEMSIZE( tmp->flagsForMemBlock ) );
        }
        if ( MEM_FLG_GET_MEMSIZE(tmp->flagsForMemBlock) < neededSize )
        {
            MemMngrHead * tmp2 = malloc( desiredSize );
            cpyMemBlock( (MemMngrHead*) tmp2, (MemMngrHead*) tmp );
            rFullyFree( tmp );
            tmp = tmp2;
        }

        return MEM_MNGR_GET_PTRTOMEM( tmp );
    }
}

// NORMAL FREE, KEEPS OBJECT IN CACHE
void rFree( void * const pToBeFreed )
{
    if ( (uint32_t) pToBeFreed == (uint32_t) NULL )
        BREAK();        //return;

    MemMngrHead * const tmp = (MemMngrHead *) MEM_MNGR_GET_MEMMNGRHEAD(
            pToBeFreed );

    if ( !( MEM_FLG_ISTAKEN( tmp->flagsForMemBlock ) ) )
        BREAK();        //return;

    MEM_FLG_CLR_TAKEN( tmp );
    addBlckToCache( tmp );
}

// THIS FREE FUNCTION ADDS THE BLOCK BACK TO THE FREE BLOCKS LIST
void rFullyFree( MemMngrHead * blckToFullyFree )
{
    MEM_FLG_CLR_TAKEN( blckToFullyFree );

    if ( MEM_FLG_ISCOMBO( blckToFullyFree->flagsForMemBlock ) )
    {
        unMergeUnevenBlcks( blckToFullyFree );
    }

    fitBlckBackIntoFreeLst( blckToFullyFree );

    if ( MEM_FLG_ISSPLIT( blckToFullyFree->flagsForMemBlock ) )
    {
        reMergeMemBlck( &blckToFullyFree );
    }
}

RetCode memMngr_CreateMemPool(
                               const MemSize sizeOfElements,
                               const uint8_t elements,
                               MemPoolID * const memPoolID )
{
    MemMngrHead *curMemBlock;
    MemMngrHead *nxtMemBlock;
    uint8_t elementCntr = elements;

    if ( memPoolsInUse == (uint32_t) 0xFFFFFFFFu )
        return RET_NOK;

// retrieve the bit position of the rightmost 0 bit
    *memPoolID = bitM_bitPos(
            ~memPoolsInUse & ( memPoolsInUse + (uint32_t) 0x1u ) );

// // for array indexing
// ( *memPoolID )--;
    curMemBlock = rMalloc( sizeOfElements );
    if ( (uint32_t) curMemBlock == (uint32_t) NULL )
        return RET_NOK;

    curMemBlock = MEM_MNGR_GET_MEMMNGRHEAD( curMemBlock );
// set the starting point for the memory pool
    memPools[*memPoolID] = curMemBlock;
    curMemBlock->prvMemBlck = failMemIndex;
    elementCntr--;
    while ( elementCntr-- )
    {
        nxtMemBlock = (MemMngrHead *) rMalloc( sizeOfElements );
        if ( (uint32_t) ( nxtMemBlock ) != (uint32_t) NULL )
        {
            nxtMemBlock = MEM_MNGR_GET_MEMMNGRHEAD( nxtMemBlock );
            nxtMemBlock->prvMemBlck = getIndex( curMemBlock );
            curMemBlock->nxtMemBlck = getIndex( nxtMemBlock );
            curMemBlock = nxtMemBlock;
        }
        else
        {
            // ERROR
            BREAK();
            return RET_NOK;
        }
    }

    curMemBlock->nxtMemBlck = failMemIndex;
    memPoolsInUse |= (uint32_t) 0x1u << *memPoolID;
    return RET_OK;
}

RetCode memMngr_DeleteMemPool( const MemPoolID memPoolID )
{
    //ToDO
    return RET_NOK;
}

RetCode memMngr_MemPoolMalloc( void ** ptrToMem, const MemPoolID memPoolID )
{
    MemMngrHead *memBlck = memPools[memPoolID];
    if ( (uint32_t) memBlck != (uint32_t) NULL )
    {
        if ( ( memBlck->nxtMemBlck ) != failMemIndex )
        {
            memPools[memPoolID] = &memoryHEAPBASE[memBlck->nxtMemBlck];
            memPools[memPoolID]->prvMemBlck = failMemIndex;
        }
        else
        {
            memPools[memPoolID] = (MemMngrHead *) NULL;
        }
        *ptrToMem = MEM_MNGR_GET_PTRTOMEM( memBlck );
        return RET_OK;
    }
    BREAK();
    return RET_NOK;
}

RetCode memMngr_MemPoolFree( void * ptrToMem, const MemPoolID memPoolID )
{
    if ( (uint32_t) ptrToMem == (uint32_t) NULL )
        return RET_NOK;

    MemMngrHead *memBlck = MEM_MNGR_GET_MEMMNGRHEAD( ptrToMem );
    if ( (uint32_t) memPools[memPoolID] != (uint32_t) NULL )
    {
        memPools[memPoolID]->prvMemBlck = getIndex( memBlck );
        memBlck->nxtMemBlck = getIndex( memPools[memPoolID] );
        memBlck->prvMemBlck = failMemIndex;
        memPools[memPoolID] = memBlck;
    }
    else
    {
        memPools[memPoolID] = memBlck;
        memBlck->nxtMemBlck = failMemIndex;
        memBlck->prvMemBlck = failMemIndex;
    }
    return RET_OK;
}
