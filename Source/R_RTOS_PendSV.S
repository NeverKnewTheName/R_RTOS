/**
 * \file    R_RTOS_PendSV.S
 * \author  Christian Neuberger (NeubergerCh50344@th-nuernberg.de)
 * \date    11.12.2015
 *
 * \brief PendSV service routine - Context Switch.
 *
 *  The PendSV exception occurs as soon as it is called by setting its pending flag.
 *  Therefore it can be used as a software interrupt.
 *  Its use case here is to make a context switch from (if existing) the current task (p_cur_tsk_tcb) to task scheduled to run next (p_nxt_tsk_tcb).
 *
 */

 /**
  *  \fn PendSV_Handler
  *  \brief Context switching.
  *
  *  First the stackpointer has to be extracted from the pointer to the TskTCB.
  *  The stack has to be unstacked according to the stack frame.
  *  Since the exception stack frame only saves the lower registers (r0-r3 and r12) the upper registers (r7-r11) have to saved by hand.
  *  In order not to falsify the register's content they are saved in groups of four (using already saved r0-r3).
  *
  *  After saving the context of the current task, the pointer to the current task has to be changed to point to the next task (p_nxt_tst_tcb).
  *  The new task's context has to be restored/created using its stack (thus its context contained in the stack frame).
  *  The unstacking process works analog to the stacking process described above.
  *
  *  After restoring/creating the next task's context, a branch instruction to the link register's content will set the program counter to the next task's function.
  *
  */

#define TSK_STATE_OFFSET 28
//extern PTskTCB p_cur_tsk_tcb
//extern PTskTCB p_nxt_tsk_tcb

    .thumb_func
    .align 4
    .globl   PendSV_Handler
    .weak    PendSV_Handler
    .type    PendSV_Handler, %function
PendSV_Handler:
    cpsid   i                      /* DISABLE INTERRUPTS */
    ldr     r2,     =p_cur_tsk_tcb /* address of pointer to current tsk tcb */
    ldr     r1,     [r2]           /* pointer to current tsk tcb */
    cmp     r1,     #0             /* check for NULL poiner */
    beq     PendSV_NO_CUR_TSK      /* if NULL pointer, there is no current task. skip stacking / context saving! */

    mrs     r0,     psp
    sub     r0,     #32           /* DECREMENT SP FOR R4 TO R11 ( SIZE OF WORD TIMES AMOUNT OF REGISTER -> 4 * 8 ) */
    stmia   r0!,    {r4-r7}       /* STORE REGISTER R4 TO R7 */
    mov     r4,     r8
    mov     r5,     r9
    mov     r6,     r10
    mov     r7,     r11            /* -> GET REGISTER R8 TO R11 */
    stmia   r0!,    {r4-r7}        /* STORE REGISTERS R8 TO R11 */
    sub     r0,     #32            /* RESET STACKPOINTER TO END OF EXCEPTION FRAME */

    ldr     r1,     =p_cur_tsk_tcb /* address of pointer to current tsk tcb */
    ldr     r2,     [r1]           /* pointer to current tsk tcb */
    //ldr     r1,     [r2]         /* pointer to current tsk tcb's stack struct (first element of TskTCB); StackPointer is the first element of the stack struct! */

    mov     r1,     r0
    str     r1,     [r2]           /* STORE CURRENT PSP WITH pointer to current tsk tcb's stack pointer */
PendSV_NO_CUR_TSK:
    ldr     r2,     =p_nxt_tsk_tcb /* address of pointer to current tsk tcb */
    ldr     r1,     [r2]           /* pointer to current tsk tcb */
    ldr     r2,     =p_cur_tsk_tcb /* address of pointer to next tsk tcb */
    str     r1,     [r2]           /* store pointer to next tsk tcb to pointer to current tsk tcb */

    /* set task to running */
    ldr  r5, =offsetOfTskState    /* load address of offset into R5 */
    ldr  r5, [r5]                 /* load offset of tskInfo in TskTCB into R5 */
    ldrb r3, [r1, r5]             /* load byte of tskInfo into r3 */
    movs r4, #15                  /* generate mask for masking out taskState */
    bic  r3, r4                   /* clear current taskState */
    mov  r4, #1                   /* generate mask for task state running */
    orr  r3, r4                   /* set new taskState */
    strb r3, [r1, r5]             /* store updated taskState to task's tskInfo */

    ldr     r0,     [r1]           /* pointer to current tsk tcb's stack pointer */
    add     r0,     #16            /* GO BACK 4 -> 4 REGISTERS (R8-R11) WILL BE STORED; SP INCREMENTS AUTOMAGICALLY FOR THE REMAINING 4 REGISTERS (R4-R7) */
    ldmia   r0!,    {r4-r7}        /* LOAD REGISTERS R8 TO R11 */
    mov     r8,     r4
    mov     r9,     r5
    mov     r10,    r6
    mov     r11,    r7             /* -> SAVE REGISTERS R8 TO R11 IN CORRESPONDING REGISTER */
    msr     psp,    r0
    sub     r0,     #32            /* GO BACK TO END OF EXCEPTION FRAME */
    ldmia   r0!,    {r4-r7}        /* LOAD REGISTERS R4 TO R7 */
    cpsie   i                      /* ENABLE INTERRUPTS */
    bx      lr                     /* DO NOT FORGET TO BRANCH.... BRANCH EXCHANGE */
