/**
 * \file    R_RTOS_SVC.S
 * \author  Christian Neuberger (NeubergerCh50344@th-nuernberg.de)
 * \date    18.12.2015
 *
 * \brief SVC Call service routine - OS service calls.
 *
 *  Computes which stack pointer was used when the SVC Call occured.
 *  Stack pointer is saved in R0, which will later be used for unstacking and retrieving function arguments.
 *  Also the EXC_RETURN can be altered during the SVC_HandlerMain
 *  to controll into which mode this function shall exit and which stack pointer to use.
 *
 *  SVC Calls are used for OS service calls. They can only be called by tasks (and might be called by interrupts with lower priority than the SVC Call interrupt - !!!NOT RECOMMENDED!!!).<br>
 *  DO NOT NEST SVC CALLS! MAKE SURE EVERY FUNCTION INVOKED DURING AN SVC CALL DOES NOT INCLUDE ANOTHER SVC CALL!
 *
 *  Due to tasks only having a limited stack and of course to keep their stack as small as possible, service calls (e.g. setting a timer, taking/giving a semaphore) are outsourced into service calls.
 *  Service calls always have privileged mode and make use of the main stack pointer. Also service calls can not be interrupted (SVC Call has the highest interrupt priority).
 */
    .thumb_func
    .align 4
    .globl   SVC_Handler
    .weak    SVC_Handler
    .type    SVC_Handler, %function
/* SVC HANDLER */
SVC_Handler:
    cpsid   i                       /* disable interrupts */
    movs    r0,     #4              /* bit 3 of the EXCReturn hints which SP was used */
    mov     r1,     lr
    tst     r0,     r1              /* test which SP was used for the stacking */
    beq     SVCstackingMSP
    mrs     r0,     psp             /* load PSP into r0 */
    b       SVC_Handler_Cont
SVCstackingMSP:
    mrs     r0, msp                 /* load MSP into r0 */
SVC_Handler_Cont:
    ldr     r2,=svc_EXCReturn       /* save lr to svc_EXCReturn */
    mov     r1,     lr
    str     r1,     [r2]
    bl      SVC_HandlerMain         /* branch to main handler without exchange */
    ldr     r2,=svc_EXCReturn       /* retrieve EXCReturn from svc_EXCReturn */
    ldr     r1,     [r2]
    cpsie   i                       /* enable interrupts */
    bx      r1

.thumb_func
.align 4
.globl   SVC_AdjustTskSP
.weak    SVC_AdjustTskSP
.type    SVC_AdjustTskSP, %function
/* SVC HANDLER */
SVC_AdjustTskSP:
    mrs     r0,     psp             /* load PSP into r0 */
    ldr     r2,     =p_cur_tsk_tcb  /* address of pointer to current tsk tcb */
    ldr     r1,     [r2]            /* pointer to current tsk tcb */
    ldr     r2,     [r1]            /* pointer to current tsk tcb's stack struct (first element of TskTCB); StackPointer is the first element of the stack struct! */
    str     r0,     [r2]            /* STORE CURRENT PSP as current tsk tcb's stack pointer */
    bx      lr                      /* branch back to task */
