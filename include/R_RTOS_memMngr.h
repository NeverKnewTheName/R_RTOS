/**
 * \file    R_RTOS_memMngr.h
 * \author  Christian Neuberger (NeubergerCh50344@th-nuernberg.de)
 * \date    18.12.2015
 *
 * \addtogroup mem Memory Management
 * \{
 * \addtogroup bestBuddyAlloc Modified Best Buddy Memory Allocator
 * \{
 * \brief Modified Best Buddy Memory Allocator.
 *
 *  Modified -> Can use adjacent blocks to fit memory needs -> reduce internal fragmentation
 *
 *  Object Cache -> Objects are put into an object cache upon freeing them -> alleviates frequent allocations of same-size objects
 */

#ifndef HEADERS_R_RTOS_MEMMNGR_H_
#define HEADERS_R_RTOS_MEMMNGR_H_
#include "R_RTOS_inc.h"
#include <stdint.h>

/** \def malloc
 *  \brief Redefine malloc to rMalloc in order not to have to alter the already existing code.
 */
#define malloc      rMalloc
/** \def calloc
 *  \brief Redefine calloc to rCalloc in order not to have to alter the already existing code.
 */
#define calloc      rCalloc
/** \def realloc
 *  \brief Redefine realloc to rRealloc in order not to have to alter the already existing code.
 */
#define realloc     rRealloc
/** \def free
 *  \brief Redefine free to rFree in order not to have to alter the already existing code.
 */
#define free        rFree

/* MEMORY_MANAGEMENT */
/** \typedef BlckSize
 *  \brief  Size of a block of memory.
 */
typedef uint16_t BlckSize;


/** \def BIGGEST_BLCK
 *  \brief Size of the biggest possible buddy.
 *
 *  Restricted by the usage of flags.
 */
#define BIGGEST_BLCK    ((BlckSize)0x100u)//256  Byte

/** \def BIGGEST_BLCK_MSK
 *  \brief Mask for blocks bigger than BIGGER_BLCK.
 *
 *  Restricted by the maximum size of the MemMngrHead.
 */
#define BIGGEST_BLCK_MSK ((BlckSize)(BIGGEST_BLCK - (BlckSize)1u))

/** \def SMALLEST_BLCK
 *  \brief Size of the smallest possible buddy.
 *
 *  Restricted by the minimum size of the MemMngrHead.
 *  \note Has to be a power of two.
 *  \note Has to be at least the size of a MemMngrHead struct.
 */
#define SMALLEST_BLCK   ((BlckSize)0x8u) //8    Byte

/** \def SMALLER_BLCK_MSK
 *  \brief Mask for blocks smaller than SMALLEST_BLCK.
 *
 *  Restricted by the minimum size of the MemMngrHead.
 */
#define SMALLER_BLCK_MSK ((BlckSize)(SMALLEST_BLCK - (BlckSize)1u))

/** \def SMALLER_BLCK_DIVISOR
 *  \brief Bit shifts needed for a division through SMALLEST_BLCK.
 *
 *  \note log2(SMALLEST_BLCK).
 */
#define SMALLER_BLCK_DIVISOR (MemIndex)(0x3u)

/** \def CACHE_SIZE
 *  \brief Size of the object cache.
 *
 *  When an object is freed it is not directly inserted back into the free list.
 *  It is rather held in the object cache until the cache is full.
 *  FIFO principle is applied.
 */
#define CACHE_SIZE      ((uint8_t)0x10u)  // 16 Cache slots

/** \typedef MemPoolID
 *  \brief  8Bit ID value of a memory pool.
 */
typedef uint8_t MemPoolID;

/** \typedef MemFlags
 *  \brief  16Bit flag value.
 */
typedef uint16_t MemFlags;

/** \typedef stdPtr
 *  \brief  Simple void pointer.
 *
 *  Might be deprecated.
 */
typedef void *stdPtr;

/** \typedef MemIndex
 *  \brief Used for indexing memory blocks.
 */
typedef uint16_t MemIndex;

/* MEM BLCK FLAGS - flagsForMemBlock
 * ------------------------
 * |   BIT  -   Purpose   |
 * |----------------------|
 * |    0   -   IsTaken   |
 * |    1   -   IsLower   |
 * |    2   -   4 Byte    |  - SMALLEST BLCK
 * |    3   -   8 Byte    |
 * |    4   -   16 Byte   |
 * |    5   -   32 Byte   |
 * |    6   -   64 Byte   |
 * |    7   -   128 Byte  |
 * |    8   -   256 Byte  |  - BIGGEST BLCK
 * |    9   -   512 Byte  |
 * |    10  -   1024 Byte |
 * |    11  -   2048 Byte |
 * |    12  -   SPLIT     |
 * |    13  -   MERGED    |
 * |    14  -   PrevTaken |
 * |    15  -   NxtTaken  |
 * ------------------------
 *
 * MEM BLCK FLAGS - additionalFlags
 * ------------------------
 * |   BIT  -   Purpose   |
 * |----------------------|
 * |    0   -   IsBlckBeg |
 * |    1   -   IsBlckLast|
 * |    2   -   PRV 4 B   |  - SMALLEST BLCK
 * |    3   -   PRV 8 B   |
 * |    4   -   PRV 16 B  |
 * |    5   -   PRV 32 B  |
 * |    6   -   PRV 64 B  |
 * |    7   -   PRV 128 B |
 * |    8   -   PRV 256 B |  - BIGGEST BLCK
 * |    9   -   PRV 512 B |
 * |    10  -   PRV 1024 B|
 * |    11  -   PRV 2048 B|
 * |    12  -   nxtSplit  |
 * |    13  -   prevSplit |
 * |    14  -   bggrMrgd  |
 * |    15  -   CACHED    |
 * ------------------------
 */

/** \struct memMngrHead
 *  \brief Contains the full information about the memory block.
 *
 *  Used to handle a buddy block of memory. Pointers are used for fast traversal, insertion and deletion of nodes.
 *
 */

/** \typedef MemMngrHead
 *  \brief memMngrHead
 */
typedef struct memMngrHead
{
    /** \var flagsForMemBlock
     *
     *    BIT  |   Name         |   Purpose
     *  :-----:| :-----------:  | :----------
     *     0   |   IsTaken      |   Indicates that the block is either still available or already taken
     *     1   |   IsLower      |   Indicates that the block is the lower buddy
     *     2   |   4 Byte       |   Indicates size of the block
     *     3   |   8 Byte       |   Indicates size of the block
     *     4   |   16 Byte      |   Indicates size of the block
     *     5   |   32 Byte      |   Indicates size of the block
     *     6   |   64 Byte      |   Indicates size of the block
     *     7   |   128 Byte     |   Indicates size of the block
     *     8   |   256 Byte     |   Indicates size of the block
     *     9   |   512 Byte     |   Indicates size of the block
     *     10  |   1024 Byte    |   Indicates size of the block
     *     11  |   2048 Byte    |   Indicates size of the block
     *     12  |   SPLIT        |   Indicates that the block is split into buddies
     *     13  |   MERGED       |   Indicates that the block is merged into a block bigger than BIGGEST_BLCK
     *     14  |   PrevTaken    |   Indicates that the adjacent previous block is either still available or already taken
     *     15  |   NxtTaken     |   Indicates that the adjacent next block is either still available or already taken
     */
    MemFlags flagsForMemBlock;    //!< Contains the most important flags for handling this block of memory
    /** \var additionalFlags
     *
     *    BIT  |   Name         |   Purpose
     *  :-----:| :-----------:  | :----------
     *     0   |   IsBlckBeg    |   Indicates that the block is at the beginning of a BIGGEST_BLCK buddy
     *     1   |   IsBlckLast   |   Indicates that the block is the last block in the list
     *     2   |   PRV 4 B      |   Indicates the size of the adjacent previous block
     *     3   |   PRV 8 B      |   Indicates the size of the adjacent previous block
     *     4   |   PRV 16 B     |   Indicates the size of the adjacent previous block
     *     5   |   PRV 32 B     |   Indicates the size of the adjacent previous block
     *     6   |   PRV 64 B     |   Indicates the size of the adjacent previous block
     *     7   |   PRV 128 B    |   Indicates the size of the adjacent previous block
     *     8   |   PRV 256 B    |   Indicates the size of the adjacent previous block
     *     9   |   PRV 512 B    |   Indicates the size of the adjacent previous block
     *     10  |   PRV 1024 B   |   Indicates the size of the adjacent previous block
     *     11  |   PRV 2048 B   |   Indicates the size of the adjacent previous block
     *     12  |   nxtSplit     |   Indicates that the adjacent next block is split
     *     13  |   prevSplit    |   Indicates that the adjacent previous block is split
     *     14  |   bggrMrgd     |   deprecated
     *     15  |   Cached       |   Memory Block is in the object cache
     */
    MemFlags additionalFlags;    //!< Contains flags for handling neighbors of this buddy block
    MemIndex nxtMemBlck;    //!< index of the next memory block
    MemIndex prvMemBlck;    //!< index of the previous memory block
//    struct memMngrHead *ptrNXT;     //!< Pointer to next free MemMngrHead
//    struct memMngrHead *ptrPREV;    //!< Pointer to previous free MemMngrHead
} MemMngrHead;

/** \struct memBlckhead
 *  \brief Contains the only the flag information about the memory block.
 *
 *  Used to keep track of a block of memory and its status.
 *
 *  Almost the same as MemMngrHead, but stripped of the pointers. Thus the two structs are interchangeable regarding the use of their flags.
 *
 */

/** \typedef MemBlckHead
 *  \brief memBlckhead
 */
typedef struct memBlckhead
{
    /** \var flagsForMemBlock
     *
     *    BIT  |   Name         |   Purpose
     *  :-----:| :-----------:  | :----------
     *     0   |   IsTaken      |   Indicates that the block is either still available or already taken
     *     1   |   IsLower      |   Indicates that the block is the lower buddy
     *     2   |   4 Byte       |   Indicates size of the block
     *     3   |   8 Byte       |   Indicates size of the block
     *     4   |   16 Byte      |   Indicates size of the block
     *     5   |   32 Byte      |   Indicates size of the block
     *     6   |   64 Byte      |   Indicates size of the block
     *     7   |   128 Byte     |   Indicates size of the block
     *     8   |   256 Byte     |   Indicates size of the block
     *     9   |   512 Byte     |   Indicates size of the block
     *     10  |   1024 Byte    |   Indicates size of the block
     *     11  |   2048 Byte    |   Indicates size of the block
     *     12  |   SPLIT        |   Indicates that the block is split into buddies
     *     13  |   MERGED       |   Indicates that the block is merged into a block bigger than BIGGEST_BLCK
     *     14  |   PrevTaken    |   Indicates that the adjacent previous block is either still available or already taken
     *     15  |   NxtTaken     |   Indicates that the adjacent next block is either still available or already taken
     */
    MemFlags flagsForMemBlock;    //!< Contains the most important flags for handling this block of memory
    /** \var additionalFlags
     *
     *    BIT  |   Name         |   Purpose
     *  :-----:| :-----------:  | :----------
     *     0   |   IsBlckBeg    |   Indicates that the block is at the beginning of a BIGGEST_BLCK buddy
     *     1   |   IsBlckLast   |   Indicates that the block is the last block in the list
     *     2   |   PRV 4 B      |   Indicates the size of the adjacent previous block
     *     3   |   PRV 8 B      |   Indicates the size of the adjacent previous block
     *     4   |   PRV 16 B     |   Indicates the size of the adjacent previous block
     *     5   |   PRV 32 B     |   Indicates the size of the adjacent previous block
     *     6   |   PRV 64 B     |   Indicates the size of the adjacent previous block
     *     7   |   PRV 128 B    |   Indicates the size of the adjacent previous block
     *     8   |   PRV 256 B    |   Indicates the size of the adjacent previous block
     *     9   |   PRV 512 B    |   Indicates the size of the adjacent previous block
     *     10  |   PRV 1024 B   |   Indicates the size of the adjacent previous block
     *     11  |   PRV 2048 B   |   Indicates the size of the adjacent previous block
     *     12  |   nxtSplit     |   Indicates that the adjacent next block is split
     *     13  |   prevSplit    |   Indicates that the adjacent previous block is split
     *     14  |   bggrMrgd     |   deprecated
     *     15  |   Cached       |   Memory Block is in the object cache
     */
    MemFlags additionalFlags;    //!< Contains flags for handling neighbors of this buddy block
} MemBlckHead;

#define MEM_MNGR_GET_MEMMNGRHEAD(pointer)               ((MemMngrHead *)( (uint32_t) pointer - (uint32_t) sizeof(MemBlckHead)))
#define MEM_MNGR_GET_PTRTOMEM(memMngrPtr)               ((void *) ((uint32_t) memMngrPtr + (uint32_t) sizeof(MemBlckHead)))

//PARSE FLAGS
#define MEM_FLG_PARSE(memFlgs,shft)                         ((MemFlags)((MemFlags)(memFlgs >> (MemFlags)shft) & (MemFlags)0x1u))
#define MEM_FLG_GET_BIT_MSK(bit)                            ((MemFlags)((MemFlags)0x1u << (MemFlags)bit))
#define MEM_FLG_GET_STRUC_PFIELD(struc,field)               ((struc)->field)
#define MEM_FLG_SET_BIT(pMemMngrHead, bit, whichFlags)      MEM_FLG_GET_STRUC_PFIELD(pMemMngrHead, whichFlags) |= MEM_FLG_GET_BIT_MSK(bit)
#define MEM_FLG_CLR_BIT(pMemMngrHead, bit, whichFlags)      MEM_FLG_GET_STRUC_PFIELD(pMemMngrHead, whichFlags) &= ((MemFlags)(~MEM_FLG_GET_BIT_MSK(bit)))
#define MEM_FLG_SET_BIT_MSK(pMemMngrHead, msk, whichFlags)  MEM_FLG_GET_STRUC_PFIELD(pMemMngrHead, whichFlags) |= (MemFlags)msk
#define MEM_FLG_CLR_BIT_MSK(pMemMngrHead, msk, whichFlags)  MEM_FLG_GET_STRUC_PFIELD(pMemMngrHead, whichFlags) &= ((MemFlags)(~((MemFlags)msk)))

/* MEM BLCK FLAGS - flagsForMemBlock
 * ------------------------
 * |   BIT  -   Purpose   |
 * |----------------------|
 * |    0   -   IsTaken   |
 * |    1   -   IsLower   |
 * |    2   -   4 Byte    |  - SMALLEST BLCK
 * |    3   -   8 Byte    |
 * |    4   -   16 Byte   |
 * |    5   -   32 Byte   |
 * |    6   -   64 Byte   |
 * |    7   -   128 Byte  |
 * |    8   -   256 Byte  |  - BIGGEST BLCK
 * |    9   -   512 Byte  |
 * |    10  -   1024 Byte |
 * |    11  -   2048 Byte |
 * |    12  -   SPLIT     |
 * |    13  -   MERGED    |
 * |    14  -   PrevTaken |
 * |    15  -   NxtTaken  |
 * ------------------------
 */

//flagsForMemBlock
#define MEM_FLGS_TAKEN_SHFT     ((MemFlags)0x0u)
#define MEM_FLGS_TAKEN_MSK      ((MemFlags)0x1u)
#define MEM_FLGS_ISLOWER_SHFT   ((MemFlags)0x1u)
#define MEM_FLGS_ISLOWER_MSK    ((MemFlags)0x2u)
#define MEM_FLGS_SPLT_4_SHFT    ((MemFlags)0x2u)
#define MEM_FLGS_SPLT_4_MSK     ((MemFlags)0x4u)
#define MEM_FLGS_SPLT_8_SHFT    ((MemFlags)0x3u)
#define MEM_FLGS_SPLT_8_MSK     ((MemFlags)0x8u)
#define MEM_FLGS_SPLT_16_SHFT   ((MemFlags)0x4u)
#define MEM_FLGS_SPLT_16_MSK    ((MemFlags)0x10u)
#define MEM_FLGS_SPLT_32_SHFT   ((MemFlags)0x5u)
#define MEM_FLGS_SPLT_32_MSK    ((MemFlags)0x20u)
#define MEM_FLGS_SPLT_64_SHFT   ((MemFlags)0x6u)
#define MEM_FLGS_SPLT_64_MSK    ((MemFlags)0x40u)
#define MEM_FLGS_SPLT_128_SHFT  ((MemFlags)0x7u)
#define MEM_FLGS_SPLT_128_MSK   ((MemFlags)0x80u)
#define MEM_FLGS_BGGSTBLCK_SHFT ((MemFlags)0x8u)
#define MEM_FLGS_BGGSTBLCK_MSK  ((MemFlags)0x100u)
#define MEM_FLGS_MERGE512_SHFT  ((MemFlags)0x9u)
#define MEM_FLGS_MERGE512_MSK   ((MemFlags)0x200u)
#define MEM_FLGS_MERGE1024_SHFT ((MemFlags)0xAu)
#define MEM_FLGS_MERGE1024_MSK  ((MemFlags)0x400u)
#define MEM_FLGS_MERGE2048_SHFT ((MemFlags)0xBu)
#define MEM_FLGS_MERGE2048_MSK  ((MemFlags)0x800u)
#define MEM_FLGS_SPLT_SHFT      ((MemFlags)0xCu)
#define MEM_FLGS_SPLT_MSK       ((MemFlags)0x1000u)
#define MEM_FLGS_MERGED_SHFT    ((MemFlags)0xDu)
#define MEM_FLGS_MERGED_MSK     ((MemFlags)0x2000u)
#define MEM_FLGS_PREVTAKEN_SHFT ((MemFlags)0xEu)
#define MEM_FLGS_PREVTAKEN_MSK  ((MemFlags)0x4000u)
#define MEM_FLGS_NXTTAKEN_SHFT  ((MemFlags)0xFu)
#define MEM_FLGS_NXTTAKEN_MSK   ((MemFlags)0x8000u)

#define MEM_FLGS_SIZE_MSK       ((MemFlags)0xFFCu)

#define MEM_FLG_ISTAKEN(memFlgs)            MEM_FLG_PARSE(memFlgs,MEM_FLGS_TAKEN_SHFT)
#define MEM_FLG_SET_TAKEN(pMemMngrHead)     MEM_FLG_SET_BIT_MSK(pMemMngrHead, MEM_FLGS_TAKEN_MSK, flagsForMemBlock)
#define MEM_FLG_CLR_TAKEN(pMemMngrHead)     MEM_FLG_CLR_BIT_MSK(pMemMngrHead, MEM_FLGS_TAKEN_MSK, flagsForMemBlock)
#define MEM_FLG_PREVTAKEN(memFlgs)          MEM_FLG_PARSE(memFlgs,MEM_FLGS_PREVTAKEN_SHFT)
#define MEM_FLG_SET_PREVTAKEN(pMemMngrHead) MEM_FLG_SET_BIT_MSK(pMemMngrHead, MEM_FLGS_PREVTAKEN_MSK, flagsForMemBlock)
#define MEM_FLG_CLR_PREVTAKEN(pMemMngrHead) MEM_FLG_CLR_BIT_MSK(pMemMngrHead, MEM_FLGS_PREVTAKEN_MSK, flagsForMemBlock)
#define MEM_FLG_NXTTAKEN(memFlgs)           MEM_FLG_PARSE(memFlgs,MEM_FLGS_NXTTAKEN_SHFT)
#define MEM_FLG_SET_NXTTAKEN(pMemMngrHead)  MEM_FLG_SET_BIT_MSK(pMemMngrHead, MEM_FLGS_NXTTAKEN_MSK, flagsForMemBlock)
#define MEM_FLG_CLR_NXTTAKEN(pMemMngrHead)  MEM_FLG_CLR_BIT_MSK(pMemMngrHead, MEM_FLGS_NXTTAKEN_MSK, flagsForMemBlock)
#define MEM_FLG_ISSPLIT(memFlgs)            MEM_FLG_PARSE(memFlgs,MEM_FLGS_SPLT_SHFT)
#define MEM_FLG_SET_SPLIT(pMemMngrHead)     MEM_FLG_SET_BIT_MSK(pMemMngrHead, MEM_FLGS_SPLT_MSK, flagsForMemBlock)
#define MEM_FLG_CLR_SPLIT(pMemMngrHead)     MEM_FLG_CLR_BIT_MSK(pMemMngrHead, MEM_FLGS_SPLT_MSK, flagsForMemBlock)
#define MEM_FLG_ISLOWER(memFlgs)            MEM_FLG_PARSE(memFlgs,MEM_FLGS_ISLOWER_SHFT)
#define MEM_FLG_SET_ISLOWER(pMemMngrHead)   MEM_FLG_SET_BIT_MSK(pMemMngrHead, MEM_FLGS_ISLOWER_MSK, flagsForMemBlock)
#define MEM_FLG_CLR_ISLOWER(pMemMngrHead)   MEM_FLG_CLR_BIT_MSK(pMemMngrHead, MEM_FLGS_ISLOWER_MSK, flagsForMemBlock)
#define MEM_FLG_ISMERGED(memFlgs)           MEM_FLG_PARSE(memFlgs,MEM_FLGS_MERGED_SHFT)
#define MEM_FLG_SET_MERGED(pMemMngrHead)    MEM_FLG_SET_BIT_MSK(pMemMngrHead, MEM_FLGS_MERGED_MSK, flagsForMemBlock)
#define MEM_FLG_CLR_MERGED(pMemMngrHead)    MEM_FLG_CLR_BIT_MSK(pMemMngrHead, MEM_FLGS_MERGED_MSK, flagsForMemBlock)
#define MEM_FL_WASLOWER(memFlgs)            MEM_FLG_PARSE(memFlgs,MEM_FLGS_WASLOWER_SHFT)
// MORE THAN ONE BIT SET --- n & (n - 1) != 0
#define MEM_FLG_GET_MEMSIZE(memFlgs)        (MemSize)(memFlgs & MEM_FLGS_SIZE_MSK)
#define MEM_FLG_SET_MEMSIZE(pMemMngrHead, newSize) \
    do \
    {\
        if(((BlckSize)(newSize)) < BIGGEST_BLCK )\
        {\
            MEM_FLG_SET_SPLIT(pMemMngrHead);\
        } else \
        {\
            MEM_FLG_CLR_SPLIT(pMemMngrHead);\
        }\
        (pMemMngrHead)->flagsForMemBlock = (MemFlags)((pMemMngrHead)->flagsForMemBlock & (MemFlags)(~MEM_FLGS_SIZE_MSK));\
        (pMemMngrHead)->flagsForMemBlock = (MemFlags)((pMemMngrHead)->flagsForMemBlock | (MemFlags)((MemFlags)(newSize) & MEM_FLGS_SIZE_MSK));\
    }while((uint8_t)0x0u)
#define MEM_FLG_ISCOMBO(memFlgs)            (MemSize)((MEM_FLG_GET_MEMSIZE(memFlgs) & (MemSize)(MEM_FLG_GET_MEMSIZE(memFlgs)-(MemSize)1u)) ? 1u : 0u)
#define MEM_FLG_BIGGER_COMBO(memFlgs)       (MemSize)(MEM_FLG_GET_MEMSIZE(memFlgs) & (MemSize)(MEM_FLG_GET_MEMSIZE(memFlgs)-(MemSize)1u))
#define MEM_FLG_SMALLER_COMBO(memFlgs)      (MemSize)(MEM_FLG_GET_MEMSIZE(memFlgs) & (MemSize)(-MEM_FLG_GET_MEMSIZE(memFlgs)))

/*
 * MEM BLCK FLAGS - additionalFlags
 * ------------------------
 * |   BIT  -   Purpose   |
 * |----------------------|
 * |    0   -   IsBlckBeg |
 * |    1   -   IsBlckLast|
 * |    2   -   PRV 4 B   |  - SMALLEST BLCK
 * |    3   -   PRV 8 B   |
 * |    4   -   PRV 16 B  |
 * |    5   -   PRV 32 B  |
 * |    6   -   PRV 64 B  |
 * |    7   -   PRV 128 B |
 * |    8   -   PRV 256 B |  - BIGGEST BLCK
 * |    9   -   PRV 512 B |
 * |    10  -   PRV 1024 B|
 * |    11  -   PRV 2048 B|
 * |    12  -   nxtSplit  |
 * |    13  -   prevSplit |
 * |    14  -   bggrMrgd  |
 * |    15  -             |
 * ------------------------
 */
//additionalFlags
#define MEM_FLGS_ISBLCKBEG_SHFT     ((MemFlags)0x0u)
#define MEM_FLGS_ISBLCKBEG_MSK      ((MemFlags)0x1u)
#define MEM_FLGS_ISBLCKLAST_SHFT    ((MemFlags)0x1u)
#define MEM_FLGS_ISBLCKLAST_MSK     ((MemFlags)0x2u)
#define MEM_FLGS_PRV_SPLT_4_SHFT    MEM_FLGS_SPLT_4_SHFT
#define MEM_FLGS_PRV_SPLT_4_MSK     MEM_FLGS_SPLT_4_MSK
#define MEM_FLGS_PRV_SPLT_8_SHFT    MEM_FLGS_SPLT_8_SHFT
#define MEM_FLGS_PRV_SPLT_8_MSK     MEM_FLGS_SPLT_8_MSK
#define MEM_FLGS_PRV_SPLT_16_SHFT   MEM_FLGS_SPLT_16_SHFT
#define MEM_FLGS_PRV_SPLT_16_MSK    MEM_FLGS_SPLT_16_MSK
#define MEM_FLGS_PRV_SPLT_32_SHFT   MEM_FLGS_SPLT_32_SHFT
#define MEM_FLGS_PRV_SPLT_32_MSK    MEM_FLGS_SPLT_32_MSK
#define MEM_FLGS_PRV_SPLT_64_SHFT   MEM_FLGS_SPLT_64_SHFT
#define MEM_FLGS_PRV_SPLT_64_MSK    MEM_FLGS_SPLT_64_MSK
#define MEM_FLGS_PRV_SPLT_128_SHFT  MEM_FLGS_SPLT_128_SHFT
#define MEM_FLGS_PRV_SPLT_128_MSK   MEM_FLGS_SPLT_128_MSK
#define MEM_FLGS_PRV_BGGSTBLCK_SHFT MEM_FLGS_BGGSTBLCK_SHFT
#define MEM_FLGS_PRV_BGGSTBLCK_MSK  MEM_FLGS_BGGSTBLCK_MSK
#define MEM_FLGS_PRV_MERGE512_SHFT  MEM_FLGS_MERGE512_SHFT
#define MEM_FLGS_PRV_MERGE512_MSK   MEM_FLGS_MERGE512_MSK
#define MEM_FLGS_PRV_MERGE1024_SHFT MEM_FLGS_MERGE1024_SHFT
#define MEM_FLGS_PRV_MERGE1024_MSK  MEM_FLGS_MERGE1024_MSK
#define MEM_FLGS_PRV_MERGE2048_SHFT MEM_FLGS_MERGE2048_SHFT
#define MEM_FLGS_PRV_MERGE2048_MSK  MEM_FLGS_MERGE2048_MSK
#define MEM_FLGS_NXT_SPLT_SHFT      ((MemFlags)0xCu)
#define MEM_FLGS_NXT_SPLT_MSK       ((MemFlags)0x1000u)
#define MEM_FLGS_PREV_SPLT_SHFT     ((MemFlags)0xDu)
#define MEM_FLGS_PREV_SPLT_MSK      ((MemFlags)0x2000u)
#define MEM_FLGS_BGGRMRGD_SHFT      ((MemFlags)0xEu)
#define MEM_FLGS_BGGRMRGD_MSK       ((MemFlags)0x4000u)
#define MEM_FLGS_CACHED_SHFT        ((MemFlags)0xFu)
#define MEM_FLGS_CACHED_MSK         ((MemFlags)0x8000u)

#define MEM_FLG_ISBLCKBEG(memFlgs)          MEM_FLG_PARSE(memFlgs,MEM_FLGS_ISBLCKBEG_SHFT)
#define MEM_FLG_SET_BLCKBEG(pMemMngrHead)   MEM_FLG_SET_BIT_MSK(pMemMngrHead, MEM_FLGS_ISBLCKBEG_MSK, additionalFlags)
#define MEM_FLG_CLR_BLCKBEG(pMemMngrHead)   MEM_FLG_CLR_BIT_MSK(pMemMngrHead, MEM_FLGS_ISBLCKBEG_MSK, additionalFlags)
#define MEM_FLG_ISBLCKLAST(memFlgs)         MEM_FLG_PARSE(memFlgs,MEM_FLGS_ISBLCKLAST_SHFT)
#define MEM_FLG_SET_BLCKLAST(pMemMngrHead)  MEM_FLG_SET_BIT_MSK(pMemMngrHead, MEM_FLGS_ISBLCKLAST_MSK, additionalFlags)
#define MEM_FLG_CLR_BLCKLAST(pMemMngrHead)  MEM_FLG_CLR_BIT_MSK(pMemMngrHead, MEM_FLGS_ISBLCKLAST_MSK, additionalFlags)
#define MEM_FLG_NXT_SPLT(memFlgs)           MEM_FLG_PARSE(memFlgs,MEM_FLGS_NXT_SPLT_SHFT)
#define MEM_FLG_SET_NXT_SPLT(pMemMngrHead)  MEM_FLG_SET_BIT_MSK(pMemMngrHead, MEM_FLGS_NXT_SPLT_MSK, additionalFlags)
#define MEM_FLG_CLR_NXT_SPLT(pMemMngrHead)  MEM_FLG_CLR_BIT_MSK(pMemMngrHead, MEM_FLGS_NXT_SPLT_MSK, additionalFlags)
#define MEM_FLG_PREV_SPLT(memFlgs)          MEM_FLG_PARSE(memFlgs,MEM_FLGS_PREV_SPLT_SHFT)
#define MEM_FLG_SET_PREV_SPLT(pMemMngrHead) MEM_FLG_SET_BIT_MSK(pMemMngrHead, MEM_FLGS_PREV_SPLT_MSK, additionalFlags)
#define MEM_FLG_CLR_PREV_SPLT(pMemMngrHead) MEM_FLG_CLR_BIT_MSK(pMemMngrHead, MEM_FLGS_PREV_SPLT_MSK, additionalFlags)
#define MEM_FLG_GET_PREV_MEMSIZE(memFlgs)   (BlckSize)(memFlgs & MEM_FLGS_SIZE_MSK)
#define MEM_FLG_SET_PREV_MEMSIZE(pMemMngrHead, newSize) \
    do \
    {\
        (pMemMngrHead)->additionalFlags = (MemFlags)((pMemMngrHead)->additionalFlags & (MemFlags)(~MEM_FLGS_SIZE_MSK));\
        (pMemMngrHead)->additionalFlags = (MemFlags)((pMemMngrHead)->additionalFlags | (MemFlags)((MemFlags)(newSize) & MEM_FLGS_SIZE_MSK));\
    }while((uint8_t)0x0u)
#define MEM_FLG_PREV_ISCOMBO(memFlgs)       (MemSize)((MEM_FLG_GET_PREV_MEMSIZE(memFlgs) & (MemSize)(MEM_FLG_GET_PREV_MEMSIZE(memFlgs)-(MemSize)1u)) ? 1u : 0u)
#define MEM_FLG_PREV_BIGGER_COMBO(memFlgs)  (MemSize)(MEM_FLG_GET_PREV_MEMSIZE(memFlgs) & (MemSize)(MEM_FLG_GET_PREV_MEMSIZE(memFlgs)-(MemSize)1u))
#define MEM_FLG_PREV_SMALLER_COMBO(memFlgs) (MemSize)(MEM_FLG_GET_PREV_MEMSIZE(memFlgs) & (MemSize)(-MEM_FLG_GET_PREV_MEMSIZE(memFlgs)))
#define MEM_FLG_BGGRMRGD(memFlgs)           MEM_FLG_PARSE(memFlgs,MEM_FLGS_BGGRMRGD_SHFT)
#define MEM_FLG_SET_BGGRMRGD(pMemMngrHead)  MEM_FLG_SET_BIT_MSK(pMemMngrHead, MEM_FLGS_BGGRMRGD_MSK, additionalFlags)
#define MEM_FLG_CLR_BGGRMRGD(pMemMngrHead)  MEM_FLG_CLR_BIT_MSK(pMemMngrHead, MEM_FLGS_BGGRMRGD_MSK, additionalFlags)
#define MEM_FLG_ISCACHED(memFlgs)           MEM_FLG_PARSE(memFlgs,MEM_FLGS_CACHED_SHFT)
#define MEM_FLG_SET_CACHED(pMemMngrHead)    MEM_FLG_SET_BIT_MSK(pMemMngrHead, MEM_FLGS_CACHED_MSK, additionalFlags)
#define MEM_FLG_CLR_CACHED(pMemMngrHead)    MEM_FLG_CLR_BIT_MSK(pMemMngrHead, MEM_FLGS_CACHED_MSK, additionalFlags)

#define MEM_FLG_TAKENORCACHED(pMemMngrHead) (MemFlags)(MEM_FLG_ISTAKEN(pMemMngrHead->flagsForMemBlock) | MEM_FLG_ISCACHED(pMemMngrHead->additionalFlags))

// END MEMORY_MANAGEMENT //

/**
 *  \brief Initialize the memory manager.
 *
 * \return Return the success of the operation.
 *
 * \warning MUST BE CALLED BEFORE ANY CALL TO A MEMORY MANAGER RELATED FUNCTION!
 */
RetCode initMEM( void );

/**
 *  \brief Allocate a block of memory satisfying the desiredSize property.
 *
 *  \param desiredSize [in] The size of the memory block needed.
 */
void * rMalloc( MemSize desiredSize );

/**
 *  \warning DO NOT USE, UNFINISHED
 *  \param desiredSize
 *
 *
 *  \warning UNTESTED!
 */
void * rCalloc( MemSize desiredSize );

/**
 *  \brief Allocate a block of memory satisfying the desiredSize property.
 *
 *  \param ptrToExistingMem [in, out] Pointer to the already allocated memory.
 *  \param desiredSize [in] The size of the memory block needed.
 *
 *  \warning UNTESTED!
 */
void * rRealloc( void * ptrToExistingMem, MemSize desiredSize );

/**
 *  \brief The provided block of memory will be added to the memory block cache.
 *  \param pToBeFreed [in] Pointer to the block of memory to free.
 */
void rFree( void *pToBeFreed );

/**
 *  \brief Free a block of memory previously allocated with either rMalloc, rCalloc or rRealloc.
 *
 *  \param blckToFullyFree [in] Pointer to the block of memory (#MemMngrHead) to free and put back onto the free memory blocks list.
 */
void rFullyFree( MemMngrHead * blckToFullyFree );

/**
 * \brief Creates a memory pool with the given #MemPoolID
 *
 * \param [in] sizeOfElements Size of one element
 * \param [in] elements Number of elements to allocate the pool for
 * \param [out] memPoolID Pointer to a #MemPoolID that receives the ID of the created memory pool
 *
 * \return Returns the success of the operation
 *
 * This function allocates elements number of memory block with the size sizeOfElements and assigns its #MemPoolID to memPoolID.
 *
 * \warning This function must have been called before the memory pool can be used!
 */
RetCode memMngr_CreateMemPool(
                               const MemSize sizeOfElements,
                               const uint8_t elements,
                               MemPoolID * const memPoolID );

/**
 *  \todo Implement!
 *  \warning DO NOT USE!
 *  \brief Delete a previously created memory pool linked to the provided MemPoolID.
 *
 *  \param [in] memPoolID Memory pool ID of the memory pool to be deleted.
 *  \return Return the success of the operation
 */
RetCode memMngr_DeleteMemPool( const MemPoolID memPoolID );

/**
 *  \brief Allocate an element from the memory pool specified by the provided MemPoolID.
 *
 *  \param [out] ptrToMem Pointer to pointer that will receive the address of the allocated block
 *  \param [in] memPoolID #MemPoolID of the memory pool to allocate the block of memory from
 *
 *  \return Return the success of the operation
 *
 *  \warning The memory pool must have been initialized upfront!
 */
RetCode memMngr_MemPoolMalloc( void ** ptrToMem, const MemPoolID memPoolID );

/**
 *  \brief Free a previously allocated block of memory from a memory pool and put it back into the memory pool.
 *
 *  \param [in] ptrToMem Pointer to the block of memory to free
 *  \param [in] memPoolID #MemPoolID of the memory pool the block of memory was allocated from
 *
 *  \return Return the success of the operation
 *
 *  \warning The block must have been allocated from the memory pool corresponding to the given MemPoolID!
 *  \note The block is prepended to the memory pool's available block list.
 */
RetCode memMngr_MemPoolFree( void * ptrToMem, const MemPoolID memPoolID );

/**
 * \}
 * \}
 */
#endif /* HEADERS_R_RTOS_MEMMNGR_H_ */

