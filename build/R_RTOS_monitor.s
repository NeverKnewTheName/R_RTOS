	.cpu cortex-m0plus
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 6
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.code	16
	.file	"R_RTOS_monitor.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.section	.bss.memPoolID_MNTR,"aw",%nobits
	.type	memPoolID_MNTR, %object
	.size	memPoolID_MNTR, 1
memPoolID_MNTR:
	.space	1
	.section	.text.mntr_appendToWaitrList,"ax",%progbits
	.align	2
	.code	16
	.thumb_func
	.type	mntr_appendToWaitrList, %function
mntr_appendToWaitrList:
.LFB0:
	.file 1 "../source/R_RTOS/R_RTOS_monitor.c"
	.loc 1 21 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	sub	sp, sp, #8
	.cfi_def_cfa_offset 16
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	str	r0, [r7, #4]
	str	r1, [r7]
	.loc 1 41 0
	mov	r3, #1
	.loc 1 42 0
	mov	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
	.cfi_endproc
.LFE0:
	.size	mntr_appendToWaitrList, .-mntr_appendToWaitrList
	.section	.text.mntr_getNextWaitr,"ax",%progbits
	.align	2
	.code	16
	.thumb_func
	.type	mntr_getNextWaitr, %function
mntr_getNextWaitr:
.LFB1:
	.loc 1 45 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	sub	sp, sp, #8
	.cfi_def_cfa_offset 16
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	str	r0, [r7, #4]
	str	r1, [r7]
	.loc 1 47 0
	mov	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
	.cfi_endproc
.LFE1:
	.size	mntr_getNextWaitr, .-mntr_getNextWaitr
	.section	.text.mntr_INIT,"ax",%progbits
	.align	2
	.global	mntr_INIT
	.code	16
	.thumb_func
	.type	mntr_INIT, %function
mntr_INIT:
.LFB2:
	.loc 1 50 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 51 0
	ldr	r3, .L6
	mov	r0, #8
	mov	r1, #16
	mov	r2, r3
	bl	memMngr_CreateMemPool
	mov	r3, r0
	.loc 1 53 0
	mov	r0, r3
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L7:
	.align	2
.L6:
	.word	memPoolID_MNTR
	.cfi_endproc
.LFE2:
	.size	mntr_INIT, .-mntr_INIT
	.section	.text.mntr_CreateMntr,"ax",%progbits
	.align	2
	.global	mntr_CreateMntr
	.code	16
	.thumb_func
	.type	mntr_CreateMntr, %function
mntr_CreateMntr:
.LFB3:
	.loc 1 59 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	sub	sp, sp, #16
	.cfi_def_cfa_offset 24
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	add	r3, r7, #7
	strb	r2, [r3]
	.loc 1 60 0
	ldr	r3, [r7, #12]
	cmp	r3, #0
	bne	.L9
	.loc 1 61 0
	mov	r3, #0
	b	.L10
.L9:
	.loc 1 63 0
	mov	r0, #8
	bl	rMalloc
	mov	r2, r0
	ldr	r3, [r7, #12]
	str	r2, [r3]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L11
	.loc 1 64 0
	mov	r3, #0
	b	.L10
.L11:
	.loc 1 80 0
	mov	r3, #1
.L10:
	.loc 1 81 0
	mov	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
	.cfi_endproc
.LFE3:
	.size	mntr_CreateMntr, .-mntr_CreateMntr
	.section	.text.mntr_InitMntr,"ax",%progbits
	.align	2
	.global	mntr_InitMntr
	.code	16
	.thumb_func
	.type	mntr_InitMntr, %function
mntr_InitMntr:
.LFB4:
	.loc 1 87 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	sub	sp, sp, #8
	.cfi_def_cfa_offset 16
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	str	r0, [r7, #4]
	str	r1, [r7]
	.loc 1 88 0
	ldr	r3, [r7, #4]
	ldr	r2, [r7]
	str	r2, [r3]
	.loc 1 89 0
	ldr	r3, [r7, #4]
	mov	r2, #24
	strb	r2, [r3, #6]
	.loc 1 90 0
	ldr	r3, [r7, #4]
	mov	r2, #0
	strb	r2, [r3, #7]
	.loc 1 91 0
	ldr	r3, [r7, #4]
	mov	r2, #0
	strb	r2, [r3, #4]
	.loc 1 92 0
	ldr	r3, [r7, #4]
	mov	r2, #0
	strb	r2, [r3, #5]
	.loc 1 93 0
	mov	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
	.cfi_endproc
.LFE4:
	.size	mntr_InitMntr, .-mntr_InitMntr
	.section	.text.mntr_DelMntr,"ax",%progbits
	.align	2
	.global	mntr_DelMntr
	.code	16
	.thumb_func
	.type	mntr_DelMntr, %function
mntr_DelMntr:
.LFB5:
	.loc 1 96 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	sub	sp, sp, #8
	.cfi_def_cfa_offset 16
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	str	r0, [r7, #4]
	.loc 1 98 0
	mov	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
	.cfi_endproc
.LFE5:
	.size	mntr_DelMntr, .-mntr_DelMntr
	.section	.text.mntr_DestrMntr,"ax",%progbits
	.align	2
	.global	mntr_DestrMntr
	.code	16
	.thumb_func
	.type	mntr_DestrMntr, %function
mntr_DestrMntr:
.LFB6:
	.loc 1 101 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	sub	sp, sp, #8
	.cfi_def_cfa_offset 16
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	str	r0, [r7, #4]
	.loc 1 102 0
	ldr	r3, [r7, #4]
	cmp	r3, #0
	bne	.L15
	.loc 1 103 0
	mov	r3, #0
	b	.L16
.L15:
	.loc 1 104 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L17
	.loc 1 105 0
	mov	r3, #0
	b	.L16
.L17:
	.loc 1 116 0
	ldr	r3, .L18
	ldrb	r3, [r3]
	mov	r0, r3
	bl	memMngr_DeleteMemPool
	.loc 1 117 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r3, [r3]
	mov	r0, r3
	bl	rFree
	.loc 1 118 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	mov	r0, r3
	bl	rFree
	.loc 1 119 0
	ldr	r3, [r7, #4]
	mov	r2, #0
	str	r2, [r3]
	.loc 1 120 0
	mov	r3, #1
.L16:
	.loc 1 121 0
	mov	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L19:
	.align	2
.L18:
	.word	memPoolID_MNTR
	.cfi_endproc
.LFE6:
	.size	mntr_DestrMntr, .-mntr_DestrMntr
	.section	.text.mntr_ReqstReadAccssMntr,"ax",%progbits
	.align	2
	.global	mntr_ReqstReadAccssMntr
	.code	16
	.thumb_func
	.type	mntr_ReqstReadAccssMntr, %function
mntr_ReqstReadAccssMntr:
.LFB7:
	.loc 1 125 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	sub	sp, sp, #16
	.cfi_def_cfa_offset 24
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	str	r0, [r7, #4]
	mov	r2, r1
	add	r3, r7, #3
	strb	r2, [r3]
	.loc 1 133 0
	ldr	r3, [r7, #4]
	ldrb	r3, [r3, #6]
	cmp	r3, #0
	bne	.L21
	.loc 1 136 0
	mov	r3, #0
	b	.L22
.L21:
	.loc 1 138 0
	ldr	r3, [r7, #4]
	ldrb	r3, [r3, #6]
	mov	r2, r3
	mov	r3, #16
	and	r3, r2
	beq	.L23
	.loc 1 141 0
	ldr	r3, [r7, #4]
	ldrb	r3, [r3, #7]
	add	r3, r3, #1
	uxtb	r2, r3
	ldr	r3, [r7, #4]
	strb	r2, [r3, #7]
	.loc 1 142 0
	mov	r3, #1
	b	.L22
.L23:
	.loc 1 144 0
	ldr	r3, [r7, #4]
	ldrb	r3, [r3, #6]
	mov	r2, r3
	mov	r3, #2
	and	r3, r2
	beq	.L24
.LBB2:
	.loc 1 152 0
	ldr	r3, [r7, #12]
	cmp	r3, #0
	beq	.L25
	.loc 1 154 0
	ldr	r3, [r7, #12]
	add	r2, r7, #3
	ldrb	r2, [r2]
	strb	r2, [r3, #5]
	.loc 1 155 0
	ldr	r3, [r7, #12]
	mov	r2, #1
	strb	r2, [r3, #4]
	.loc 1 158 0
	ldr	r2, [r7, #4]
	ldr	r3, [r7, #12]
	mov	r0, r2
	mov	r1, r3
	bl	mntr_appendToWaitrList
.L25:
	.loc 1 171 0
	mov	r3, #0
	b	.L22
.L24:
.LBE2:
	.loc 1 176 0
	mov	r3, #0
.L22:
	.loc 1 178 0
	mov	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
	.cfi_endproc
.LFE7:
	.size	mntr_ReqstReadAccssMntr, .-mntr_ReqstReadAccssMntr
	.section	.text.mntr_RelsReadAccssMntr,"ax",%progbits
	.align	2
	.global	mntr_RelsReadAccssMntr
	.code	16
	.thumb_func
	.type	mntr_RelsReadAccssMntr, %function
mntr_RelsReadAccssMntr:
.LFB8:
	.loc 1 182 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	sub	sp, sp, #8
	.cfi_def_cfa_offset 16
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	str	r0, [r7, #4]
	.loc 1 183 0
	ldr	r3, [r7, #4]
	ldrb	r3, [r3, #6]
	cmp	r3, #0
	bne	.L27
	.loc 1 186 0
	mov	r3, #0
	b	.L28
.L27:
	.loc 1 188 0
	ldr	r3, [r7, #4]
	ldrb	r3, [r3, #6]
	mov	r2, r3
	mov	r3, #51
	and	r3, r2
	beq	.L29
	.loc 1 191 0
	ldr	r3, [r7, #4]
	ldrb	r3, [r3, #7]
	sub	r3, r3, #1
	uxtb	r2, r3
	ldr	r3, [r7, #4]
	strb	r2, [r3, #7]
	ldr	r3, [r7, #4]
	ldrb	r3, [r3, #7]
	cmp	r3, #0
	bne	.L30
	.loc 1 200 0
	ldr	r3, [r7, #4]
	mov	r2, #66
	strb	r2, [r3, #6]
.L30:
	.loc 1 208 0
	mov	r3, #1
	b	.L28
.L29:
	.loc 1 212 0
	mov	r3, #0
.L28:
	.loc 1 214 0
	mov	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
	.cfi_endproc
.LFE8:
	.size	mntr_RelsReadAccssMntr, .-mntr_RelsReadAccssMntr
	.section	.text.mntr_ReqstWriteAccssMntr,"ax",%progbits
	.align	2
	.global	mntr_ReqstWriteAccssMntr
	.code	16
	.thumb_func
	.type	mntr_ReqstWriteAccssMntr, %function
mntr_ReqstWriteAccssMntr:
.LFB9:
	.loc 1 217 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	sub	sp, sp, #8
	.cfi_def_cfa_offset 16
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	str	r0, [r7, #4]
	mov	r2, r1
	add	r3, r7, #3
	strb	r2, [r3]
	.loc 1 224 0
	ldr	r3, [r7, #4]
	ldrb	r3, [r3, #6]
	cmp	r3, #0
	bne	.L32
	.loc 1 227 0
	mov	r3, #0
	b	.L33
.L32:
	.loc 1 229 0
	ldr	r3, [r7, #4]
	ldrb	r3, [r3, #6]
	mov	r2, r3
	mov	r3, #24
	and	r3, r2
	beq	.L34
	.loc 1 232 0
	ldr	r3, [r7, #4]
	ldrb	r3, [r3, #7]
	add	r3, r3, #1
	uxtb	r2, r3
	ldr	r3, [r7, #4]
	strb	r2, [r3, #7]
	.loc 1 233 0
	ldr	r3, [r7, #4]
	mov	r2, #66
	strb	r2, [r3, #6]
	.loc 1 234 0
	mov	r3, #1
	b	.L33
.L34:
	.loc 1 264 0
	mov	r3, #0
.L33:
	.loc 1 266 0
	mov	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
	.cfi_endproc
.LFE9:
	.size	mntr_ReqstWriteAccssMntr, .-mntr_ReqstWriteAccssMntr
	.section	.text.mntr_RelsWriteAccssMntr,"ax",%progbits
	.align	2
	.global	mntr_RelsWriteAccssMntr
	.code	16
	.thumb_func
	.type	mntr_RelsWriteAccssMntr, %function
mntr_RelsWriteAccssMntr:
.LFB10:
	.loc 1 269 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	sub	sp, sp, #8
	.cfi_def_cfa_offset 16
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	str	r0, [r7, #4]
	.loc 1 270 0
	ldr	r3, [r7, #4]
	ldrb	r3, [r3, #6]
	cmp	r3, #0
	bne	.L36
	.loc 1 273 0
	mov	r3, #0
	b	.L37
.L36:
	.loc 1 334 0
	mov	r3, #1
.L37:
	.loc 1 336 0
	mov	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
	.cfi_endproc
.LFE10:
	.size	mntr_RelsWriteAccssMntr, .-mntr_RelsWriteAccssMntr
	.text
.Letext0:
	.file 2 "c:\\freescale\\kds_3.0.0\\toolchain\\arm-none-eabi\\include\\machine\\_default_types.h"
	.file 3 "c:\\freescale\\kds_3.0.0\\toolchain\\arm-none-eabi\\include\\stdint.h"
	.file 4 "../include/R_RTOS_inc.h"
	.file 5 "../include/R_RTOS_memMngr.h"
	.file 6 "../include/R_RTOS_monitor.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x4a6
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF712
	.byte	0x1
	.4byte	.LASF713
	.4byte	.LASF714
	.4byte	.Ldebug_ranges0+0
	.4byte	0
	.4byte	.Ldebug_line0
	.4byte	.Ldebug_macro0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.4byte	.LASF638
	.uleb128 0x3
	.4byte	.LASF643
	.byte	0x2
	.byte	0x1c
	.4byte	0x3b
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF639
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.4byte	.LASF640
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF641
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.4byte	.LASF642
	.uleb128 0x3
	.4byte	.LASF644
	.byte	0x2
	.byte	0x38
	.4byte	0x62
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF645
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF646
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF647
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF648
	.uleb128 0x3
	.4byte	.LASF649
	.byte	0x3
	.byte	0x2a
	.4byte	0x30
	.uleb128 0x3
	.4byte	.LASF650
	.byte	0x3
	.byte	0x42
	.4byte	0x57
	.uleb128 0x5
	.4byte	.LASF651
	.byte	0x4
	.2byte	0x185
	.4byte	0xa7
	.uleb128 0x6
	.byte	0x4
	.4byte	0x90
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF652
	.uleb128 0x5
	.4byte	.LASF653
	.byte	0x4
	.2byte	0x1f0
	.4byte	0x85
	.uleb128 0x5
	.4byte	.LASF654
	.byte	0x4
	.2byte	0x1f6
	.4byte	0x85
	.uleb128 0x5
	.4byte	.LASF655
	.byte	0x4
	.2byte	0x1fb
	.4byte	0x85
	.uleb128 0x7
	.4byte	.LASF665
	.byte	0x1
	.byte	0x4
	.2byte	0x251
	.4byte	0x104
	.uleb128 0x8
	.4byte	.LASF656
	.sleb128 0
	.uleb128 0x8
	.4byte	.LASF657
	.sleb128 1
	.uleb128 0x8
	.4byte	.LASF658
	.sleb128 2
	.uleb128 0x8
	.4byte	.LASF659
	.sleb128 4
	.uleb128 0x8
	.4byte	.LASF660
	.sleb128 8
	.byte	0
	.uleb128 0x5
	.4byte	.LASF661
	.byte	0x4
	.2byte	0x258
	.4byte	0xd8
	.uleb128 0x5
	.4byte	.LASF662
	.byte	0x4
	.2byte	0x584
	.4byte	0x85
	.uleb128 0x3
	.4byte	.LASF663
	.byte	0x5
	.byte	0x5e
	.4byte	0x85
	.uleb128 0x3
	.4byte	.LASF664
	.byte	0x6
	.byte	0x15
	.4byte	0x85
	.uleb128 0x9
	.4byte	.LASF666
	.byte	0x1
	.byte	0x6
	.byte	0x1b
	.4byte	0x18f
	.uleb128 0x8
	.4byte	.LASF667
	.sleb128 0
	.uleb128 0x8
	.4byte	.LASF668
	.sleb128 1
	.uleb128 0x8
	.4byte	.LASF669
	.sleb128 2
	.uleb128 0x8
	.4byte	.LASF670
	.sleb128 8
	.uleb128 0x8
	.4byte	.LASF671
	.sleb128 16
	.uleb128 0x8
	.4byte	.LASF672
	.sleb128 17
	.uleb128 0x8
	.4byte	.LASF673
	.sleb128 24
	.uleb128 0x8
	.4byte	.LASF674
	.sleb128 32
	.uleb128 0x8
	.4byte	.LASF675
	.sleb128 34
	.uleb128 0x8
	.4byte	.LASF676
	.sleb128 64
	.uleb128 0x8
	.4byte	.LASF677
	.sleb128 66
	.uleb128 0x8
	.4byte	.LASF678
	.sleb128 3
	.uleb128 0x8
	.4byte	.LASF679
	.sleb128 51
	.byte	0
	.uleb128 0x3
	.4byte	.LASF680
	.byte	0x6
	.byte	0x30
	.4byte	0x132
	.uleb128 0x3
	.4byte	.LASF681
	.byte	0x6
	.byte	0x32
	.4byte	0x85
	.uleb128 0xa
	.4byte	.LASF686
	.byte	0x8
	.byte	0x6
	.byte	0x35
	.4byte	0x1d6
	.uleb128 0xb
	.4byte	.LASF682
	.byte	0x6
	.byte	0x37
	.4byte	0x1d6
	.byte	0
	.uleb128 0xb
	.4byte	.LASF683
	.byte	0x6
	.byte	0x38
	.4byte	0x104
	.byte	0x4
	.uleb128 0xb
	.4byte	.LASF684
	.byte	0x6
	.byte	0x39
	.4byte	0xb4
	.byte	0x5
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x1a5
	.uleb128 0x3
	.4byte	.LASF685
	.byte	0x6
	.byte	0x3a
	.4byte	0x1d6
	.uleb128 0xa
	.4byte	.LASF687
	.byte	0x8
	.byte	0x6
	.byte	0x3c
	.4byte	0x230
	.uleb128 0xb
	.4byte	.LASF688
	.byte	0x6
	.byte	0x3e
	.4byte	0x9b
	.byte	0
	.uleb128 0xb
	.4byte	.LASF689
	.byte	0x6
	.byte	0x3f
	.4byte	0xb4
	.byte	0x4
	.uleb128 0xb
	.4byte	.LASF690
	.byte	0x6
	.byte	0x40
	.4byte	0xb4
	.byte	0x5
	.uleb128 0xb
	.4byte	.LASF691
	.byte	0x6
	.byte	0x41
	.4byte	0x18f
	.byte	0x6
	.uleb128 0xb
	.4byte	.LASF692
	.byte	0x6
	.byte	0x42
	.4byte	0x19a
	.byte	0x7
	.byte	0
	.uleb128 0x3
	.4byte	.LASF693
	.byte	0x6
	.byte	0x44
	.4byte	0x1e7
	.uleb128 0x3
	.4byte	.LASF694
	.byte	0x6
	.byte	0x44
	.4byte	0x246
	.uleb128 0x6
	.byte	0x4
	.4byte	0x1e7
	.uleb128 0xc
	.4byte	.LASF696
	.byte	0x1
	.byte	0x12
	.4byte	0x110
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x282
	.uleb128 0xd
	.4byte	.LASF687
	.byte	0x1
	.byte	0x13
	.4byte	0x282
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0xd
	.4byte	.LASF695
	.byte	0x1
	.byte	0x14
	.4byte	0x287
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0xe
	.4byte	0x23b
	.uleb128 0xe
	.4byte	0x1dc
	.uleb128 0xc
	.4byte	.LASF697
	.byte	0x1
	.byte	0x2c
	.4byte	0x110
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x2c2
	.uleb128 0xd
	.4byte	.LASF687
	.byte	0x1
	.byte	0x2c
	.4byte	0x282
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0xd
	.4byte	.LASF695
	.byte	0x1
	.byte	0x2c
	.4byte	0x2c2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x1dc
	.uleb128 0xf
	.4byte	.LASF715
	.byte	0x1
	.byte	0x31
	.4byte	0x110
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x10
	.4byte	.LASF701
	.byte	0x1
	.byte	0x37
	.4byte	0x110
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x321
	.uleb128 0xd
	.4byte	.LASF698
	.byte	0x1
	.byte	0x38
	.4byte	0x321
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0xd
	.4byte	.LASF699
	.byte	0x1
	.byte	0x39
	.4byte	0x327
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0xd
	.4byte	.LASF700
	.byte	0x1
	.byte	0x3a
	.4byte	0x32c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x23b
	.uleb128 0xe
	.4byte	0x9b
	.uleb128 0xe
	.4byte	0x85
	.uleb128 0x11
	.4byte	.LASF702
	.byte	0x1
	.byte	0x53
	.4byte	0x110
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x367
	.uleb128 0xd
	.4byte	.LASF703
	.byte	0x1
	.byte	0x53
	.4byte	0x282
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0xd
	.4byte	.LASF699
	.byte	0x1
	.byte	0x53
	.4byte	0x327
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x11
	.4byte	.LASF704
	.byte	0x1
	.byte	0x5f
	.4byte	0x110
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x38f
	.uleb128 0xd
	.4byte	.LASF703
	.byte	0x1
	.byte	0x5f
	.4byte	0x23b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x10
	.4byte	.LASF705
	.byte	0x1
	.byte	0x64
	.4byte	0x110
	.4byte	.LFB6
	.4byte	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x3b7
	.uleb128 0xd
	.4byte	.LASF698
	.byte	0x1
	.byte	0x64
	.4byte	0x321
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x10
	.4byte	.LASF706
	.byte	0x1
	.byte	0x7c
	.4byte	0x110
	.4byte	.LFB7
	.4byte	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x405
	.uleb128 0xd
	.4byte	.LASF698
	.byte	0x1
	.byte	0x7c
	.4byte	0x405
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0xd
	.4byte	.LASF684
	.byte	0x1
	.byte	0x7c
	.4byte	0xb4
	.uleb128 0x2
	.byte	0x91
	.sleb128 -21
	.uleb128 0x12
	.4byte	.LBB2
	.4byte	.LBE2-.LBB2
	.uleb128 0x13
	.4byte	.LASF710
	.byte	0x1
	.byte	0x96
	.4byte	0x1dc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.byte	0
	.uleb128 0xe
	.4byte	0x40a
	.uleb128 0x6
	.byte	0x4
	.4byte	0x230
	.uleb128 0x11
	.4byte	.LASF707
	.byte	0x1
	.byte	0xb5
	.4byte	0x110
	.4byte	.LFB8
	.4byte	.LFE8-.LFB8
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x438
	.uleb128 0xd
	.4byte	.LASF698
	.byte	0x1
	.byte	0xb5
	.4byte	0x405
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x11
	.4byte	.LASF708
	.byte	0x1
	.byte	0xd8
	.4byte	0x110
	.4byte	.LFB9
	.4byte	.LFE9-.LFB9
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x46e
	.uleb128 0xd
	.4byte	.LASF698
	.byte	0x1
	.byte	0xd8
	.4byte	0x405
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0xd
	.4byte	.LASF684
	.byte	0x1
	.byte	0xd8
	.4byte	0xb4
	.uleb128 0x2
	.byte	0x91
	.sleb128 -13
	.byte	0
	.uleb128 0x14
	.4byte	.LASF709
	.byte	0x1
	.2byte	0x10c
	.4byte	0x110
	.4byte	.LFB10
	.4byte	.LFE10-.LFB10
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x498
	.uleb128 0x15
	.4byte	.LASF698
	.byte	0x1
	.2byte	0x10c
	.4byte	0x405
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x13
	.4byte	.LASF711
	.byte	0x1
	.byte	0x10
	.4byte	0x11c
	.uleb128 0x5
	.byte	0x3
	.4byte	memPoolID_MNTR
	.byte	0
	.section	.debug_abbrev,"",%progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x17
	.uleb128 0x2119
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x4
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xd
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x4
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0x6c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.4byte	.LFB6
	.4byte	.LFE6-.LFB6
	.4byte	.LFB7
	.4byte	.LFE7-.LFB7
	.4byte	.LFB8
	.4byte	.LFE8-.LFB8
	.4byte	.LFB9
	.4byte	.LFE9-.LFB9
	.4byte	.LFB10
	.4byte	.LFE10-.LFB10
	.4byte	0
	.4byte	0
	.section	.debug_ranges,"",%progbits
.Ldebug_ranges0:
	.4byte	.LFB0
	.4byte	.LFE0
	.4byte	.LFB1
	.4byte	.LFE1
	.4byte	.LFB2
	.4byte	.LFE2
	.4byte	.LFB3
	.4byte	.LFE3
	.4byte	.LFB4
	.4byte	.LFE4
	.4byte	.LFB5
	.4byte	.LFE5
	.4byte	.LFB6
	.4byte	.LFE6
	.4byte	.LFB7
	.4byte	.LFE7
	.4byte	.LFB8
	.4byte	.LFE8
	.4byte	.LFB9
	.4byte	.LFE9
	.4byte	.LFB10
	.4byte	.LFE10
	.4byte	0
	.4byte	0
	.section	.debug_macro,"",%progbits
.Ldebug_macro0:
	.2byte	0x4
	.byte	0x2
	.4byte	.Ldebug_line0
	.byte	0x3
	.uleb128 0
	.uleb128 0x1
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF0
	.byte	0x5
	.uleb128 0x2
	.4byte	.LASF1
	.byte	0x5
	.uleb128 0x3
	.4byte	.LASF2
	.byte	0x5
	.uleb128 0x4
	.4byte	.LASF3
	.byte	0x5
	.uleb128 0x5
	.4byte	.LASF4
	.byte	0x5
	.uleb128 0x6
	.4byte	.LASF5
	.byte	0x5
	.uleb128 0x7
	.4byte	.LASF6
	.byte	0x5
	.uleb128 0x8
	.4byte	.LASF7
	.byte	0x5
	.uleb128 0x9
	.4byte	.LASF8
	.byte	0x5
	.uleb128 0xa
	.4byte	.LASF9
	.byte	0x5
	.uleb128 0xb
	.4byte	.LASF10
	.byte	0x5
	.uleb128 0xc
	.4byte	.LASF11
	.byte	0x5
	.uleb128 0xd
	.4byte	.LASF12
	.byte	0x5
	.uleb128 0xe
	.4byte	.LASF13
	.byte	0x5
	.uleb128 0xf
	.4byte	.LASF14
	.byte	0x5
	.uleb128 0x10
	.4byte	.LASF15
	.byte	0x5
	.uleb128 0x11
	.4byte	.LASF16
	.byte	0x5
	.uleb128 0x12
	.4byte	.LASF17
	.byte	0x5
	.uleb128 0x13
	.4byte	.LASF18
	.byte	0x5
	.uleb128 0x14
	.4byte	.LASF19
	.byte	0x5
	.uleb128 0x15
	.4byte	.LASF20
	.byte	0x5
	.uleb128 0x16
	.4byte	.LASF21
	.byte	0x5
	.uleb128 0x17
	.4byte	.LASF22
	.byte	0x5
	.uleb128 0x18
	.4byte	.LASF23
	.byte	0x5
	.uleb128 0x19
	.4byte	.LASF24
	.byte	0x5
	.uleb128 0x1a
	.4byte	.LASF25
	.byte	0x5
	.uleb128 0x1b
	.4byte	.LASF26
	.byte	0x5
	.uleb128 0x1c
	.4byte	.LASF27
	.byte	0x5
	.uleb128 0x1d
	.4byte	.LASF28
	.byte	0x5
	.uleb128 0x1e
	.4byte	.LASF29
	.byte	0x5
	.uleb128 0x1f
	.4byte	.LASF30
	.byte	0x5
	.uleb128 0x20
	.4byte	.LASF31
	.byte	0x5
	.uleb128 0x21
	.4byte	.LASF32
	.byte	0x5
	.uleb128 0x22
	.4byte	.LASF33
	.byte	0x5
	.uleb128 0x23
	.4byte	.LASF34
	.byte	0x5
	.uleb128 0x24
	.4byte	.LASF35
	.byte	0x5
	.uleb128 0x25
	.4byte	.LASF36
	.byte	0x5
	.uleb128 0x26
	.4byte	.LASF37
	.byte	0x5
	.uleb128 0x27
	.4byte	.LASF38
	.byte	0x5
	.uleb128 0x28
	.4byte	.LASF39
	.byte	0x5
	.uleb128 0x29
	.4byte	.LASF40
	.byte	0x5
	.uleb128 0x2a
	.4byte	.LASF41
	.byte	0x5
	.uleb128 0x2b
	.4byte	.LASF42
	.byte	0x5
	.uleb128 0x2c
	.4byte	.LASF43
	.byte	0x5
	.uleb128 0x2d
	.4byte	.LASF44
	.byte	0x5
	.uleb128 0x2e
	.4byte	.LASF45
	.byte	0x5
	.uleb128 0x2f
	.4byte	.LASF46
	.byte	0x5
	.uleb128 0x30
	.4byte	.LASF47
	.byte	0x5
	.uleb128 0x31
	.4byte	.LASF48
	.byte	0x5
	.uleb128 0x32
	.4byte	.LASF49
	.byte	0x5
	.uleb128 0x33
	.4byte	.LASF50
	.byte	0x5
	.uleb128 0x34
	.4byte	.LASF51
	.byte	0x5
	.uleb128 0x35
	.4byte	.LASF52
	.byte	0x5
	.uleb128 0x36
	.4byte	.LASF53
	.byte	0x5
	.uleb128 0x37
	.4byte	.LASF54
	.byte	0x5
	.uleb128 0x38
	.4byte	.LASF55
	.byte	0x5
	.uleb128 0x39
	.4byte	.LASF56
	.byte	0x5
	.uleb128 0x3a
	.4byte	.LASF57
	.byte	0x5
	.uleb128 0x3b
	.4byte	.LASF58
	.byte	0x5
	.uleb128 0x3c
	.4byte	.LASF59
	.byte	0x5
	.uleb128 0x3d
	.4byte	.LASF60
	.byte	0x5
	.uleb128 0x3e
	.4byte	.LASF61
	.byte	0x5
	.uleb128 0x3f
	.4byte	.LASF62
	.byte	0x5
	.uleb128 0x40
	.4byte	.LASF63
	.byte	0x5
	.uleb128 0x41
	.4byte	.LASF64
	.byte	0x5
	.uleb128 0x42
	.4byte	.LASF65
	.byte	0x5
	.uleb128 0x43
	.4byte	.LASF66
	.byte	0x5
	.uleb128 0x44
	.4byte	.LASF67
	.byte	0x5
	.uleb128 0x45
	.4byte	.LASF68
	.byte	0x5
	.uleb128 0x46
	.4byte	.LASF69
	.byte	0x5
	.uleb128 0x47
	.4byte	.LASF70
	.byte	0x5
	.uleb128 0x48
	.4byte	.LASF71
	.byte	0x5
	.uleb128 0x49
	.4byte	.LASF72
	.byte	0x5
	.uleb128 0x4a
	.4byte	.LASF73
	.byte	0x5
	.uleb128 0x4b
	.4byte	.LASF74
	.byte	0x5
	.uleb128 0x4c
	.4byte	.LASF75
	.byte	0x5
	.uleb128 0x4d
	.4byte	.LASF76
	.byte	0x5
	.uleb128 0x4e
	.4byte	.LASF77
	.byte	0x5
	.uleb128 0x4f
	.4byte	.LASF78
	.byte	0x5
	.uleb128 0x50
	.4byte	.LASF79
	.byte	0x5
	.uleb128 0x51
	.4byte	.LASF80
	.byte	0x5
	.uleb128 0x52
	.4byte	.LASF81
	.byte	0x5
	.uleb128 0x53
	.4byte	.LASF82
	.byte	0x5
	.uleb128 0x54
	.4byte	.LASF83
	.byte	0x5
	.uleb128 0x55
	.4byte	.LASF84
	.byte	0x5
	.uleb128 0x56
	.4byte	.LASF85
	.byte	0x5
	.uleb128 0x57
	.4byte	.LASF86
	.byte	0x5
	.uleb128 0x58
	.4byte	.LASF87
	.byte	0x5
	.uleb128 0x59
	.4byte	.LASF88
	.byte	0x5
	.uleb128 0x5a
	.4byte	.LASF89
	.byte	0x5
	.uleb128 0x5b
	.4byte	.LASF90
	.byte	0x5
	.uleb128 0x5c
	.4byte	.LASF91
	.byte	0x5
	.uleb128 0x5d
	.4byte	.LASF92
	.byte	0x5
	.uleb128 0x5e
	.4byte	.LASF93
	.byte	0x5
	.uleb128 0x5f
	.4byte	.LASF94
	.byte	0x5
	.uleb128 0x60
	.4byte	.LASF95
	.byte	0x5
	.uleb128 0x61
	.4byte	.LASF96
	.byte	0x5
	.uleb128 0x62
	.4byte	.LASF97
	.byte	0x5
	.uleb128 0x63
	.4byte	.LASF98
	.byte	0x5
	.uleb128 0x64
	.4byte	.LASF99
	.byte	0x5
	.uleb128 0x65
	.4byte	.LASF100
	.byte	0x5
	.uleb128 0x66
	.4byte	.LASF101
	.byte	0x5
	.uleb128 0x67
	.4byte	.LASF102
	.byte	0x5
	.uleb128 0x68
	.4byte	.LASF103
	.byte	0x5
	.uleb128 0x69
	.4byte	.LASF104
	.byte	0x5
	.uleb128 0x6a
	.4byte	.LASF105
	.byte	0x5
	.uleb128 0x6b
	.4byte	.LASF106
	.byte	0x5
	.uleb128 0x6c
	.4byte	.LASF107
	.byte	0x5
	.uleb128 0x6d
	.4byte	.LASF108
	.byte	0x5
	.uleb128 0x6e
	.4byte	.LASF109
	.byte	0x5
	.uleb128 0x6f
	.4byte	.LASF110
	.byte	0x5
	.uleb128 0x70
	.4byte	.LASF111
	.byte	0x5
	.uleb128 0x71
	.4byte	.LASF112
	.byte	0x5
	.uleb128 0x72
	.4byte	.LASF113
	.byte	0x5
	.uleb128 0x73
	.4byte	.LASF114
	.byte	0x5
	.uleb128 0x74
	.4byte	.LASF115
	.byte	0x5
	.uleb128 0x75
	.4byte	.LASF116
	.byte	0x5
	.uleb128 0x76
	.4byte	.LASF117
	.byte	0x5
	.uleb128 0x77
	.4byte	.LASF118
	.byte	0x5
	.uleb128 0x78
	.4byte	.LASF119
	.byte	0x5
	.uleb128 0x79
	.4byte	.LASF120
	.byte	0x5
	.uleb128 0x7a
	.4byte	.LASF121
	.byte	0x5
	.uleb128 0x7b
	.4byte	.LASF122
	.byte	0x5
	.uleb128 0x7c
	.4byte	.LASF123
	.byte	0x5
	.uleb128 0x7d
	.4byte	.LASF124
	.byte	0x5
	.uleb128 0x7e
	.4byte	.LASF125
	.byte	0x5
	.uleb128 0x7f
	.4byte	.LASF126
	.byte	0x5
	.uleb128 0x80
	.4byte	.LASF127
	.byte	0x5
	.uleb128 0x81
	.4byte	.LASF128
	.byte	0x5
	.uleb128 0x82
	.4byte	.LASF129
	.byte	0x5
	.uleb128 0x83
	.4byte	.LASF130
	.byte	0x5
	.uleb128 0x84
	.4byte	.LASF131
	.byte	0x5
	.uleb128 0x85
	.4byte	.LASF132
	.byte	0x5
	.uleb128 0x86
	.4byte	.LASF133
	.byte	0x5
	.uleb128 0x87
	.4byte	.LASF134
	.byte	0x5
	.uleb128 0x88
	.4byte	.LASF135
	.byte	0x5
	.uleb128 0x89
	.4byte	.LASF136
	.byte	0x5
	.uleb128 0x8a
	.4byte	.LASF137
	.byte	0x5
	.uleb128 0x8b
	.4byte	.LASF138
	.byte	0x5
	.uleb128 0x8c
	.4byte	.LASF139
	.byte	0x5
	.uleb128 0x8d
	.4byte	.LASF140
	.byte	0x5
	.uleb128 0x8e
	.4byte	.LASF141
	.byte	0x5
	.uleb128 0x8f
	.4byte	.LASF142
	.byte	0x5
	.uleb128 0x90
	.4byte	.LASF143
	.byte	0x5
	.uleb128 0x91
	.4byte	.LASF144
	.byte	0x5
	.uleb128 0x92
	.4byte	.LASF145
	.byte	0x5
	.uleb128 0x93
	.4byte	.LASF146
	.byte	0x5
	.uleb128 0x94
	.4byte	.LASF147
	.byte	0x5
	.uleb128 0x95
	.4byte	.LASF148
	.byte	0x5
	.uleb128 0x96
	.4byte	.LASF149
	.byte	0x5
	.uleb128 0x97
	.4byte	.LASF150
	.byte	0x5
	.uleb128 0x98
	.4byte	.LASF151
	.byte	0x5
	.uleb128 0x99
	.4byte	.LASF152
	.byte	0x5
	.uleb128 0x9a
	.4byte	.LASF153
	.byte	0x5
	.uleb128 0x9b
	.4byte	.LASF154
	.byte	0x5
	.uleb128 0x9c
	.4byte	.LASF155
	.byte	0x5
	.uleb128 0x9d
	.4byte	.LASF156
	.byte	0x5
	.uleb128 0x9e
	.4byte	.LASF157
	.byte	0x5
	.uleb128 0x9f
	.4byte	.LASF158
	.byte	0x5
	.uleb128 0xa0
	.4byte	.LASF159
	.byte	0x5
	.uleb128 0xa1
	.4byte	.LASF160
	.byte	0x5
	.uleb128 0xa2
	.4byte	.LASF161
	.byte	0x5
	.uleb128 0xa3
	.4byte	.LASF162
	.byte	0x5
	.uleb128 0xa4
	.4byte	.LASF163
	.byte	0x5
	.uleb128 0xa5
	.4byte	.LASF164
	.byte	0x5
	.uleb128 0xa6
	.4byte	.LASF165
	.byte	0x5
	.uleb128 0xa7
	.4byte	.LASF166
	.byte	0x5
	.uleb128 0xa8
	.4byte	.LASF167
	.byte	0x5
	.uleb128 0xa9
	.4byte	.LASF168
	.byte	0x5
	.uleb128 0xaa
	.4byte	.LASF169
	.byte	0x5
	.uleb128 0xab
	.4byte	.LASF170
	.byte	0x5
	.uleb128 0xac
	.4byte	.LASF171
	.byte	0x5
	.uleb128 0xad
	.4byte	.LASF172
	.byte	0x5
	.uleb128 0xae
	.4byte	.LASF173
	.byte	0x5
	.uleb128 0xaf
	.4byte	.LASF174
	.byte	0x5
	.uleb128 0xb0
	.4byte	.LASF175
	.byte	0x5
	.uleb128 0xb1
	.4byte	.LASF176
	.byte	0x5
	.uleb128 0xb2
	.4byte	.LASF177
	.byte	0x5
	.uleb128 0xb3
	.4byte	.LASF178
	.byte	0x5
	.uleb128 0xb4
	.4byte	.LASF179
	.byte	0x5
	.uleb128 0xb5
	.4byte	.LASF180
	.byte	0x5
	.uleb128 0xb6
	.4byte	.LASF181
	.byte	0x5
	.uleb128 0xb7
	.4byte	.LASF182
	.byte	0x5
	.uleb128 0xb8
	.4byte	.LASF183
	.byte	0x5
	.uleb128 0xb9
	.4byte	.LASF184
	.byte	0x5
	.uleb128 0xba
	.4byte	.LASF185
	.byte	0x5
	.uleb128 0xbb
	.4byte	.LASF186
	.byte	0x5
	.uleb128 0xbc
	.4byte	.LASF187
	.byte	0x5
	.uleb128 0xbd
	.4byte	.LASF188
	.byte	0x5
	.uleb128 0xbe
	.4byte	.LASF189
	.byte	0x5
	.uleb128 0xbf
	.4byte	.LASF190
	.byte	0x5
	.uleb128 0xc0
	.4byte	.LASF191
	.byte	0x5
	.uleb128 0xc1
	.4byte	.LASF192
	.byte	0x5
	.uleb128 0xc2
	.4byte	.LASF193
	.byte	0x5
	.uleb128 0xc3
	.4byte	.LASF194
	.byte	0x5
	.uleb128 0xc4
	.4byte	.LASF195
	.byte	0x5
	.uleb128 0xc5
	.4byte	.LASF196
	.byte	0x5
	.uleb128 0xc6
	.4byte	.LASF197
	.byte	0x5
	.uleb128 0xc7
	.4byte	.LASF198
	.byte	0x5
	.uleb128 0xc8
	.4byte	.LASF199
	.byte	0x5
	.uleb128 0xc9
	.4byte	.LASF200
	.byte	0x5
	.uleb128 0xca
	.4byte	.LASF201
	.byte	0x5
	.uleb128 0xcb
	.4byte	.LASF202
	.byte	0x5
	.uleb128 0xcc
	.4byte	.LASF203
	.byte	0x5
	.uleb128 0xcd
	.4byte	.LASF204
	.byte	0x5
	.uleb128 0xce
	.4byte	.LASF205
	.byte	0x5
	.uleb128 0xcf
	.4byte	.LASF206
	.byte	0x5
	.uleb128 0xd0
	.4byte	.LASF207
	.byte	0x5
	.uleb128 0xd1
	.4byte	.LASF208
	.byte	0x5
	.uleb128 0xd2
	.4byte	.LASF209
	.byte	0x5
	.uleb128 0xd3
	.4byte	.LASF210
	.byte	0x5
	.uleb128 0xd4
	.4byte	.LASF211
	.byte	0x5
	.uleb128 0xd5
	.4byte	.LASF212
	.byte	0x5
	.uleb128 0xd6
	.4byte	.LASF213
	.byte	0x5
	.uleb128 0xd7
	.4byte	.LASF214
	.byte	0x5
	.uleb128 0xd8
	.4byte	.LASF215
	.byte	0x5
	.uleb128 0xd9
	.4byte	.LASF216
	.byte	0x5
	.uleb128 0xda
	.4byte	.LASF217
	.byte	0x5
	.uleb128 0xdb
	.4byte	.LASF218
	.byte	0x5
	.uleb128 0xdc
	.4byte	.LASF219
	.byte	0x5
	.uleb128 0xdd
	.4byte	.LASF220
	.byte	0x5
	.uleb128 0xde
	.4byte	.LASF221
	.byte	0x5
	.uleb128 0xdf
	.4byte	.LASF222
	.byte	0x5
	.uleb128 0xe0
	.4byte	.LASF223
	.byte	0x5
	.uleb128 0xe1
	.4byte	.LASF224
	.byte	0x5
	.uleb128 0xe2
	.4byte	.LASF225
	.byte	0x5
	.uleb128 0xe3
	.4byte	.LASF226
	.byte	0x5
	.uleb128 0xe4
	.4byte	.LASF227
	.byte	0x5
	.uleb128 0xe5
	.4byte	.LASF228
	.byte	0x5
	.uleb128 0xe6
	.4byte	.LASF229
	.byte	0x5
	.uleb128 0xe7
	.4byte	.LASF230
	.byte	0x5
	.uleb128 0xe8
	.4byte	.LASF231
	.byte	0x5
	.uleb128 0xe9
	.4byte	.LASF232
	.byte	0x5
	.uleb128 0xea
	.4byte	.LASF233
	.byte	0x5
	.uleb128 0xeb
	.4byte	.LASF234
	.byte	0x5
	.uleb128 0xec
	.4byte	.LASF235
	.byte	0x5
	.uleb128 0xed
	.4byte	.LASF236
	.byte	0x5
	.uleb128 0xee
	.4byte	.LASF237
	.byte	0x5
	.uleb128 0xef
	.4byte	.LASF238
	.byte	0x5
	.uleb128 0xf0
	.4byte	.LASF239
	.byte	0x5
	.uleb128 0xf1
	.4byte	.LASF240
	.byte	0x5
	.uleb128 0xf2
	.4byte	.LASF241
	.byte	0x5
	.uleb128 0xf3
	.4byte	.LASF242
	.byte	0x5
	.uleb128 0xf4
	.4byte	.LASF243
	.byte	0x5
	.uleb128 0xf5
	.4byte	.LASF244
	.byte	0x5
	.uleb128 0xf6
	.4byte	.LASF245
	.byte	0x5
	.uleb128 0xf7
	.4byte	.LASF246
	.byte	0x5
	.uleb128 0xf8
	.4byte	.LASF247
	.byte	0x5
	.uleb128 0xf9
	.4byte	.LASF248
	.byte	0x5
	.uleb128 0xfa
	.4byte	.LASF249
	.byte	0x5
	.uleb128 0xfb
	.4byte	.LASF250
	.byte	0x5
	.uleb128 0xfc
	.4byte	.LASF251
	.byte	0x5
	.uleb128 0xfd
	.4byte	.LASF252
	.byte	0x5
	.uleb128 0xfe
	.4byte	.LASF253
	.byte	0x5
	.uleb128 0xff
	.4byte	.LASF254
	.byte	0x5
	.uleb128 0x100
	.4byte	.LASF255
	.byte	0x5
	.uleb128 0x101
	.4byte	.LASF256
	.byte	0x5
	.uleb128 0x102
	.4byte	.LASF257
	.byte	0x5
	.uleb128 0x103
	.4byte	.LASF258
	.byte	0x5
	.uleb128 0x104
	.4byte	.LASF259
	.byte	0x5
	.uleb128 0x105
	.4byte	.LASF260
	.byte	0x5
	.uleb128 0x106
	.4byte	.LASF261
	.byte	0x5
	.uleb128 0x107
	.4byte	.LASF262
	.byte	0x5
	.uleb128 0x108
	.4byte	.LASF263
	.byte	0x5
	.uleb128 0x109
	.4byte	.LASF264
	.byte	0x5
	.uleb128 0x10a
	.4byte	.LASF265
	.byte	0x5
	.uleb128 0x10b
	.4byte	.LASF266
	.byte	0x5
	.uleb128 0x10c
	.4byte	.LASF267
	.byte	0x5
	.uleb128 0x10d
	.4byte	.LASF268
	.byte	0x5
	.uleb128 0x10e
	.4byte	.LASF269
	.byte	0x5
	.uleb128 0x10f
	.4byte	.LASF270
	.byte	0x5
	.uleb128 0x110
	.4byte	.LASF271
	.byte	0x5
	.uleb128 0x111
	.4byte	.LASF272
	.byte	0x5
	.uleb128 0x112
	.4byte	.LASF273
	.byte	0x5
	.uleb128 0x113
	.4byte	.LASF274
	.byte	0x5
	.uleb128 0x114
	.4byte	.LASF275
	.byte	0x5
	.uleb128 0x115
	.4byte	.LASF276
	.byte	0x5
	.uleb128 0x116
	.4byte	.LASF277
	.byte	0x5
	.uleb128 0x117
	.4byte	.LASF278
	.byte	0x5
	.uleb128 0x118
	.4byte	.LASF279
	.byte	0x5
	.uleb128 0x119
	.4byte	.LASF280
	.byte	0x5
	.uleb128 0x11a
	.4byte	.LASF281
	.byte	0x5
	.uleb128 0x11b
	.4byte	.LASF282
	.byte	0x5
	.uleb128 0x11c
	.4byte	.LASF283
	.byte	0x5
	.uleb128 0x11d
	.4byte	.LASF284
	.byte	0x5
	.uleb128 0x11e
	.4byte	.LASF285
	.byte	0x5
	.uleb128 0x11f
	.4byte	.LASF286
	.byte	0x5
	.uleb128 0x120
	.4byte	.LASF287
	.byte	0x5
	.uleb128 0x121
	.4byte	.LASF288
	.byte	0x5
	.uleb128 0x122
	.4byte	.LASF289
	.byte	0x5
	.uleb128 0x123
	.4byte	.LASF290
	.byte	0x5
	.uleb128 0x124
	.4byte	.LASF291
	.byte	0x5
	.uleb128 0x125
	.4byte	.LASF292
	.byte	0x5
	.uleb128 0x126
	.4byte	.LASF293
	.byte	0x5
	.uleb128 0x127
	.4byte	.LASF294
	.byte	0x5
	.uleb128 0x128
	.4byte	.LASF295
	.byte	0x5
	.uleb128 0x129
	.4byte	.LASF296
	.byte	0x5
	.uleb128 0x12a
	.4byte	.LASF297
	.byte	0x5
	.uleb128 0x12b
	.4byte	.LASF298
	.byte	0x5
	.uleb128 0x12c
	.4byte	.LASF299
	.byte	0x5
	.uleb128 0x12d
	.4byte	.LASF300
	.byte	0x5
	.uleb128 0x12e
	.4byte	.LASF301
	.byte	0x5
	.uleb128 0x12f
	.4byte	.LASF302
	.byte	0x5
	.uleb128 0x130
	.4byte	.LASF303
	.byte	0x5
	.uleb128 0x131
	.4byte	.LASF304
	.byte	0x5
	.uleb128 0x132
	.4byte	.LASF305
	.byte	0x5
	.uleb128 0x133
	.4byte	.LASF306
	.byte	0x5
	.uleb128 0x134
	.4byte	.LASF307
	.byte	0x5
	.uleb128 0x135
	.4byte	.LASF308
	.byte	0x5
	.uleb128 0x136
	.4byte	.LASF309
	.byte	0x5
	.uleb128 0x137
	.4byte	.LASF310
	.byte	0x5
	.uleb128 0x138
	.4byte	.LASF311
	.byte	0x5
	.uleb128 0x139
	.4byte	.LASF312
	.byte	0x5
	.uleb128 0x13a
	.4byte	.LASF313
	.byte	0x5
	.uleb128 0x13b
	.4byte	.LASF314
	.byte	0x5
	.uleb128 0x13c
	.4byte	.LASF315
	.byte	0x5
	.uleb128 0x13d
	.4byte	.LASF316
	.byte	0x5
	.uleb128 0x13e
	.4byte	.LASF317
	.byte	0x5
	.uleb128 0x13f
	.4byte	.LASF318
	.byte	0x5
	.uleb128 0x140
	.4byte	.LASF319
	.byte	0x5
	.uleb128 0x141
	.4byte	.LASF320
	.byte	0x5
	.uleb128 0x142
	.4byte	.LASF321
	.byte	0x5
	.uleb128 0x143
	.4byte	.LASF322
	.byte	0x5
	.uleb128 0x144
	.4byte	.LASF323
	.byte	0x5
	.uleb128 0x145
	.4byte	.LASF324
	.byte	0x5
	.uleb128 0x146
	.4byte	.LASF325
	.byte	0x5
	.uleb128 0x147
	.4byte	.LASF326
	.byte	0x5
	.uleb128 0x148
	.4byte	.LASF327
	.byte	0x5
	.uleb128 0x149
	.4byte	.LASF328
	.byte	0x5
	.uleb128 0x14a
	.4byte	.LASF329
	.byte	0x5
	.uleb128 0x14b
	.4byte	.LASF330
	.byte	0x5
	.uleb128 0x14c
	.4byte	.LASF331
	.byte	0x5
	.uleb128 0x14d
	.4byte	.LASF332
	.byte	0x5
	.uleb128 0x14e
	.4byte	.LASF333
	.byte	0x5
	.uleb128 0x14f
	.4byte	.LASF334
	.byte	0x5
	.uleb128 0x150
	.4byte	.LASF335
	.byte	0x5
	.uleb128 0x151
	.4byte	.LASF336
	.byte	0x5
	.uleb128 0x152
	.4byte	.LASF337
	.byte	0x5
	.uleb128 0x153
	.4byte	.LASF338
	.byte	0x5
	.uleb128 0x154
	.4byte	.LASF339
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF340
	.byte	0x3
	.uleb128 0xa
	.uleb128 0x6
	.byte	0x5
	.uleb128 0xa
	.4byte	.LASF341
	.byte	0x3
	.uleb128 0xc
	.uleb128 0x4
	.byte	0x5
	.uleb128 0xa
	.4byte	.LASF342
	.file 7 "c:\\freescale\\kds_3.0.0\\toolchain\\lib\\gcc\\arm-none-eabi\\4.8.4\\include\\stdint.h"
	.byte	0x3
	.uleb128 0x12
	.uleb128 0x7
	.byte	0x3
	.uleb128 0x9
	.uleb128 0x3
	.byte	0x5
	.uleb128 0xa
	.4byte	.LASF343
	.byte	0x3
	.uleb128 0xc
	.uleb128 0x2
	.byte	0x5
	.uleb128 0x6
	.4byte	.LASF344
	.file 8 "c:\\freescale\\kds_3.0.0\\toolchain\\arm-none-eabi\\include\\sys\\features.h"
	.byte	0x3
	.uleb128 0x8
	.uleb128 0x8
	.byte	0x7
	.4byte	.Ldebug_macro1
	.byte	0x4
	.byte	0x7
	.4byte	.Ldebug_macro2
	.byte	0x4
	.byte	0x7
	.4byte	.Ldebug_macro3
	.byte	0x4
	.byte	0x5
	.uleb128 0xd
	.4byte	.LASF434
	.byte	0x4
	.byte	0x7
	.4byte	.Ldebug_macro4
	.byte	0x4
	.byte	0x3
	.uleb128 0xd
	.uleb128 0x5
	.byte	0x7
	.4byte	.Ldebug_macro5
	.byte	0x4
	.byte	0x5
	.uleb128 0xf
	.4byte	.LASF636
	.byte	0x4
	.byte	0x3
	.uleb128 0xb
	.uleb128 0x5
	.byte	0x4
	.file 9 "../include/R_RTOS_task.h"
	.byte	0x3
	.uleb128 0xc
	.uleb128 0x9
	.byte	0x5
	.uleb128 0xa
	.4byte	.LASF637
	.byte	0x4
	.byte	0x4
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.features.h.22.6a4ca7cd053637cc1d0db6c16f39b2d7,comdat
.Ldebug_macro1:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x16
	.4byte	.LASF345
	.byte	0x5
	.uleb128 0x1f
	.4byte	.LASF346
	.byte	0x5
	.uleb128 0x26
	.4byte	.LASF347
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4._default_types.h.15.8b2cb27e528498f8ff711db085d6e489,comdat
.Ldebug_macro2:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0xf
	.4byte	.LASF348
	.byte	0x5
	.uleb128 0x1d
	.4byte	.LASF349
	.byte	0x5
	.uleb128 0x27
	.4byte	.LASF350
	.byte	0x5
	.uleb128 0x39
	.4byte	.LASF351
	.byte	0x5
	.uleb128 0x4f
	.4byte	.LASF352
	.byte	0x5
	.uleb128 0x6a
	.4byte	.LASF353
	.byte	0x5
	.uleb128 0x80
	.4byte	.LASF354
	.byte	0x5
	.uleb128 0x92
	.4byte	.LASF355
	.byte	0x5
	.uleb128 0xa0
	.4byte	.LASF356
	.byte	0x6
	.uleb128 0xb2
	.4byte	.LASF357
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.stdint.h.20.796e373797e732130a803d4c0338fa1b,comdat
.Ldebug_macro3:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x14
	.4byte	.LASF358
	.byte	0x5
	.uleb128 0x1e
	.4byte	.LASF359
	.byte	0x5
	.uleb128 0x25
	.4byte	.LASF360
	.byte	0x5
	.uleb128 0x2b
	.4byte	.LASF361
	.byte	0x5
	.uleb128 0x31
	.4byte	.LASF362
	.byte	0x5
	.uleb128 0x37
	.4byte	.LASF363
	.byte	0x5
	.uleb128 0x3d
	.4byte	.LASF364
	.byte	0x5
	.uleb128 0x43
	.4byte	.LASF365
	.byte	0x5
	.uleb128 0x49
	.4byte	.LASF366
	.byte	0x5
	.uleb128 0x4f
	.4byte	.LASF367
	.byte	0x5
	.uleb128 0x55
	.4byte	.LASF368
	.byte	0x5
	.uleb128 0x61
	.4byte	.LASF369
	.byte	0x5
	.uleb128 0x6b
	.4byte	.LASF370
	.byte	0x5
	.uleb128 0x75
	.4byte	.LASF371
	.byte	0x5
	.uleb128 0x7f
	.4byte	.LASF372
	.byte	0x5
	.uleb128 0xc2
	.4byte	.LASF373
	.byte	0x5
	.uleb128 0xc3
	.4byte	.LASF374
	.byte	0x5
	.uleb128 0xc4
	.4byte	.LASF375
	.byte	0x5
	.uleb128 0xda
	.4byte	.LASF376
	.byte	0x5
	.uleb128 0xdb
	.4byte	.LASF377
	.byte	0x5
	.uleb128 0xdc
	.4byte	.LASF378
	.byte	0x5
	.uleb128 0xe4
	.4byte	.LASF379
	.byte	0x5
	.uleb128 0xe5
	.4byte	.LASF380
	.byte	0x5
	.uleb128 0xe6
	.4byte	.LASF381
	.byte	0x5
	.uleb128 0xf0
	.4byte	.LASF382
	.byte	0x5
	.uleb128 0xf1
	.4byte	.LASF383
	.byte	0x5
	.uleb128 0xf2
	.4byte	.LASF384
	.byte	0x5
	.uleb128 0xfa
	.4byte	.LASF385
	.byte	0x5
	.uleb128 0xfb
	.4byte	.LASF386
	.byte	0x5
	.uleb128 0xfc
	.4byte	.LASF387
	.byte	0x5
	.uleb128 0x106
	.4byte	.LASF388
	.byte	0x5
	.uleb128 0x107
	.4byte	.LASF389
	.byte	0x5
	.uleb128 0x108
	.4byte	.LASF390
	.byte	0x5
	.uleb128 0x116
	.4byte	.LASF391
	.byte	0x5
	.uleb128 0x117
	.4byte	.LASF392
	.byte	0x5
	.uleb128 0x118
	.4byte	.LASF393
	.byte	0x5
	.uleb128 0x128
	.4byte	.LASF394
	.byte	0x5
	.uleb128 0x129
	.4byte	.LASF395
	.byte	0x5
	.uleb128 0x12a
	.4byte	.LASF396
	.byte	0x5
	.uleb128 0x138
	.4byte	.LASF397
	.byte	0x5
	.uleb128 0x139
	.4byte	.LASF398
	.byte	0x5
	.uleb128 0x13a
	.4byte	.LASF399
	.byte	0x5
	.uleb128 0x148
	.4byte	.LASF400
	.byte	0x5
	.uleb128 0x149
	.4byte	.LASF401
	.byte	0x5
	.uleb128 0x14a
	.4byte	.LASF402
	.byte	0x5
	.uleb128 0x158
	.4byte	.LASF403
	.byte	0x5
	.uleb128 0x159
	.4byte	.LASF404
	.byte	0x5
	.uleb128 0x15a
	.4byte	.LASF405
	.byte	0x5
	.uleb128 0x168
	.4byte	.LASF406
	.byte	0x5
	.uleb128 0x169
	.4byte	.LASF407
	.byte	0x5
	.uleb128 0x16a
	.4byte	.LASF408
	.byte	0x5
	.uleb128 0x178
	.4byte	.LASF409
	.byte	0x5
	.uleb128 0x179
	.4byte	.LASF410
	.byte	0x5
	.uleb128 0x17a
	.4byte	.LASF411
	.byte	0x5
	.uleb128 0x188
	.4byte	.LASF412
	.byte	0x5
	.uleb128 0x189
	.4byte	.LASF413
	.byte	0x5
	.uleb128 0x191
	.4byte	.LASF414
	.byte	0x5
	.uleb128 0x199
	.4byte	.LASF415
	.byte	0x5
	.uleb128 0x19f
	.4byte	.LASF416
	.byte	0x5
	.uleb128 0x1a0
	.4byte	.LASF417
	.byte	0x5
	.uleb128 0x1a4
	.4byte	.LASF418
	.byte	0x5
	.uleb128 0x1a8
	.4byte	.LASF419
	.byte	0x5
	.uleb128 0x1ab
	.4byte	.LASF420
	.byte	0x5
	.uleb128 0x1ae
	.4byte	.LASF421
	.byte	0x5
	.uleb128 0x1b3
	.4byte	.LASF422
	.byte	0x5
	.uleb128 0x1b8
	.4byte	.LASF423
	.byte	0x5
	.uleb128 0x1bf
	.4byte	.LASF424
	.byte	0x5
	.uleb128 0x1c0
	.4byte	.LASF425
	.byte	0x5
	.uleb128 0x1cb
	.4byte	.LASF426
	.byte	0x5
	.uleb128 0x1cc
	.4byte	.LASF427
	.byte	0x5
	.uleb128 0x1d7
	.4byte	.LASF428
	.byte	0x5
	.uleb128 0x1d8
	.4byte	.LASF429
	.byte	0x5
	.uleb128 0x1e4
	.4byte	.LASF430
	.byte	0x5
	.uleb128 0x1e5
	.4byte	.LASF431
	.byte	0x5
	.uleb128 0x1f4
	.4byte	.LASF432
	.byte	0x5
	.uleb128 0x1f5
	.4byte	.LASF433
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.R_RTOS_inc.h.33.673e81b7c65bad7fa1d77c307c4a1d01,comdat
.Ldebug_macro4:
	.2byte	0x4
	.byte	0
	.byte	0x6
	.uleb128 0x21
	.4byte	.LASF435
	.byte	0x5
	.uleb128 0x27
	.4byte	.LASF436
	.byte	0x5
	.uleb128 0x2e
	.4byte	.LASF437
	.byte	0x5
	.uleb128 0x34
	.4byte	.LASF438
	.byte	0x5
	.uleb128 0x39
	.4byte	.LASF439
	.byte	0x5
	.uleb128 0x3e
	.4byte	.LASF440
	.byte	0x5
	.uleb128 0x42
	.4byte	.LASF441
	.byte	0x5
	.uleb128 0x4b
	.4byte	.LASF442
	.byte	0x5
	.uleb128 0x50
	.4byte	.LASF443
	.byte	0x5
	.uleb128 0x54
	.4byte	.LASF444
	.byte	0x5
	.uleb128 0x59
	.4byte	.LASF445
	.byte	0x5
	.uleb128 0x5d
	.4byte	.LASF446
	.byte	0x5
	.uleb128 0x65
	.4byte	.LASF447
	.byte	0x5
	.uleb128 0x6d
	.4byte	.LASF448
	.byte	0x5
	.uleb128 0x74
	.4byte	.LASF449
	.byte	0x5
	.uleb128 0x7e
	.4byte	.LASF450
	.byte	0x5
	.uleb128 0x82
	.4byte	.LASF451
	.byte	0x5
	.uleb128 0x90
	.4byte	.LASF452
	.byte	0x5
	.uleb128 0x97
	.4byte	.LASF453
	.byte	0x5
	.uleb128 0x9f
	.4byte	.LASF454
	.byte	0x5
	.uleb128 0xa8
	.4byte	.LASF455
	.byte	0x5
	.uleb128 0xae
	.4byte	.LASF456
	.byte	0x5
	.uleb128 0xc3
	.4byte	.LASF457
	.byte	0x5
	.uleb128 0xcb
	.4byte	.LASF458
	.byte	0x5
	.uleb128 0xd0
	.4byte	.LASF459
	.byte	0x5
	.uleb128 0xd5
	.4byte	.LASF460
	.byte	0x5
	.uleb128 0xd9
	.4byte	.LASF461
	.byte	0x5
	.uleb128 0xe6
	.4byte	.LASF462
	.byte	0x5
	.uleb128 0xf1
	.4byte	.LASF463
	.byte	0x5
	.uleb128 0xf6
	.4byte	.LASF464
	.byte	0x5
	.uleb128 0xfb
	.4byte	.LASF465
	.byte	0x5
	.uleb128 0x100
	.4byte	.LASF466
	.byte	0x5
	.uleb128 0x104
	.4byte	.LASF467
	.byte	0x5
	.uleb128 0x108
	.4byte	.LASF468
	.byte	0x5
	.uleb128 0x10e
	.4byte	.LASF469
	.byte	0x5
	.uleb128 0x114
	.4byte	.LASF470
	.byte	0x5
	.uleb128 0x118
	.4byte	.LASF471
	.byte	0x5
	.uleb128 0x11c
	.4byte	.LASF472
	.byte	0x5
	.uleb128 0x120
	.4byte	.LASF473
	.byte	0x5
	.uleb128 0x124
	.4byte	.LASF474
	.byte	0x5
	.uleb128 0x128
	.4byte	.LASF475
	.byte	0x5
	.uleb128 0x12c
	.4byte	.LASF476
	.byte	0x5
	.uleb128 0x133
	.4byte	.LASF477
	.byte	0x5
	.uleb128 0x137
	.4byte	.LASF478
	.byte	0x5
	.uleb128 0x13b
	.4byte	.LASF479
	.byte	0x5
	.uleb128 0x13f
	.4byte	.LASF480
	.byte	0x5
	.uleb128 0x55d
	.4byte	.LASF481
	.byte	0x5
	.uleb128 0x562
	.4byte	.LASF482
	.byte	0x5
	.uleb128 0x569
	.4byte	.LASF483
	.byte	0x5
	.uleb128 0x56c
	.4byte	.LASF484
	.byte	0x5
	.uleb128 0x57a
	.4byte	.LASF485
	.byte	0x5
	.uleb128 0x57f
	.4byte	.LASF486
	.byte	0x5
	.uleb128 0x588
	.4byte	.LASF487
	.byte	0x5
	.uleb128 0x58c
	.4byte	.LASF488
	.byte	0x5
	.uleb128 0x590
	.4byte	.LASF489
	.byte	0x5
	.uleb128 0x594
	.4byte	.LASF490
	.byte	0x5
	.uleb128 0x598
	.4byte	.LASF491
	.byte	0x5
	.uleb128 0x59c
	.4byte	.LASF492
	.byte	0x5
	.uleb128 0x5a0
	.4byte	.LASF493
	.byte	0x5
	.uleb128 0x5a4
	.4byte	.LASF494
	.byte	0x5
	.uleb128 0x5a8
	.4byte	.LASF495
	.byte	0x5
	.uleb128 0x5ac
	.4byte	.LASF496
	.byte	0x5
	.uleb128 0x5b0
	.4byte	.LASF497
	.byte	0x5
	.uleb128 0x5b4
	.4byte	.LASF498
	.byte	0x5
	.uleb128 0x5b8
	.4byte	.LASF499
	.byte	0x5
	.uleb128 0x5bc
	.4byte	.LASF500
	.byte	0x5
	.uleb128 0x5c0
	.4byte	.LASF501
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.R_RTOS_memMngr.h.14.e71363defcaed3db880eddd5ae4849f6,comdat
.Ldebug_macro5:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0xe
	.4byte	.LASF502
	.byte	0x5
	.uleb128 0x14
	.4byte	.LASF503
	.byte	0x5
	.uleb128 0x18
	.4byte	.LASF504
	.byte	0x5
	.uleb128 0x1c
	.4byte	.LASF505
	.byte	0x5
	.uleb128 0x20
	.4byte	.LASF506
	.byte	0x5
	.uleb128 0x2b
	.4byte	.LASF507
	.byte	0x5
	.uleb128 0x32
	.4byte	.LASF508
	.byte	0x5
	.uleb128 0x39
	.4byte	.LASF509
	.byte	0x5
	.uleb128 0x42
	.4byte	.LASF510
	.byte	0x5
	.uleb128 0x49
	.4byte	.LASF511
	.byte	0x5
	.uleb128 0x50
	.4byte	.LASF512
	.byte	0x5
	.uleb128 0x59
	.4byte	.LASF513
	.byte	0x5
	.uleb128 0x118
	.4byte	.LASF514
	.byte	0x5
	.uleb128 0x119
	.4byte	.LASF515
	.byte	0x5
	.uleb128 0x11c
	.4byte	.LASF516
	.byte	0x5
	.uleb128 0x11d
	.4byte	.LASF517
	.byte	0x5
	.uleb128 0x11e
	.4byte	.LASF518
	.byte	0x5
	.uleb128 0x11f
	.4byte	.LASF519
	.byte	0x5
	.uleb128 0x120
	.4byte	.LASF520
	.byte	0x5
	.uleb128 0x121
	.4byte	.LASF521
	.byte	0x5
	.uleb128 0x122
	.4byte	.LASF522
	.byte	0x5
	.uleb128 0x13c
	.4byte	.LASF523
	.byte	0x5
	.uleb128 0x13d
	.4byte	.LASF524
	.byte	0x5
	.uleb128 0x13e
	.4byte	.LASF525
	.byte	0x5
	.uleb128 0x13f
	.4byte	.LASF526
	.byte	0x5
	.uleb128 0x140
	.4byte	.LASF527
	.byte	0x5
	.uleb128 0x141
	.4byte	.LASF528
	.byte	0x5
	.uleb128 0x142
	.4byte	.LASF529
	.byte	0x5
	.uleb128 0x143
	.4byte	.LASF530
	.byte	0x5
	.uleb128 0x144
	.4byte	.LASF531
	.byte	0x5
	.uleb128 0x145
	.4byte	.LASF532
	.byte	0x5
	.uleb128 0x146
	.4byte	.LASF533
	.byte	0x5
	.uleb128 0x147
	.4byte	.LASF534
	.byte	0x5
	.uleb128 0x148
	.4byte	.LASF535
	.byte	0x5
	.uleb128 0x149
	.4byte	.LASF536
	.byte	0x5
	.uleb128 0x14a
	.4byte	.LASF537
	.byte	0x5
	.uleb128 0x14b
	.4byte	.LASF538
	.byte	0x5
	.uleb128 0x14c
	.4byte	.LASF539
	.byte	0x5
	.uleb128 0x14d
	.4byte	.LASF540
	.byte	0x5
	.uleb128 0x14e
	.4byte	.LASF541
	.byte	0x5
	.uleb128 0x14f
	.4byte	.LASF542
	.byte	0x5
	.uleb128 0x150
	.4byte	.LASF543
	.byte	0x5
	.uleb128 0x151
	.4byte	.LASF544
	.byte	0x5
	.uleb128 0x152
	.4byte	.LASF545
	.byte	0x5
	.uleb128 0x153
	.4byte	.LASF546
	.byte	0x5
	.uleb128 0x154
	.4byte	.LASF547
	.byte	0x5
	.uleb128 0x155
	.4byte	.LASF548
	.byte	0x5
	.uleb128 0x156
	.4byte	.LASF549
	.byte	0x5
	.uleb128 0x157
	.4byte	.LASF550
	.byte	0x5
	.uleb128 0x158
	.4byte	.LASF551
	.byte	0x5
	.uleb128 0x159
	.4byte	.LASF552
	.byte	0x5
	.uleb128 0x15a
	.4byte	.LASF553
	.byte	0x5
	.uleb128 0x15b
	.4byte	.LASF554
	.byte	0x5
	.uleb128 0x15d
	.4byte	.LASF555
	.byte	0x5
	.uleb128 0x15f
	.4byte	.LASF556
	.byte	0x5
	.uleb128 0x160
	.4byte	.LASF557
	.byte	0x5
	.uleb128 0x161
	.4byte	.LASF558
	.byte	0x5
	.uleb128 0x162
	.4byte	.LASF559
	.byte	0x5
	.uleb128 0x163
	.4byte	.LASF560
	.byte	0x5
	.uleb128 0x164
	.4byte	.LASF561
	.byte	0x5
	.uleb128 0x165
	.4byte	.LASF562
	.byte	0x5
	.uleb128 0x166
	.4byte	.LASF563
	.byte	0x5
	.uleb128 0x167
	.4byte	.LASF564
	.byte	0x5
	.uleb128 0x168
	.4byte	.LASF565
	.byte	0x5
	.uleb128 0x169
	.4byte	.LASF566
	.byte	0x5
	.uleb128 0x16a
	.4byte	.LASF567
	.byte	0x5
	.uleb128 0x16b
	.4byte	.LASF568
	.byte	0x5
	.uleb128 0x16c
	.4byte	.LASF569
	.byte	0x5
	.uleb128 0x16d
	.4byte	.LASF570
	.byte	0x5
	.uleb128 0x16e
	.4byte	.LASF571
	.byte	0x5
	.uleb128 0x16f
	.4byte	.LASF572
	.byte	0x5
	.uleb128 0x170
	.4byte	.LASF573
	.byte	0x5
	.uleb128 0x171
	.4byte	.LASF574
	.byte	0x5
	.uleb128 0x173
	.4byte	.LASF575
	.byte	0x5
	.uleb128 0x174
	.4byte	.LASF576
	.byte	0x5
	.uleb128 0x181
	.4byte	.LASF577
	.byte	0x5
	.uleb128 0x182
	.4byte	.LASF578
	.byte	0x5
	.uleb128 0x183
	.4byte	.LASF579
	.byte	0x5
	.uleb128 0x19d
	.4byte	.LASF580
	.byte	0x5
	.uleb128 0x19e
	.4byte	.LASF581
	.byte	0x5
	.uleb128 0x19f
	.4byte	.LASF582
	.byte	0x5
	.uleb128 0x1a0
	.4byte	.LASF583
	.byte	0x5
	.uleb128 0x1a1
	.4byte	.LASF584
	.byte	0x5
	.uleb128 0x1a2
	.4byte	.LASF585
	.byte	0x5
	.uleb128 0x1a3
	.4byte	.LASF586
	.byte	0x5
	.uleb128 0x1a4
	.4byte	.LASF587
	.byte	0x5
	.uleb128 0x1a5
	.4byte	.LASF588
	.byte	0x5
	.uleb128 0x1a6
	.4byte	.LASF589
	.byte	0x5
	.uleb128 0x1a7
	.4byte	.LASF590
	.byte	0x5
	.uleb128 0x1a8
	.4byte	.LASF591
	.byte	0x5
	.uleb128 0x1a9
	.4byte	.LASF592
	.byte	0x5
	.uleb128 0x1aa
	.4byte	.LASF593
	.byte	0x5
	.uleb128 0x1ab
	.4byte	.LASF594
	.byte	0x5
	.uleb128 0x1ac
	.4byte	.LASF595
	.byte	0x5
	.uleb128 0x1ad
	.4byte	.LASF596
	.byte	0x5
	.uleb128 0x1ae
	.4byte	.LASF597
	.byte	0x5
	.uleb128 0x1af
	.4byte	.LASF598
	.byte	0x5
	.uleb128 0x1b0
	.4byte	.LASF599
	.byte	0x5
	.uleb128 0x1b1
	.4byte	.LASF600
	.byte	0x5
	.uleb128 0x1b2
	.4byte	.LASF601
	.byte	0x5
	.uleb128 0x1b3
	.4byte	.LASF602
	.byte	0x5
	.uleb128 0x1b4
	.4byte	.LASF603
	.byte	0x5
	.uleb128 0x1b5
	.4byte	.LASF604
	.byte	0x5
	.uleb128 0x1b6
	.4byte	.LASF605
	.byte	0x5
	.uleb128 0x1b7
	.4byte	.LASF606
	.byte	0x5
	.uleb128 0x1b8
	.4byte	.LASF607
	.byte	0x5
	.uleb128 0x1b9
	.4byte	.LASF608
	.byte	0x5
	.uleb128 0x1ba
	.4byte	.LASF609
	.byte	0x5
	.uleb128 0x1bb
	.4byte	.LASF610
	.byte	0x5
	.uleb128 0x1bc
	.4byte	.LASF611
	.byte	0x5
	.uleb128 0x1be
	.4byte	.LASF612
	.byte	0x5
	.uleb128 0x1bf
	.4byte	.LASF613
	.byte	0x5
	.uleb128 0x1c0
	.4byte	.LASF614
	.byte	0x5
	.uleb128 0x1c1
	.4byte	.LASF615
	.byte	0x5
	.uleb128 0x1c2
	.4byte	.LASF616
	.byte	0x5
	.uleb128 0x1c3
	.4byte	.LASF617
	.byte	0x5
	.uleb128 0x1c4
	.4byte	.LASF618
	.byte	0x5
	.uleb128 0x1c5
	.4byte	.LASF619
	.byte	0x5
	.uleb128 0x1c6
	.4byte	.LASF620
	.byte	0x5
	.uleb128 0x1c7
	.4byte	.LASF621
	.byte	0x5
	.uleb128 0x1c8
	.4byte	.LASF622
	.byte	0x5
	.uleb128 0x1c9
	.4byte	.LASF623
	.byte	0x5
	.uleb128 0x1ca
	.4byte	.LASF624
	.byte	0x5
	.uleb128 0x1cb
	.4byte	.LASF625
	.byte	0x5
	.uleb128 0x1d1
	.4byte	.LASF626
	.byte	0x5
	.uleb128 0x1d2
	.4byte	.LASF627
	.byte	0x5
	.uleb128 0x1d3
	.4byte	.LASF628
	.byte	0x5
	.uleb128 0x1d4
	.4byte	.LASF629
	.byte	0x5
	.uleb128 0x1d5
	.4byte	.LASF630
	.byte	0x5
	.uleb128 0x1d6
	.4byte	.LASF631
	.byte	0x5
	.uleb128 0x1d7
	.4byte	.LASF632
	.byte	0x5
	.uleb128 0x1d8
	.4byte	.LASF633
	.byte	0x5
	.uleb128 0x1d9
	.4byte	.LASF634
	.byte	0x5
	.uleb128 0x1db
	.4byte	.LASF635
	.byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF237:
	.ascii	"__ACCUM_EPSILON__ 0x1P-15K\000"
.LASF577:
	.ascii	"MEM_FLG_ISCOMBO(memFlgs) (MemSize)((MEM_FLG_GET_MEM"
	.ascii	"SIZE(memFlgs) & (MemSize)(MEM_FLG_GET_MEMSIZE(memFl"
	.ascii	"gs)-(MemSize)1u)) ? 1u : 0u)\000"
.LASF309:
	.ascii	"__GCC_ATOMIC_SHORT_LOCK_FREE 1\000"
.LASF62:
	.ascii	"__UINT_FAST64_TYPE__ long long unsigned int\000"
.LASF462:
	.ascii	"CREATE_EVT_MSK(evtNr) (EVTQSlots)((EVTQSlots)0x1u <"
	.ascii	"< evtNr)\000"
.LASF70:
	.ascii	"__LONG_LONG_MAX__ 9223372036854775807LL\000"
.LASF175:
	.ascii	"__DEC64_SUBNORMAL_MIN__ 0.000000000000001E-383DD\000"
.LASF117:
	.ascii	"__FLT_EVAL_METHOD__ 0\000"
.LASF318:
	.ascii	"__SIZEOF_WINT_T__ 4\000"
.LASF597:
	.ascii	"MEM_FLGS_PRV_BGGSTBLCK_MSK MEM_FLGS_BGGSTBLCK_MSK\000"
.LASF356:
	.ascii	"___int_least64_t_defined 1\000"
.LASF360:
	.ascii	"__have_long32 1\000"
.LASF61:
	.ascii	"__UINT_FAST32_TYPE__ unsigned int\000"
.LASF413:
	.ascii	"INTMAX_MIN (-INTMAX_MAX - 1)\000"
.LASF595:
	.ascii	"MEM_FLGS_PRV_SPLT_128_MSK MEM_FLGS_SPLT_128_MSK\000"
.LASF174:
	.ascii	"__DEC64_EPSILON__ 1E-15DD\000"
.LASF685:
	.ascii	"PMntrWaitr\000"
.LASF91:
	.ascii	"__INT_LEAST8_MAX__ 127\000"
.LASF386:
	.ascii	"INT_LEAST16_MAX __INT_LEAST16_MAX__\000"
.LASF483:
	.ascii	"MAX_TASKS NR_OF_TSKS\000"
.LASF83:
	.ascii	"__INT8_MAX__ 127\000"
.LASF397:
	.ascii	"INT_LEAST64_MIN (-__INT_LEAST64_MAX__ - 1)\000"
.LASF100:
	.ascii	"__UINT8_C(c) c\000"
.LASF579:
	.ascii	"MEM_FLG_SMALLER_COMBO(memFlgs) (MemSize)(MEM_FLG_GE"
	.ascii	"T_MEMSIZE(memFlgs) & (MemSize)(-MEM_FLG_GET_MEMSIZE"
	.ascii	"(memFlgs)))\000"
.LASF85:
	.ascii	"__INT32_MAX__ 2147483647L\000"
.LASF610:
	.ascii	"MEM_FLGS_CACHED_SHFT ((MemFlags)0xFu)\000"
.LASF69:
	.ascii	"__LONG_MAX__ 2147483647L\000"
.LASF280:
	.ascii	"__UDQ_IBIT__ 0\000"
.LASF431:
	.ascii	"UINT64_C(x) __UINT64_C(x)\000"
.LASF127:
	.ascii	"__FLT_MAX__ 3.4028234663852886e+38F\000"
.LASF675:
	.ascii	"MNTR_PENDING_WRITE\000"
.LASF136:
	.ascii	"__DBL_MIN_EXP__ (-1021)\000"
.LASF306:
	.ascii	"__GCC_ATOMIC_CHAR16_T_LOCK_FREE 1\000"
.LASF97:
	.ascii	"__INT_LEAST64_MAX__ 9223372036854775807LL\000"
.LASF544:
	.ascii	"MEM_FLGS_MERGE1024_MSK ((MemFlags)0x400u)\000"
.LASF620:
	.ascii	"MEM_FLG_CLR_NXT_SPLT(pMemMngrHead) MEM_FLG_CLR_BIT_"
	.ascii	"MSK(pMemMngrHead, MEM_FLGS_NXT_SPLT_MSK, additional"
	.ascii	"Flags)\000"
.LASF684:
	.ascii	"tskID\000"
.LASF346:
	.ascii	"__GNUC_PREREQ(maj,min) ((__GNUC__ << 16) + __GNUC_M"
	.ascii	"INOR__ >= ((maj) << 16) + (min))\000"
.LASF141:
	.ascii	"__DBL_MAX__ ((double)1.7976931348623157e+308L)\000"
.LASF190:
	.ascii	"__USFRACT_MIN__ 0.0UHR\000"
.LASF409:
	.ascii	"INT_FAST64_MIN (-__INT_FAST64_MAX__ - 1)\000"
.LASF74:
	.ascii	"__WINT_MIN__ 0U\000"
.LASF565:
	.ascii	"MEM_FLG_ISSPLIT(memFlgs) MEM_FLG_PARSE(memFlgs,MEM_"
	.ascii	"FLGS_SPLT_SHFT)\000"
.LASF581:
	.ascii	"MEM_FLGS_ISBLCKBEG_MSK ((MemFlags)0x1u)\000"
.LASF4:
	.ascii	"__GNUC_MINOR__ 8\000"
.LASF648:
	.ascii	"unsigned int\000"
.LASF414:
	.ascii	"UINTMAX_MAX __UINTMAX_MAX__\000"
.LASF481:
	.ascii	"TIME_SLICE_AMOUNT (uint16_t)500u\000"
.LASF102:
	.ascii	"__UINT16_C(c) c\000"
.LASF476:
	.ascii	"TSK_STATE_IS_WAITING_MNTR(pTsk) (TskState)(TSK_GETS"
	.ascii	"TATE(pTsk) == TSK_STATE_WAITING_MNTR)\000"
.LASF17:
	.ascii	"__SIZEOF_SHORT__ 2\000"
.LASF36:
	.ascii	"__CHAR16_TYPE__ short unsigned int\000"
.LASF393:
	.ascii	"UINT_LEAST32_MAX __UINT_LEAST32_MAX__\000"
.LASF20:
	.ascii	"__SIZEOF_LONG_DOUBLE__ 8\000"
.LASF506:
	.ascii	"free rFree\000"
.LASF3:
	.ascii	"__GNUC__ 4\000"
.LASF25:
	.ascii	"__ORDER_BIG_ENDIAN__ 4321\000"
.LASF221:
	.ascii	"__ULLFRACT_MAX__ 0XFFFFFFFFFFFFFFFFP-64ULLR\000"
.LASF660:
	.ascii	"MNTR_ACCESS_MODIFY\000"
.LASF179:
	.ascii	"__DEC128_MIN__ 1E-6143DL\000"
.LASF596:
	.ascii	"MEM_FLGS_PRV_BGGSTBLCK_SHFT MEM_FLGS_BGGSTBLCK_SHFT"
	.ascii	"\000"
.LASF297:
	.ascii	"__UTA_FBIT__ 64\000"
.LASF134:
	.ascii	"__DBL_MANT_DIG__ 53\000"
.LASF54:
	.ascii	"__UINT_LEAST64_TYPE__ long long unsigned int\000"
.LASF514:
	.ascii	"MEM_MNGR_GET_MEMMNGRHEAD(pointer) ((MemMngrHead *)("
	.ascii	" (uint32_t) pointer - (uint32_t) sizeof(MemBlckHead"
	.ascii	")))\000"
.LASF623:
	.ascii	"MEM_FLG_CLR_PREV_SPLT(pMemMngrHead) MEM_FLG_CLR_BIT"
	.ascii	"_MSK(pMemMngrHead, MEM_FLGS_PREV_SPLT_MSK, addition"
	.ascii	"alFlags)\000"
.LASF663:
	.ascii	"MemPoolID\000"
.LASF10:
	.ascii	"__ATOMIC_RELEASE 3\000"
.LASF488:
	.ascii	"RET_OK ((RetCode)0x1u)\000"
.LASF31:
	.ascii	"__PTRDIFF_TYPE__ int\000"
.LASF518:
	.ascii	"MEM_FLG_GET_STRUC_PFIELD(struc,field) ((struc)->fie"
	.ascii	"ld)\000"
.LASF40:
	.ascii	"__INT16_TYPE__ short int\000"
.LASF378:
	.ascii	"UINT8_MAX __UINT8_MAX__\000"
.LASF532:
	.ascii	"MEM_FLGS_SPLT_16_MSK ((MemFlags)0x10u)\000"
.LASF167:
	.ascii	"__DEC32_EPSILON__ 1E-6DF\000"
.LASF149:
	.ascii	"__LDBL_DIG__ 15\000"
.LASF326:
	.ascii	"__thumb__ 1\000"
.LASF429:
	.ascii	"UINT32_C(x) __UINT32_C(x)\000"
.LASF254:
	.ascii	"__LLACCUM_IBIT__ 32\000"
.LASF517:
	.ascii	"MEM_FLG_GET_BIT_MSK(bit) ((MemFlags)((MemFlags)0x1u"
	.ascii	" << (MemFlags)bit))\000"
.LASF8:
	.ascii	"__ATOMIC_SEQ_CST 5\000"
.LASF609:
	.ascii	"MEM_FLGS_BGGRMRGD_MSK ((MemFlags)0x4000u)\000"
.LASF417:
	.ascii	"SIG_ATOMIC_MAX __STDINT_EXP(INT_MAX)\000"
.LASF430:
	.ascii	"INT64_C(x) __INT64_C(x)\000"
.LASF575:
	.ascii	"MEM_FLG_GET_MEMSIZE(memFlgs) (MemSize)(memFlgs & ME"
	.ascii	"M_FLGS_SIZE_MSK)\000"
.LASF361:
	.ascii	"__int8_t_defined 1\000"
.LASF47:
	.ascii	"__INT_LEAST8_TYPE__ signed char\000"
.LASF471:
	.ascii	"TSK_STATE_IS_WAITING_TMR(pTsk) (TskState)(TSK_GETST"
	.ascii	"ATE(pTsk) == TSK_STATE_WAITING_TMR)\000"
.LASF456:
	.ascii	"SYSFKT_INVALID_SYSFKT_ID (SysFktID)0xFFu\000"
.LASF381:
	.ascii	"UINT_LEAST8_MAX __UINT_LEAST8_MAX__\000"
.LASF80:
	.ascii	"__UINTMAX_C(c) c ## ULL\000"
.LASF415:
	.ascii	"SIZE_MAX __SIZE_MAX__\000"
.LASF108:
	.ascii	"__INT_FAST16_MAX__ 2147483647\000"
.LASF428:
	.ascii	"INT32_C(x) __INT32_C(x)\000"
.LASF617:
	.ascii	"MEM_FLG_CLR_BLCKLAST(pMemMngrHead) MEM_FLG_CLR_BIT_"
	.ascii	"MSK(pMemMngrHead, MEM_FLGS_ISBLCKLAST_MSK, addition"
	.ascii	"alFlags)\000"
.LASF27:
	.ascii	"__BYTE_ORDER__ __ORDER_LITTLE_ENDIAN__\000"
.LASF99:
	.ascii	"__UINT_LEAST8_MAX__ 255\000"
.LASF538:
	.ascii	"MEM_FLGS_SPLT_128_MSK ((MemFlags)0x80u)\000"
.LASF490:
	.ascii	"RET_MEM_ALLOC_FAIL_STACK ((RetCode)0x1Cu)\000"
.LASF654:
	.ascii	"TskPrioLvl\000"
.LASF324:
	.ascii	"__ARM_ARCH 6\000"
.LASF51:
	.ascii	"__UINT_LEAST8_TYPE__ unsigned char\000"
.LASF449:
	.ascii	"EVT_QUEUE_SIZE (uint8_t)0x4u\000"
.LASF468:
	.ascii	"TSK_STATE_IS_ACTIVE_READY(pTsk) (TskState)(TSK_GETS"
	.ascii	"TATE(pTsk) == TSK_STATE_ACTIVE_READY )\000"
.LASF570:
	.ascii	"MEM_FLG_CLR_ISLOWER(pMemMngrHead) MEM_FLG_CLR_BIT_M"
	.ascii	"SK(pMemMngrHead, MEM_FLGS_ISLOWER_MSK, flagsForMemB"
	.ascii	"lock)\000"
.LASF182:
	.ascii	"__DEC128_SUBNORMAL_MIN__ 0.000000000000000000000000"
	.ascii	"000000001E-6143DL\000"
.LASF219:
	.ascii	"__ULLFRACT_IBIT__ 0\000"
.LASF446:
	.ascii	"TSK_ID_MSK (uint16_t)0x00FFu\000"
.LASF7:
	.ascii	"__ATOMIC_RELAXED 0\000"
.LASF374:
	.ascii	"INTPTR_MAX __INTPTR_MAX__\000"
.LASF501:
	.ascii	"RET_STCK_NO_STCKPTR ((RetCode)0x34u)\000"
.LASF373:
	.ascii	"INTPTR_MIN (-__INTPTR_MAX__ - 1)\000"
.LASF698:
	.ascii	"usrMntrHndl\000"
.LASF245:
	.ascii	"__LACCUM_MIN__ (-0X1P31LK-0X1P31LK)\000"
.LASF261:
	.ascii	"__ULLACCUM_MAX__ 0XFFFFFFFFFFFFFFFFP-32ULLK\000"
.LASF250:
	.ascii	"__ULACCUM_MIN__ 0.0ULK\000"
.LASF576:
	.ascii	"MEM_FLG_SET_MEMSIZE(pMemMngrHead,newSize) do { if(("
	.ascii	"(BlckSize)(newSize)) < BIGGEST_BLCK ) { MEM_FLG_SET"
	.ascii	"_SPLIT(pMemMngrHead); } else { MEM_FLG_CLR_SPLIT(pM"
	.ascii	"emMngrHead); } (pMemMngrHead)->flagsForMemBlock = ("
	.ascii	"MemFlags)((pMemMngrHead)->flagsForMemBlock & (MemFl"
	.ascii	"ags)(~MEM_FLGS_SIZE_MSK)); (pMemMngrHead)->flagsFor"
	.ascii	"MemBlock = (MemFlags)((pMemMngrHead)->flagsForMemBl"
	.ascii	"ock | (MemFlags)((MemFlags)(newSize) & MEM_FLGS_SIZ"
	.ascii	"E_MSK)); }while((uint8_t)0x0u)\000"
.LASF152:
	.ascii	"__LDBL_MAX_EXP__ 1024\000"
.LASF666:
	.ascii	"mntrAccessState\000"
.LASF608:
	.ascii	"MEM_FLGS_BGGRMRGD_SHFT ((MemFlags)0xEu)\000"
.LASF455:
	.ascii	"AMOUNT_SYS_FKT (uint8_t)0x8u\000"
.LASF328:
	.ascii	"__ARMEL__ 1\000"
.LASF111:
	.ascii	"__UINT_FAST8_MAX__ 4294967295U\000"
.LASF296:
	.ascii	"__UDA_IBIT__ 32\000"
.LASF90:
	.ascii	"__UINT64_MAX__ 18446744073709551615ULL\000"
.LASF58:
	.ascii	"__INT_FAST64_TYPE__ long long int\000"
.LASF92:
	.ascii	"__INT8_C(c) c\000"
.LASF443:
	.ascii	"MSGQ_TSK_ID_POS (uint8_t)0x0u\000"
.LASF557:
	.ascii	"MEM_FLG_SET_TAKEN(pMemMngrHead) MEM_FLG_SET_BIT_MSK"
	.ascii	"(pMemMngrHead, MEM_FLGS_TAKEN_MSK, flagsForMemBlock"
	.ascii	")\000"
.LASF492:
	.ascii	"RET_TSK_NO_IDLE_TSK ((RetCode)0x20u)\000"
.LASF284:
	.ascii	"__HA_IBIT__ 8\000"
.LASF76:
	.ascii	"__SIZE_MAX__ 4294967295U\000"
.LASF627:
	.ascii	"MEM_FLG_PREV_BIGGER_COMBO(memFlgs) (MemSize)(MEM_FL"
	.ascii	"G_GET_PREV_MEMSIZE(memFlgs) & (MemSize)(MEM_FLG_GET"
	.ascii	"_PREV_MEMSIZE(memFlgs)-(MemSize)1u))\000"
.LASF651:
	.ascii	"Data\000"
.LASF404:
	.ascii	"INT_FAST16_MAX __INT_FAST16_MAX__\000"
.LASF260:
	.ascii	"__ULLACCUM_MIN__ 0.0ULLK\000"
.LASF650:
	.ascii	"uint32_t\000"
.LASF434:
	.ascii	"_GCC_WRAP_STDINT_H \000"
.LASF626:
	.ascii	"MEM_FLG_PREV_ISCOMBO(memFlgs) (MemSize)((MEM_FLG_GE"
	.ascii	"T_PREV_MEMSIZE(memFlgs) & (MemSize)(MEM_FLG_GET_PRE"
	.ascii	"V_MEMSIZE(memFlgs)-(MemSize)1u)) ? 1u : 0u)\000"
.LASF129:
	.ascii	"__FLT_EPSILON__ 1.1920928955078125e-7F\000"
.LASF325:
	.ascii	"__APCS_32__ 1\000"
.LASF445:
	.ascii	"SYS_ID_MSK (uint16_t)0xFF00u\000"
.LASF64:
	.ascii	"__UINTPTR_TYPE__ unsigned int\000"
.LASF706:
	.ascii	"mntr_ReqstReadAccssMntr\000"
.LASF543:
	.ascii	"MEM_FLGS_MERGE1024_SHFT ((MemFlags)0xAu)\000"
.LASF286:
	.ascii	"__SA_IBIT__ 16\000"
.LASF216:
	.ascii	"__LLFRACT_MAX__ 0X7FFFFFFFFFFFFFFFP-63LLR\000"
.LASF436:
	.ascii	"NULL ((void *)0x0u)\000"
.LASF475:
	.ascii	"TSK_STATE_IS_WAITING_SEM(pTsk) (TskState)(TSK_GETST"
	.ascii	"ATE(pTsk) == TSK_STATE_WAITING_SEM)\000"
.LASF548:
	.ascii	"MEM_FLGS_SPLT_MSK ((MemFlags)0x1000u)\000"
.LASF121:
	.ascii	"__FLT_DIG__ 6\000"
.LASF143:
	.ascii	"__DBL_EPSILON__ ((double)2.2204460492503131e-16L)\000"
.LASF287:
	.ascii	"__DA_FBIT__ 31\000"
.LASF320:
	.ascii	"__ARM_SIZEOF_MINIMAL_ENUM 1\000"
.LASF655:
	.ascii	"tskStateT\000"
.LASF38:
	.ascii	"__SIG_ATOMIC_TYPE__ int\000"
.LASF622:
	.ascii	"MEM_FLG_SET_PREV_SPLT(pMemMngrHead) MEM_FLG_SET_BIT"
	.ascii	"_MSK(pMemMngrHead, MEM_FLGS_PREV_SPLT_MSK, addition"
	.ascii	"alFlags)\000"
.LASF165:
	.ascii	"__DEC32_MIN__ 1E-95DF\000"
.LASF401:
	.ascii	"INT_FAST8_MAX __INT_FAST8_MAX__\000"
.LASF232:
	.ascii	"__USACCUM_EPSILON__ 0x1P-8UHK\000"
.LASF349:
	.ascii	"___int8_t_defined 1\000"
.LASF591:
	.ascii	"MEM_FLGS_PRV_SPLT_32_MSK MEM_FLGS_SPLT_32_MSK\000"
.LASF669:
	.ascii	"MNTR_WRITE\000"
.LASF599:
	.ascii	"MEM_FLGS_PRV_MERGE512_MSK MEM_FLGS_MERGE512_MSK\000"
.LASF251:
	.ascii	"__ULACCUM_MAX__ 0XFFFFFFFFFFFFFFFFP-32ULK\000"
.LASF201:
	.ascii	"__UFRACT_MAX__ 0XFFFFP-16UR\000"
.LASF186:
	.ascii	"__SFRACT_MAX__ 0X7FP-7HR\000"
.LASF667:
	.ascii	"MNTR_LOCK_ERROR\000"
.LASF662:
	.ascii	"RetCode\000"
.LASF345:
	.ascii	"_SYS_FEATURES_H \000"
.LASF647:
	.ascii	"long long unsigned int\000"
.LASF688:
	.ascii	"protectedData\000"
.LASF177:
	.ascii	"__DEC128_MIN_EXP__ (-6142)\000"
.LASF454:
	.ascii	"TSK_PRIO_LEVELS_NR (TskPrioLvl)0xFu\000"
.LASF535:
	.ascii	"MEM_FLGS_SPLT_64_SHFT ((MemFlags)0x6u)\000"
.LASF502:
	.ascii	"HEADERS_R_RTOS_MEMMNGR_H_ \000"
.LASF212:
	.ascii	"__ULFRACT_EPSILON__ 0x1P-32ULR\000"
.LASF49:
	.ascii	"__INT_LEAST32_TYPE__ long int\000"
.LASF109:
	.ascii	"__INT_FAST32_MAX__ 2147483647\000"
.LASF209:
	.ascii	"__ULFRACT_IBIT__ 0\000"
.LASF253:
	.ascii	"__LLACCUM_FBIT__ 31\000"
.LASF572:
	.ascii	"MEM_FLG_SET_MERGED(pMemMngrHead) MEM_FLG_SET_BIT_MS"
	.ascii	"K(pMemMngrHead, MEM_FLGS_MERGED_MSK, flagsForMemBlo"
	.ascii	"ck)\000"
.LASF119:
	.ascii	"__FLT_RADIX__ 2\000"
.LASF512:
	.ascii	"SMALLER_BLCK_DIVISOR (MemIndex)(0x3u)\000"
.LASF505:
	.ascii	"realloc rRealloc\000"
.LASF452:
	.ascii	"TSK_ID_IDLE ((TskID)0x0u)\000"
.LASF220:
	.ascii	"__ULLFRACT_MIN__ 0.0ULLR\000"
.LASF105:
	.ascii	"__UINT_LEAST64_MAX__ 18446744073709551615ULL\000"
.LASF240:
	.ascii	"__UACCUM_MIN__ 0.0UK\000"
.LASF207:
	.ascii	"__LFRACT_EPSILON__ 0x1P-31LR\000"
.LASF55:
	.ascii	"__INT_FAST8_TYPE__ int\000"
.LASF545:
	.ascii	"MEM_FLGS_MERGE2048_SHFT ((MemFlags)0xBu)\000"
.LASF60:
	.ascii	"__UINT_FAST16_TYPE__ unsigned int\000"
.LASF477:
	.ascii	"TSK_STATE_IS_UNINIT(pTsk) (TskState)(TSK_GETSTATE(p"
	.ascii	"Tsk) & TSK_STATE_UNINIT)\000"
.LASF473:
	.ascii	"TSK_STATE_IS_WAITING_MSGSND(pTsk) (TskState)(TSK_GE"
	.ascii	"TSTATE(pTsk) == TSK_STATE_WAITING_MSGSND)\000"
.LASF664:
	.ascii	"mntrFlgs\000"
.LASF568:
	.ascii	"MEM_FLG_ISLOWER(memFlgs) MEM_FLG_PARSE(memFlgs,MEM_"
	.ascii	"FLGS_ISLOWER_SHFT)\000"
.LASF515:
	.ascii	"MEM_MNGR_GET_PTRTOMEM(memMngrPtr) ((void *) ((uint3"
	.ascii	"2_t) memMngrPtr + (uint32_t) sizeof(MemBlckHead)))\000"
.LASF223:
	.ascii	"__SACCUM_FBIT__ 7\000"
.LASF340:
	.ascii	"__USES_INITFINI__ 1\000"
.LASF142:
	.ascii	"__DBL_MIN__ ((double)2.2250738585072014e-308L)\000"
.LASF173:
	.ascii	"__DEC64_MAX__ 9.999999999999999E384DD\000"
.LASF195:
	.ascii	"__FRACT_MIN__ (-0.5R-0.5R)\000"
.LASF310:
	.ascii	"__GCC_ATOMIC_INT_LOCK_FREE 1\000"
.LASF629:
	.ascii	"MEM_FLG_BGGRMRGD(memFlgs) MEM_FLG_PARSE(memFlgs,MEM"
	.ascii	"_FLGS_BGGRMRGD_SHFT)\000"
.LASF511:
	.ascii	"SMALLER_BLCK_MSK ((BlckSize)(SMALLEST_BLCK - (BlckS"
	.ascii	"ize)1u))\000"
.LASF420:
	.ascii	"WCHAR_MAX __WCHAR_MAX__\000"
.LASF674:
	.ascii	"MNTR_PENDING\000"
.LASF234:
	.ascii	"__ACCUM_IBIT__ 16\000"
.LASF158:
	.ascii	"__LDBL_DENORM_MIN__ 4.9406564584124654e-324L\000"
.LASF228:
	.ascii	"__USACCUM_FBIT__ 8\000"
.LASF24:
	.ascii	"__ORDER_LITTLE_ENDIAN__ 1234\000"
.LASF319:
	.ascii	"__SIZEOF_PTRDIFF_T__ 4\000"
.LASF185:
	.ascii	"__SFRACT_MIN__ (-0.5HR-0.5HR)\000"
.LASF294:
	.ascii	"__USA_IBIT__ 16\000"
.LASF214:
	.ascii	"__LLFRACT_IBIT__ 0\000"
.LASF352:
	.ascii	"___int64_t_defined 1\000"
.LASF176:
	.ascii	"__DEC128_MANT_DIG__ 34\000"
.LASF426:
	.ascii	"INT16_C(x) __INT16_C(x)\000"
.LASF147:
	.ascii	"__DBL_HAS_QUIET_NAN__ 1\000"
.LASF573:
	.ascii	"MEM_FLG_CLR_MERGED(pMemMngrHead) MEM_FLG_CLR_BIT_MS"
	.ascii	"K(pMemMngrHead, MEM_FLGS_MERGED_MSK, flagsForMemBlo"
	.ascii	"ck)\000"
.LASF704:
	.ascii	"mntr_DelMntr\000"
.LASF231:
	.ascii	"__USACCUM_MAX__ 0XFFFFP-8UHK\000"
.LASF104:
	.ascii	"__UINT32_C(c) c ## UL\000"
.LASF164:
	.ascii	"__DEC32_MAX_EXP__ 97\000"
.LASF671:
	.ascii	"MNTR_FREE\000"
.LASF602:
	.ascii	"MEM_FLGS_PRV_MERGE2048_SHFT MEM_FLGS_MERGE2048_SHFT"
	.ascii	"\000"
.LASF615:
	.ascii	"MEM_FLG_ISBLCKLAST(memFlgs) MEM_FLG_PARSE(memFlgs,M"
	.ascii	"EM_FLGS_ISBLCKLAST_SHFT)\000"
.LASF653:
	.ascii	"TskID\000"
.LASF406:
	.ascii	"INT_FAST32_MIN (-__INT_FAST32_MAX__ - 1)\000"
.LASF657:
	.ascii	"MNTR_ACCESS_READ\000"
.LASF611:
	.ascii	"MEM_FLGS_CACHED_MSK ((MemFlags)0x8000u)\000"
.LASF555:
	.ascii	"MEM_FLGS_SIZE_MSK ((MemFlags)0xFFCu)\000"
.LASF497:
	.ascii	"RET_STCK_ERR_EMPTY ((RetCode)0x30u)\000"
.LASF329:
	.ascii	"__THUMBEL__ 1\000"
.LASF367:
	.ascii	"__int64_t_defined 1\000"
.LASF708:
	.ascii	"mntr_ReqstWriteAccssMntr\000"
.LASF288:
	.ascii	"__DA_IBIT__ 32\000"
.LASF23:
	.ascii	"__BIGGEST_ALIGNMENT__ 8\000"
.LASF244:
	.ascii	"__LACCUM_IBIT__ 32\000"
.LASF93:
	.ascii	"__INT_LEAST16_MAX__ 32767\000"
.LASF191:
	.ascii	"__USFRACT_MAX__ 0XFFP-8UHR\000"
.LASF350:
	.ascii	"___int16_t_defined 1\000"
.LASF183:
	.ascii	"__SFRACT_FBIT__ 7\000"
.LASF435:
	.ascii	"NULL\000"
.LASF255:
	.ascii	"__LLACCUM_MIN__ (-0X1P31LLK-0X1P31LLK)\000"
.LASF693:
	.ascii	"Mntr\000"
.LASF480:
	.ascii	"TSK_STATE_IS_UNINIT_ENDED(pTsk) (TskState)(TSK_GETS"
	.ascii	"TATE(pTsk) == TSK_STATE_UNINIT_ENDED)\000"
.LASF561:
	.ascii	"MEM_FLG_CLR_PREVTAKEN(pMemMngrHead) MEM_FLG_CLR_BIT"
	.ascii	"_MSK(pMemMngrHead, MEM_FLGS_PREVTAKEN_MSK, flagsFor"
	.ascii	"MemBlock)\000"
.LASF112:
	.ascii	"__UINT_FAST16_MAX__ 4294967295U\000"
.LASF440:
	.ascii	"IDLE_TSK_STACK_SIZE ((StackSize)0x60u)\000"
.LASF672:
	.ascii	"MNTR_FREE_READ\000"
.LASF495:
	.ascii	"RET_TSK_IS_ABOUT_TO_RUN ((RetCode)0x25u)\000"
.LASF227:
	.ascii	"__SACCUM_EPSILON__ 0x1P-7HK\000"
.LASF542:
	.ascii	"MEM_FLGS_MERGE512_MSK ((MemFlags)0x200u)\000"
.LASF351:
	.ascii	"___int32_t_defined 1\000"
.LASF56:
	.ascii	"__INT_FAST16_TYPE__ int\000"
.LASF44:
	.ascii	"__UINT16_TYPE__ short unsigned int\000"
.LASF467:
	.ascii	"TSK_STATE_IS_ACTIVE_SUSPENDED(pTsk) (TskState)(TSK_"
	.ascii	"GETSTATE(pTsk) == TSK_STATE_ACTIVE_SUSPENDED )\000"
.LASF75:
	.ascii	"__PTRDIFF_MAX__ 2147483647\000"
.LASF301:
	.ascii	"__GNUC_STDC_INLINE__ 1\000"
.LASF276:
	.ascii	"__UHQ_IBIT__ 0\000"
.LASF198:
	.ascii	"__UFRACT_FBIT__ 16\000"
.LASF385:
	.ascii	"INT_LEAST16_MIN (-__INT_LEAST16_MAX__ - 1)\000"
.LASF52:
	.ascii	"__UINT_LEAST16_TYPE__ short unsigned int\000"
.LASF125:
	.ascii	"__FLT_MAX_10_EXP__ 38\000"
.LASF379:
	.ascii	"INT_LEAST8_MIN (-__INT_LEAST8_MAX__ - 1)\000"
.LASF256:
	.ascii	"__LLACCUM_MAX__ 0X7FFFFFFFFFFFFFFFP-31LLK\000"
.LASF257:
	.ascii	"__LLACCUM_EPSILON__ 0x1P-31LLK\000"
.LASF302:
	.ascii	"__NO_INLINE__ 1\000"
.LASF658:
	.ascii	"MNTR_ACCESS_WRITE\000"
.LASF229:
	.ascii	"__USACCUM_IBIT__ 8\000"
.LASF210:
	.ascii	"__ULFRACT_MIN__ 0.0ULR\000"
.LASF120:
	.ascii	"__FLT_MANT_DIG__ 24\000"
.LASF567:
	.ascii	"MEM_FLG_CLR_SPLIT(pMemMngrHead) MEM_FLG_CLR_BIT_MSK"
	.ascii	"(pMemMngrHead, MEM_FLGS_SPLT_MSK, flagsForMemBlock)"
	.ascii	"\000"
.LASF411:
	.ascii	"UINT_FAST64_MAX __UINT_FAST64_MAX__\000"
.LASF278:
	.ascii	"__USQ_IBIT__ 0\000"
.LASF299:
	.ascii	"__REGISTER_PREFIX__ \000"
.LASF46:
	.ascii	"__UINT64_TYPE__ long long unsigned int\000"
.LASF400:
	.ascii	"INT_FAST8_MIN (-__INT_FAST8_MAX__ - 1)\000"
.LASF546:
	.ascii	"MEM_FLGS_MERGE2048_MSK ((MemFlags)0x800u)\000"
.LASF239:
	.ascii	"__UACCUM_IBIT__ 16\000"
.LASF118:
	.ascii	"__DEC_EVAL_METHOD__ 2\000"
.LASF510:
	.ascii	"SMALLEST_BLCK ((BlckSize)0x8u)\000"
.LASF450:
	.ascii	"SYSTCK_AR_RES (uint8_t)0x8u\000"
.LASF137:
	.ascii	"__DBL_MIN_10_EXP__ (-307)\000"
.LASF670:
	.ascii	"MNTR_NOOP\000"
.LASF89:
	.ascii	"__UINT32_MAX__ 4294967295UL\000"
.LASF268:
	.ascii	"__SQ_IBIT__ 0\000"
.LASF334:
	.ascii	"__THUMB_INTERWORK__ 1\000"
.LASF683:
	.ascii	"accssType\000"
.LASF625:
	.ascii	"MEM_FLG_SET_PREV_MEMSIZE(pMemMngrHead,newSize) do {"
	.ascii	" (pMemMngrHead)->additionalFlags = (MemFlags)((pMem"
	.ascii	"MngrHead)->additionalFlags & (MemFlags)(~MEM_FLGS_S"
	.ascii	"IZE_MSK)); (pMemMngrHead)->additionalFlags = (MemFl"
	.ascii	"ags)((pMemMngrHead)->additionalFlags | (MemFlags)(("
	.ascii	"MemFlags)(newSize) & MEM_FLGS_SIZE_MSK)); }while((u"
	.ascii	"int8_t)0x0u)\000"
.LASF16:
	.ascii	"__SIZEOF_LONG_LONG__ 8\000"
.LASF714:
	.ascii	"C:\\\\Users\\\\Christian\\\\Documents\\\\OHM\\\\MAP"
	.ascii	"R\\\\Projekt\\\\WRKSPC\\\\R_RTOS\\\\build\000"
.LASF585:
	.ascii	"MEM_FLGS_PRV_SPLT_4_MSK MEM_FLGS_SPLT_4_MSK\000"
.LASF459:
	.ascii	"MAKE_SYS_ID(id) (uint16_t)((uint16_t)((uint8_t)id &"
	.ascii	" (uint8_t)0xFFu) << (uint8_t)0x8u)\000"
.LASF337:
	.ascii	"__ARM_EABI__ 1\000"
.LASF59:
	.ascii	"__UINT_FAST8_TYPE__ unsigned int\000"
.LASF457:
	.ascii	"OFFSETOF(type,field) ((uint8_t) &(((type *) 0)->fie"
	.ascii	"ld))\000"
.LASF233:
	.ascii	"__ACCUM_FBIT__ 15\000"
.LASF308:
	.ascii	"__GCC_ATOMIC_WCHAR_T_LOCK_FREE 1\000"
.LASF170:
	.ascii	"__DEC64_MIN_EXP__ (-382)\000"
.LASF249:
	.ascii	"__ULACCUM_IBIT__ 32\000"
.LASF606:
	.ascii	"MEM_FLGS_PREV_SPLT_SHFT ((MemFlags)0xDu)\000"
.LASF213:
	.ascii	"__LLFRACT_FBIT__ 63\000"
.LASF578:
	.ascii	"MEM_FLG_BIGGER_COMBO(memFlgs) (MemSize)(MEM_FLG_GET"
	.ascii	"_MEMSIZE(memFlgs) & (MemSize)(MEM_FLG_GET_MEMSIZE(m"
	.ascii	"emFlgs)-(MemSize)1u))\000"
.LASF529:
	.ascii	"MEM_FLGS_SPLT_8_SHFT ((MemFlags)0x3u)\000"
.LASF699:
	.ascii	"data\000"
.LASF293:
	.ascii	"__USA_FBIT__ 16\000"
.LASF264:
	.ascii	"__QQ_IBIT__ 0\000"
.LASF479:
	.ascii	"TSK_STATE_IS_UNINIT_FAILED(pTsk) (TskState)(TSK_GET"
	.ascii	"STATE(pTsk) == TSK_STATE_UNINIT_FAILED)\000"
.LASF519:
	.ascii	"MEM_FLG_SET_BIT(pMemMngrHead,bit,whichFlags) MEM_FL"
	.ascii	"G_GET_STRUC_PFIELD(pMemMngrHead, whichFlags) |= MEM"
	.ascii	"_FLG_GET_BIT_MSK(bit)\000"
.LASF391:
	.ascii	"INT_LEAST32_MIN (-__INT_LEAST32_MAX__ - 1)\000"
.LASF380:
	.ascii	"INT_LEAST8_MAX __INT_LEAST8_MAX__\000"
.LASF465:
	.ascii	"TSK_STATE_IS_ACTIVE(pTsk) (TskState)(TSK_GETSTATE(p"
	.ascii	"Tsk) & TSK_STATE_ACTIVE)\000"
.LASF649:
	.ascii	"uint8_t\000"
.LASF354:
	.ascii	"___int_least16_t_defined 1\000"
.LASF95:
	.ascii	"__INT_LEAST32_MAX__ 2147483647L\000"
.LASF484:
	.ascii	"NR_OF_MEMPOOLS (uint8_t)0x5u\000"
.LASF707:
	.ascii	"mntr_RelsReadAccssMntr\000"
.LASF203:
	.ascii	"__LFRACT_FBIT__ 31\000"
.LASF700:
	.ascii	"waitrQueueMaxSize\000"
.LASF48:
	.ascii	"__INT_LEAST16_TYPE__ short int\000"
.LASF676:
	.ascii	"MNTR_LOCK\000"
.LASF305:
	.ascii	"__GCC_ATOMIC_CHAR_LOCK_FREE 1\000"
.LASF637:
	.ascii	"HEADERS_R_RTOS_TASK_H_ \000"
.LASF486:
	.ascii	"OS_DISPATCH_NEEDED ((OsCode)0x1u)\000"
.LASF135:
	.ascii	"__DBL_DIG__ 15\000"
.LASF355:
	.ascii	"___int_least32_t_defined 1\000"
.LASF311:
	.ascii	"__GCC_ATOMIC_LONG_LOCK_FREE 1\000"
.LASF243:
	.ascii	"__LACCUM_FBIT__ 31\000"
.LASF282:
	.ascii	"__UTQ_IBIT__ 0\000"
.LASF202:
	.ascii	"__UFRACT_EPSILON__ 0x1P-16UR\000"
.LASF128:
	.ascii	"__FLT_MIN__ 1.1754943508222875e-38F\000"
.LASF681:
	.ascii	"mntrRfrcCnt\000"
.LASF498:
	.ascii	"RET_STCK_ERR_INDEX_OVERFLOW ((RetCode)0x31u)\000"
.LASF101:
	.ascii	"__UINT_LEAST16_MAX__ 65535\000"
.LASF601:
	.ascii	"MEM_FLGS_PRV_MERGE1024_MSK MEM_FLGS_MERGE1024_MSK\000"
.LASF279:
	.ascii	"__UDQ_FBIT__ 64\000"
.LASF344:
	.ascii	"_MACHINE__DEFAULT_TYPES_H \000"
.LASF696:
	.ascii	"mntr_appendToWaitrList\000"
.LASF327:
	.ascii	"__ARM_ARCH_ISA_THUMB 1\000"
.LASF408:
	.ascii	"UINT_FAST32_MAX __UINT_FAST32_MAX__\000"
.LASF427:
	.ascii	"UINT16_C(x) __UINT16_C(x)\000"
.LASF281:
	.ascii	"__UTQ_FBIT__ 128\000"
.LASF84:
	.ascii	"__INT16_MAX__ 32767\000"
.LASF646:
	.ascii	"long long int\000"
.LASF22:
	.ascii	"__CHAR_BIT__ 8\000"
.LASF516:
	.ascii	"MEM_FLG_PARSE(memFlgs,shft) ((MemFlags)((MemFlags)("
	.ascii	"memFlgs >> (MemFlags)shft) & (MemFlags)0x1u))\000"
.LASF460:
	.ascii	"MAKE_TSK_ID(id) (uint16_t)(uint16_t)((uint8_t)id & "
	.ascii	"(uint8_t)0xFFu)\000"
.LASF332:
	.ascii	"__ARM_FP 12\000"
.LASF368:
	.ascii	"__int_least64_t_defined 1\000"
.LASF304:
	.ascii	"__GCC_ATOMIC_BOOL_LOCK_FREE 1\000"
.LASF550:
	.ascii	"MEM_FLGS_MERGED_MSK ((MemFlags)0x2000u)\000"
.LASF155:
	.ascii	"__LDBL_MAX__ 1.7976931348623157e+308L\000"
.LASF13:
	.ascii	"__FINITE_MATH_ONLY__ 0\000"
.LASF226:
	.ascii	"__SACCUM_MAX__ 0X7FFFP-7HK\000"
.LASF323:
	.ascii	"__arm__ 1\000"
.LASF527:
	.ascii	"MEM_FLGS_SPLT_4_SHFT ((MemFlags)0x2u)\000"
.LASF503:
	.ascii	"malloc rMalloc\000"
.LASF148:
	.ascii	"__LDBL_MANT_DIG__ 53\000"
.LASF690:
	.ascii	"mntrWaitrsQTskIDEnd\000"
.LASF291:
	.ascii	"__UHA_FBIT__ 8\000"
.LASF423:
	.ascii	"WINT_MIN __WINT_MIN__\000"
.LASF632:
	.ascii	"MEM_FLG_ISCACHED(memFlgs) MEM_FLG_PARSE(memFlgs,MEM"
	.ascii	"_FLGS_CACHED_SHFT)\000"
.LASF67:
	.ascii	"__SHRT_MAX__ 32767\000"
.LASF313:
	.ascii	"__GCC_ATOMIC_TEST_AND_SET_TRUEVAL 1\000"
.LASF425:
	.ascii	"UINT8_C(x) __UINT8_C(x)\000"
.LASF103:
	.ascii	"__UINT_LEAST32_MAX__ 4294967295UL\000"
.LASF339:
	.ascii	"__ELF__ 1\000"
.LASF500:
	.ascii	"RET_STCK_NO_STCKELEM_PTR ((RetCode)0x33u)\000"
.LASF603:
	.ascii	"MEM_FLGS_PRV_MERGE2048_MSK MEM_FLGS_MERGE2048_MSK\000"
.LASF94:
	.ascii	"__INT16_C(c) c\000"
.LASF315:
	.ascii	"__GCC_HAVE_DWARF2_CFI_ASM 1\000"
.LASF18:
	.ascii	"__SIZEOF_FLOAT__ 4\000"
.LASF168:
	.ascii	"__DEC32_SUBNORMAL_MIN__ 0.000001E-95DF\000"
.LASF387:
	.ascii	"UINT_LEAST16_MAX __UINT_LEAST16_MAX__\000"
.LASF192:
	.ascii	"__USFRACT_EPSILON__ 0x1P-8UHR\000"
.LASF132:
	.ascii	"__FLT_HAS_INFINITY__ 1\000"
.LASF364:
	.ascii	"__int_least16_t_defined 1\000"
.LASF65:
	.ascii	"__GXX_ABI_VERSION 1002\000"
.LASF709:
	.ascii	"mntr_RelsWriteAccssMntr\000"
.LASF388:
	.ascii	"INT32_MIN (-__INT32_MAX__ - 1)\000"
.LASF600:
	.ascii	"MEM_FLGS_PRV_MERGE1024_SHFT MEM_FLGS_MERGE1024_SHFT"
	.ascii	"\000"
.LASF571:
	.ascii	"MEM_FLG_ISMERGED(memFlgs) MEM_FLG_PARSE(memFlgs,MEM"
	.ascii	"_FLGS_MERGED_SHFT)\000"
.LASF371:
	.ascii	"__int_fast32_t_defined 1\000"
.LASF0:
	.ascii	"__STDC__ 1\000"
.LASF15:
	.ascii	"__SIZEOF_LONG__ 4\000"
.LASF587:
	.ascii	"MEM_FLGS_PRV_SPLT_8_MSK MEM_FLGS_SPLT_8_MSK\000"
.LASF533:
	.ascii	"MEM_FLGS_SPLT_32_SHFT ((MemFlags)0x5u)\000"
.LASF138:
	.ascii	"__DBL_MAX_EXP__ 1024\000"
.LASF416:
	.ascii	"SIG_ATOMIC_MIN (-__STDINT_EXP(INT_MAX) - 1)\000"
.LASF12:
	.ascii	"__ATOMIC_CONSUME 1\000"
.LASF549:
	.ascii	"MEM_FLGS_MERGED_SHFT ((MemFlags)0xDu)\000"
.LASF366:
	.ascii	"__int_least32_t_defined 1\000"
.LASF539:
	.ascii	"MEM_FLGS_BGGSTBLCK_SHFT ((MemFlags)0x8u)\000"
.LASF375:
	.ascii	"UINTPTR_MAX __UINTPTR_MAX__\000"
.LASF403:
	.ascii	"INT_FAST16_MIN (-__INT_FAST16_MAX__ - 1)\000"
.LASF33:
	.ascii	"__WINT_TYPE__ unsigned int\000"
.LASF115:
	.ascii	"__INTPTR_MAX__ 2147483647\000"
.LASF439:
	.ascii	"MY_STACK_SIZE ((StackSize)0x80u)\000"
.LASF248:
	.ascii	"__ULACCUM_FBIT__ 32\000"
.LASF208:
	.ascii	"__ULFRACT_FBIT__ 32\000"
.LASF32:
	.ascii	"__WCHAR_TYPE__ unsigned int\000"
.LASF560:
	.ascii	"MEM_FLG_SET_PREVTAKEN(pMemMngrHead) MEM_FLG_SET_BIT"
	.ascii	"_MSK(pMemMngrHead, MEM_FLGS_PREVTAKEN_MSK, flagsFor"
	.ascii	"MemBlock)\000"
.LASF235:
	.ascii	"__ACCUM_MIN__ (-0X1P15K-0X1P15K)\000"
.LASF520:
	.ascii	"MEM_FLG_CLR_BIT(pMemMngrHead,bit,whichFlags) MEM_FL"
	.ascii	"G_GET_STRUC_PFIELD(pMemMngrHead, whichFlags) &= ((M"
	.ascii	"emFlags)(~MEM_FLG_GET_BIT_MSK(bit)))\000"
.LASF19:
	.ascii	"__SIZEOF_DOUBLE__ 8\000"
.LASF437:
	.ascii	"ABS(x) (((x)<0) ? (-1*(x)) : (x))\000"
.LASF399:
	.ascii	"UINT_LEAST64_MAX __UINT_LEAST64_MAX__\000"
.LASF5:
	.ascii	"__GNUC_PATCHLEVEL__ 4\000"
.LASF196:
	.ascii	"__FRACT_MAX__ 0X7FFFP-15R\000"
.LASF42:
	.ascii	"__INT64_TYPE__ long long int\000"
.LASF71:
	.ascii	"__WCHAR_MAX__ 4294967295U\000"
.LASF453:
	.ascii	"TSK_ID_NO_TSK TSK_ID_IDLE\000"
.LASF200:
	.ascii	"__UFRACT_MIN__ 0.0UR\000"
.LASF634:
	.ascii	"MEM_FLG_CLR_CACHED(pMemMngrHead) MEM_FLG_CLR_BIT_MS"
	.ascii	"K(pMemMngrHead, MEM_FLGS_CACHED_MSK, additionalFlag"
	.ascii	"s)\000"
.LASF613:
	.ascii	"MEM_FLG_SET_BLCKBEG(pMemMngrHead) MEM_FLG_SET_BIT_M"
	.ascii	"SK(pMemMngrHead, MEM_FLGS_ISBLCKBEG_MSK, additional"
	.ascii	"Flags)\000"
.LASF384:
	.ascii	"UINT16_MAX __UINT16_MAX__\000"
.LASF114:
	.ascii	"__UINT_FAST64_MAX__ 18446744073709551615ULL\000"
.LASF395:
	.ascii	"INT64_MAX __INT64_MAX__\000"
.LASF194:
	.ascii	"__FRACT_IBIT__ 0\000"
.LASF499:
	.ascii	"RET_STCK_ERR_INDEX_UNDERFLOW ((RetCode)0x32u)\000"
.LASF156:
	.ascii	"__LDBL_MIN__ 2.2250738585072014e-308L\000"
.LASF289:
	.ascii	"__TA_FBIT__ 63\000"
.LASF160:
	.ascii	"__LDBL_HAS_INFINITY__ 1\000"
.LASF661:
	.ascii	"ACCSSType\000"
.LASF496:
	.ascii	"RET_STCK_ERR_FULL ((RetCode)0x3Fu)\000"
.LASF369:
	.ascii	"__int_fast8_t_defined 1\000"
.LASF150:
	.ascii	"__LDBL_MIN_EXP__ (-1021)\000"
.LASF218:
	.ascii	"__ULLFRACT_FBIT__ 64\000"
.LASF317:
	.ascii	"__SIZEOF_WCHAR_T__ 4\000"
.LASF482:
	.ascii	"NR_OF_TSKS ((uint8_t)0xBu)\000"
.LASF96:
	.ascii	"__INT32_C(c) c ## L\000"
.LASF508:
	.ascii	"BIGGEST_BLCK ((BlckSize)0x100u)\000"
.LASF28:
	.ascii	"__FLOAT_WORD_ORDER__ __ORDER_LITTLE_ENDIAN__\000"
.LASF236:
	.ascii	"__ACCUM_MAX__ 0X7FFFFFFFP-15K\000"
.LASF199:
	.ascii	"__UFRACT_IBIT__ 0\000"
.LASF162:
	.ascii	"__DEC32_MANT_DIG__ 7\000"
.LASF554:
	.ascii	"MEM_FLGS_NXTTAKEN_MSK ((MemFlags)0x8000u)\000"
.LASF82:
	.ascii	"__SIG_ATOMIC_MIN__ (-__SIG_ATOMIC_MAX__ - 1)\000"
.LASF217:
	.ascii	"__LLFRACT_EPSILON__ 0x1P-63LLR\000"
.LASF589:
	.ascii	"MEM_FLGS_PRV_SPLT_16_MSK MEM_FLGS_SPLT_16_MSK\000"
.LASF636:
	.ascii	"MEM_OBJECTS_MNTR (uint8_t)0x10u\000"
.LASF614:
	.ascii	"MEM_FLG_CLR_BLCKBEG(pMemMngrHead) MEM_FLG_CLR_BIT_M"
	.ascii	"SK(pMemMngrHead, MEM_FLGS_ISBLCKBEG_MSK, additional"
	.ascii	"Flags)\000"
.LASF153:
	.ascii	"__LDBL_MAX_10_EXP__ 308\000"
.LASF9:
	.ascii	"__ATOMIC_ACQUIRE 2\000"
.LASF37:
	.ascii	"__CHAR32_TYPE__ long unsigned int\000"
.LASF336:
	.ascii	"__ARM_PCS 1\000"
.LASF266:
	.ascii	"__HQ_IBIT__ 0\000"
.LASF528:
	.ascii	"MEM_FLGS_SPLT_4_MSK ((MemFlags)0x4u)\000"
.LASF370:
	.ascii	"__int_fast16_t_defined 1\000"
.LASF692:
	.ascii	"refCntr\000"
.LASF130:
	.ascii	"__FLT_DENORM_MIN__ 1.4012984643248171e-45F\000"
.LASF283:
	.ascii	"__HA_FBIT__ 7\000"
.LASF53:
	.ascii	"__UINT_LEAST32_TYPE__ long unsigned int\000"
.LASF592:
	.ascii	"MEM_FLGS_PRV_SPLT_64_SHFT MEM_FLGS_SPLT_64_SHFT\000"
.LASF269:
	.ascii	"__DQ_FBIT__ 63\000"
.LASF35:
	.ascii	"__UINTMAX_TYPE__ long long unsigned int\000"
.LASF410:
	.ascii	"INT_FAST64_MAX __INT_FAST64_MAX__\000"
.LASF252:
	.ascii	"__ULACCUM_EPSILON__ 0x1P-32ULK\000"
.LASF547:
	.ascii	"MEM_FLGS_SPLT_SHFT ((MemFlags)0xCu)\000"
.LASF87:
	.ascii	"__UINT8_MAX__ 255\000"
.LASF347:
	.ascii	"__GNUC_PREREQ__(ma,mi) __GNUC_PREREQ(ma, mi)\000"
.LASF246:
	.ascii	"__LACCUM_MAX__ 0X7FFFFFFFFFFFFFFFP-31LK\000"
.LASF605:
	.ascii	"MEM_FLGS_NXT_SPLT_MSK ((MemFlags)0x1000u)\000"
.LASF522:
	.ascii	"MEM_FLG_CLR_BIT_MSK(pMemMngrHead,msk,whichFlags) ME"
	.ascii	"M_FLG_GET_STRUC_PFIELD(pMemMngrHead, whichFlags) &="
	.ascii	" ((MemFlags)(~((MemFlags)msk)))\000"
.LASF26:
	.ascii	"__ORDER_PDP_ENDIAN__ 3412\000"
.LASF73:
	.ascii	"__WINT_MAX__ 4294967295U\000"
.LASF537:
	.ascii	"MEM_FLGS_SPLT_128_SHFT ((MemFlags)0x7u)\000"
.LASF513:
	.ascii	"CACHE_SIZE ((uint8_t)0x10u)\000"
.LASF126:
	.ascii	"__FLT_DECIMAL_DIG__ 9\000"
.LASF563:
	.ascii	"MEM_FLG_SET_NXTTAKEN(pMemMngrHead) MEM_FLG_SET_BIT_"
	.ascii	"MSK(pMemMngrHead, MEM_FLGS_NXTTAKEN_MSK, flagsForMe"
	.ascii	"mBlock)\000"
.LASF569:
	.ascii	"MEM_FLG_SET_ISLOWER(pMemMngrHead) MEM_FLG_SET_BIT_M"
	.ascii	"SK(pMemMngrHead, MEM_FLGS_ISLOWER_MSK, flagsForMemB"
	.ascii	"lock)\000"
.LASF553:
	.ascii	"MEM_FLGS_NXTTAKEN_SHFT ((MemFlags)0xFu)\000"
.LASF343:
	.ascii	"_STDINT_H \000"
.LASF181:
	.ascii	"__DEC128_EPSILON__ 1E-33DL\000"
.LASF362:
	.ascii	"__int_least8_t_defined 1\000"
.LASF273:
	.ascii	"__UQQ_FBIT__ 8\000"
.LASF66:
	.ascii	"__SCHAR_MAX__ 127\000"
.LASF582:
	.ascii	"MEM_FLGS_ISBLCKLAST_SHFT ((MemFlags)0x1u)\000"
.LASF363:
	.ascii	"__int16_t_defined 1\000"
.LASF113:
	.ascii	"__UINT_FAST32_MAX__ 4294967295U\000"
.LASF487:
	.ascii	"RET_NOK ((RetCode)0x0u)\000"
.LASF640:
	.ascii	"short int\000"
.LASF703:
	.ascii	"mntrHndl\000"
.LASF171:
	.ascii	"__DEC64_MAX_EXP__ 385\000"
.LASF635:
	.ascii	"MEM_FLG_TAKENORCACHED(pMemMngrHead) (MemFlags)(MEM_"
	.ascii	"FLG_ISTAKEN(pMemMngrHead->flagsForMemBlock) | MEM_F"
	.ascii	"LG_ISCACHED(pMemMngrHead->additionalFlags))\000"
.LASF275:
	.ascii	"__UHQ_FBIT__ 16\000"
.LASF41:
	.ascii	"__INT32_TYPE__ long int\000"
.LASF412:
	.ascii	"INTMAX_MAX __INTMAX_MAX__\000"
.LASF642:
	.ascii	"long int\000"
.LASF594:
	.ascii	"MEM_FLGS_PRV_SPLT_128_SHFT MEM_FLGS_SPLT_128_SHFT\000"
.LASF551:
	.ascii	"MEM_FLGS_PREVTAKEN_SHFT ((MemFlags)0xEu)\000"
.LASF365:
	.ascii	"__int32_t_defined 1\000"
.LASF530:
	.ascii	"MEM_FLGS_SPLT_8_MSK ((MemFlags)0x8u)\000"
.LASF701:
	.ascii	"mntr_CreateMntr\000"
.LASF267:
	.ascii	"__SQ_FBIT__ 31\000"
.LASF348:
	.ascii	"__EXP(x) __ ##x ##__\000"
.LASF205:
	.ascii	"__LFRACT_MIN__ (-0.5LR-0.5LR)\000"
.LASF178:
	.ascii	"__DEC128_MAX_EXP__ 6145\000"
.LASF398:
	.ascii	"INT_LEAST64_MAX __INT_LEAST64_MAX__\000"
.LASF441:
	.ascii	"STACK_BLOCK_SIZE ((uint8_t)0x4u)\000"
.LASF590:
	.ascii	"MEM_FLGS_PRV_SPLT_32_SHFT MEM_FLGS_SPLT_32_SHFT\000"
.LASF418:
	.ascii	"PTRDIFF_MAX __PTRDIFF_MAX__\000"
.LASF695:
	.ascii	"waitr\000"
.LASF562:
	.ascii	"MEM_FLG_NXTTAKEN(memFlgs) MEM_FLG_PARSE(memFlgs,MEM"
	.ascii	"_FLGS_NXTTAKEN_SHFT)\000"
.LASF242:
	.ascii	"__UACCUM_EPSILON__ 0x1P-16UK\000"
.LASF161:
	.ascii	"__LDBL_HAS_QUIET_NAN__ 1\000"
.LASF39:
	.ascii	"__INT8_TYPE__ signed char\000"
.LASF300:
	.ascii	"__USER_LABEL_PREFIX__ \000"
.LASF677:
	.ascii	"MNTR_LOCK_WRITE\000"
.LASF458:
	.ascii	"DATATYPE_IS_PTR(dataType) (uint8_t)( dataType & (ui"
	.ascii	"nt8_t)0x4u)\000"
.LASF612:
	.ascii	"MEM_FLG_ISBLCKBEG(memFlgs) MEM_FLG_PARSE(memFlgs,ME"
	.ascii	"M_FLGS_ISBLCKBEG_SHFT)\000"
.LASF321:
	.ascii	"__ARM_SIZEOF_WCHAR_T 32\000"
.LASF448:
	.ascii	"AMOUNT_OF_EVTS (uint8_t)0x6u\000"
.LASF271:
	.ascii	"__TQ_FBIT__ 127\000"
.LASF77:
	.ascii	"__INTMAX_MAX__ 9223372036854775807LL\000"
.LASF715:
	.ascii	"mntr_INIT\000"
.LASF333:
	.ascii	"__ARM_NEON_FP 4\000"
.LASF285:
	.ascii	"__SA_FBIT__ 15\000"
.LASF491:
	.ascii	"RET_TSK_TOO_MANY ((RetCode)0x2Fu)\000"
.LASF616:
	.ascii	"MEM_FLG_SET_BLCKLAST(pMemMngrHead) MEM_FLG_SET_BIT_"
	.ascii	"MSK(pMemMngrHead, MEM_FLGS_ISBLCKLAST_MSK, addition"
	.ascii	"alFlags)\000"
.LASF259:
	.ascii	"__ULLACCUM_IBIT__ 32\000"
.LASF86:
	.ascii	"__INT64_MAX__ 9223372036854775807LL\000"
.LASF607:
	.ascii	"MEM_FLGS_PREV_SPLT_MSK ((MemFlags)0x2000u)\000"
.LASF188:
	.ascii	"__USFRACT_FBIT__ 8\000"
.LASF98:
	.ascii	"__INT64_C(c) c ## LL\000"
.LASF265:
	.ascii	"__HQ_FBIT__ 15\000"
.LASF292:
	.ascii	"__UHA_IBIT__ 8\000"
.LASF583:
	.ascii	"MEM_FLGS_ISBLCKLAST_MSK ((MemFlags)0x2u)\000"
.LASF184:
	.ascii	"__SFRACT_IBIT__ 0\000"
.LASF274:
	.ascii	"__UQQ_IBIT__ 0\000"
.LASF43:
	.ascii	"__UINT8_TYPE__ unsigned char\000"
.LASF470:
	.ascii	"TSK_STATE_IS_WAITING(pTsk) (TskState)(TSK_GETSTATE("
	.ascii	"pTsk) & TSK_STATE_WAITING)\000"
.LASF389:
	.ascii	"INT32_MAX __INT32_MAX__\000"
.LASF643:
	.ascii	"__uint8_t\000"
.LASF534:
	.ascii	"MEM_FLGS_SPLT_32_MSK ((MemFlags)0x20u)\000"
.LASF50:
	.ascii	"__INT_LEAST64_TYPE__ long long int\000"
.LASF451:
	.ascii	"SYSTCK_AR_RES_MSK (uint8_t)(SYSTCK_AR_RES - (uint8_"
	.ascii	"t)0x1u)\000"
.LASF433:
	.ascii	"UINTMAX_C(x) __UINTMAX_C(x)\000"
.LASF45:
	.ascii	"__UINT32_TYPE__ long unsigned int\000"
.LASF151:
	.ascii	"__LDBL_MIN_10_EXP__ (-307)\000"
.LASF478:
	.ascii	"TSK_STATE_IS_UNINIT_UNINIT(pTsk) (TskState)(TSK_GET"
	.ascii	"STATE(pTsk) == TSK_STATE_UNINIT_UNINIT)\000"
.LASF598:
	.ascii	"MEM_FLGS_PRV_MERGE512_SHFT MEM_FLGS_MERGE512_SHFT\000"
.LASF29:
	.ascii	"__SIZEOF_POINTER__ 4\000"
.LASF241:
	.ascii	"__UACCUM_MAX__ 0XFFFFFFFFP-16UK\000"
.LASF331:
	.ascii	"__VFP_FP__ 1\000"
.LASF438:
	.ascii	"MIN_STACK_SIZE ((StackSize)0x40u)\000"
.LASF211:
	.ascii	"__ULFRACT_MAX__ 0XFFFFFFFFP-32ULR\000"
.LASF702:
	.ascii	"mntr_InitMntr\000"
.LASF464:
	.ascii	"TSK_STATE_IS_ERROR(pTsk) (TskState)(TSK_GETSTATE(pT"
	.ascii	"sk) == TSK_STATE_ERROR)\000"
.LASF225:
	.ascii	"__SACCUM_MIN__ (-0X1P7HK-0X1P7HK)\000"
.LASF81:
	.ascii	"__SIG_ATOMIC_MAX__ 2147483647\000"
.LASF314:
	.ascii	"__GCC_ATOMIC_POINTER_LOCK_FREE 1\000"
.LASF712:
	.ascii	"GNU C 4.8.4 20140725 (release) [ARM/embedded-4_8-br"
	.ascii	"anch revision 213147] -fpreprocessed -mcpu=cortex-m"
	.ascii	"0plus -mthumb -g3 -std=c99 -fmessage-length=0 -fsig"
	.ascii	"ned-char -ffunction-sections -fdata-sections -fstac"
	.ascii	"k-usage\000"
.LASF619:
	.ascii	"MEM_FLG_SET_NXT_SPLT(pMemMngrHead) MEM_FLG_SET_BIT_"
	.ascii	"MSK(pMemMngrHead, MEM_FLGS_NXT_SPLT_MSK, additional"
	.ascii	"Flags)\000"
.LASF631:
	.ascii	"MEM_FLG_CLR_BGGRMRGD(pMemMngrHead) MEM_FLG_CLR_BIT_"
	.ascii	"MSK(pMemMngrHead, MEM_FLGS_BGGRMRGD_MSK, additional"
	.ascii	"Flags)\000"
.LASF247:
	.ascii	"__LACCUM_EPSILON__ 0x1P-31LK\000"
.LASF461:
	.ascii	"MQ_IS_TSK_ID(id) (uint8_t)((uint16_t)id & (uint16_t"
	.ascii	")0xFFu)\000"
.LASF697:
	.ascii	"mntr_getNextWaitr\000"
.LASF187:
	.ascii	"__SFRACT_EPSILON__ 0x1P-7HR\000"
.LASF447:
	.ascii	"AMOUNT_OF_SEMS (uint8_t)0x2u\000"
.LASF652:
	.ascii	"sizetype\000"
.LASF342:
	.ascii	"HEADERS_R_RTOS_INC_H_ \000"
.LASF277:
	.ascii	"__USQ_FBIT__ 32\000"
.LASF711:
	.ascii	"memPoolID_MNTR\000"
.LASF645:
	.ascii	"long unsigned int\000"
.LASF116:
	.ascii	"__UINTPTR_MAX__ 4294967295U\000"
.LASF307:
	.ascii	"__GCC_ATOMIC_CHAR32_T_LOCK_FREE 1\000"
.LASF1:
	.ascii	"__STDC_VERSION__ 199901L\000"
.LASF710:
	.ascii	"mntrWaitrRead\000"
.LASF466:
	.ascii	"TSK_STATE_IS_ACTIVE_RUNNING(pTsk) (TskState)(TSK_GE"
	.ascii	"TSTATE(pTsk) == TSK_STATE_ACTIVE_RUNNING )\000"
.LASF88:
	.ascii	"__UINT16_MAX__ 65535\000"
.LASF469:
	.ascii	"TSK_STATE_IS_ACTIVE_CRITSEC(pTsk) (TskState)(TSK_GE"
	.ascii	"TSTATE(pTsk) == TSK_STATE_ACTIVE_CRITSEC )\000"
.LASF79:
	.ascii	"__UINTMAX_MAX__ 18446744073709551615ULL\000"
.LASF197:
	.ascii	"__FRACT_EPSILON__ 0x1P-15R\000"
.LASF2:
	.ascii	"__STDC_HOSTED__ 1\000"
.LASF107:
	.ascii	"__INT_FAST8_MAX__ 2147483647\000"
.LASF621:
	.ascii	"MEM_FLG_PREV_SPLT(memFlgs) MEM_FLG_PARSE(memFlgs,ME"
	.ascii	"M_FLGS_PREV_SPLT_SHFT)\000"
.LASF687:
	.ascii	"mntr\000"
.LASF166:
	.ascii	"__DEC32_MAX__ 9.999999E96DF\000"
.LASF316:
	.ascii	"__PRAGMA_REDEFINE_EXTNAME 1\000"
.LASF330:
	.ascii	"__SOFTFP__ 1\000"
.LASF110:
	.ascii	"__INT_FAST64_MAX__ 9223372036854775807LL\000"
.LASF633:
	.ascii	"MEM_FLG_SET_CACHED(pMemMngrHead) MEM_FLG_SET_BIT_MS"
	.ascii	"K(pMemMngrHead, MEM_FLGS_CACHED_MSK, additionalFlag"
	.ascii	"s)\000"
.LASF564:
	.ascii	"MEM_FLG_CLR_NXTTAKEN(pMemMngrHead) MEM_FLG_CLR_BIT_"
	.ascii	"MSK(pMemMngrHead, MEM_FLGS_NXTTAKEN_MSK, flagsForMe"
	.ascii	"mBlock)\000"
.LASF628:
	.ascii	"MEM_FLG_PREV_SMALLER_COMBO(memFlgs) (MemSize)(MEM_F"
	.ascii	"LG_GET_PREV_MEMSIZE(memFlgs) & (MemSize)(-MEM_FLG_G"
	.ascii	"ET_PREV_MEMSIZE(memFlgs)))\000"
.LASF358:
	.ascii	"__STDINT_EXP(x) __ ##x ##__\000"
.LASF531:
	.ascii	"MEM_FLGS_SPLT_16_SHFT ((MemFlags)0x4u)\000"
.LASF540:
	.ascii	"MEM_FLGS_BGGSTBLCK_MSK ((MemFlags)0x100u)\000"
.LASF682:
	.ascii	"ptrXOR\000"
.LASF668:
	.ascii	"MNTR_READ\000"
.LASF566:
	.ascii	"MEM_FLG_SET_SPLIT(pMemMngrHead) MEM_FLG_SET_BIT_MSK"
	.ascii	"(pMemMngrHead, MEM_FLGS_SPLT_MSK, flagsForMemBlock)"
	.ascii	"\000"
.LASF312:
	.ascii	"__GCC_ATOMIC_LLONG_LOCK_FREE 1\000"
.LASF523:
	.ascii	"MEM_FLGS_TAKEN_SHFT ((MemFlags)0x0u)\000"
.LASF124:
	.ascii	"__FLT_MAX_EXP__ 128\000"
.LASF11:
	.ascii	"__ATOMIC_ACQ_REL 4\000"
.LASF338:
	.ascii	"__GXX_TYPEINFO_EQUALITY_INLINE 0\000"
.LASF525:
	.ascii	"MEM_FLGS_ISLOWER_SHFT ((MemFlags)0x1u)\000"
.LASF639:
	.ascii	"unsigned char\000"
.LASF163:
	.ascii	"__DEC32_MIN_EXP__ (-94)\000"
.LASF644:
	.ascii	"__uint32_t\000"
.LASF705:
	.ascii	"mntr_DestrMntr\000"
.LASF402:
	.ascii	"UINT_FAST8_MAX __UINT_FAST8_MAX__\000"
.LASF656:
	.ascii	"MNTR_ACCESS_NONE\000"
.LASF157:
	.ascii	"__LDBL_EPSILON__ 2.2204460492503131e-16L\000"
.LASF63:
	.ascii	"__INTPTR_TYPE__ int\000"
.LASF230:
	.ascii	"__USACCUM_MIN__ 0.0UHK\000"
.LASF593:
	.ascii	"MEM_FLGS_PRV_SPLT_64_MSK MEM_FLGS_SPLT_64_MSK\000"
.LASF189:
	.ascii	"__USFRACT_IBIT__ 0\000"
.LASF678:
	.ascii	"MNTR_RW\000"
.LASF558:
	.ascii	"MEM_FLG_CLR_TAKEN(pMemMngrHead) MEM_FLG_CLR_BIT_MSK"
	.ascii	"(pMemMngrHead, MEM_FLGS_TAKEN_MSK, flagsForMemBlock"
	.ascii	")\000"
.LASF694:
	.ascii	"PMntr\000"
.LASF494:
	.ascii	"RET_TSK_STILL_RUNNING ((RetCode)0x24u)\000"
.LASF270:
	.ascii	"__DQ_IBIT__ 0\000"
.LASF679:
	.ascii	"MNTR_RPW\000"
.LASF30:
	.ascii	"__SIZE_TYPE__ unsigned int\000"
.LASF341:
	.ascii	"HEADERS_R_RTOS_MONITOR_H_ \000"
.LASF421:
	.ascii	"WCHAR_MIN __WCHAR_MIN__\000"
.LASF377:
	.ascii	"INT8_MAX __INT8_MAX__\000"
.LASF258:
	.ascii	"__ULLACCUM_FBIT__ 32\000"
.LASF524:
	.ascii	"MEM_FLGS_TAKEN_MSK ((MemFlags)0x1u)\000"
.LASF541:
	.ascii	"MEM_FLGS_MERGE512_SHFT ((MemFlags)0x9u)\000"
.LASF485:
	.ascii	"OS_FULL_DISPATCH ((OsCode)0x2u)\000"
.LASF474:
	.ascii	"TSK_STATE_IS_WAITING_EVT(pTsk) (TskState)(TSK_GETST"
	.ascii	"ATE(pTsk) == TSK_STATE_WAITING_EVT)\000"
.LASF357:
	.ascii	"__EXP\000"
.LASF407:
	.ascii	"INT_FAST32_MAX __INT_FAST32_MAX__\000"
.LASF193:
	.ascii	"__FRACT_FBIT__ 15\000"
.LASF442:
	.ascii	"AMOUNT_OF_MSGQ (QID)(0x3u)\000"
.LASF353:
	.ascii	"___int_least8_t_defined 1\000"
.LASF507:
	.ascii	"BLCK_LIMIT ((BlckSize)0x800u)\000"
.LASF559:
	.ascii	"MEM_FLG_PREVTAKEN(memFlgs) MEM_FLG_PARSE(memFlgs,ME"
	.ascii	"M_FLGS_PREVTAKEN_SHFT)\000"
.LASF586:
	.ascii	"MEM_FLGS_PRV_SPLT_8_SHFT MEM_FLGS_SPLT_8_SHFT\000"
.LASF123:
	.ascii	"__FLT_MIN_10_EXP__ (-37)\000"
.LASF556:
	.ascii	"MEM_FLG_ISTAKEN(memFlgs) MEM_FLG_PARSE(memFlgs,MEM_"
	.ascii	"FLGS_TAKEN_SHFT)\000"
.LASF691:
	.ascii	"curState\000"
.LASF72:
	.ascii	"__WCHAR_MIN__ 0U\000"
.LASF146:
	.ascii	"__DBL_HAS_INFINITY__ 1\000"
.LASF57:
	.ascii	"__INT_FAST32_TYPE__ int\000"
.LASF224:
	.ascii	"__SACCUM_IBIT__ 8\000"
.LASF133:
	.ascii	"__FLT_HAS_QUIET_NAN__ 1\000"
.LASF14:
	.ascii	"__SIZEOF_INT__ 4\000"
.LASF34:
	.ascii	"__INTMAX_TYPE__ long long int\000"
.LASF574:
	.ascii	"MEM_FL_WASLOWER(memFlgs) MEM_FLG_PARSE(memFlgs,MEM_"
	.ascii	"FLGS_WASLOWER_SHFT)\000"
.LASF78:
	.ascii	"__INTMAX_C(c) c ## LL\000"
.LASF604:
	.ascii	"MEM_FLGS_NXT_SPLT_SHFT ((MemFlags)0xCu)\000"
.LASF689:
	.ascii	"mntrWaitrsQTskIDStrt\000"
.LASF680:
	.ascii	"MntrState\000"
.LASF552:
	.ascii	"MEM_FLGS_PREVTAKEN_MSK ((MemFlags)0x4000u)\000"
.LASF405:
	.ascii	"UINT_FAST16_MAX __UINT_FAST16_MAX__\000"
.LASF394:
	.ascii	"INT64_MIN (-__INT64_MAX__ - 1)\000"
.LASF432:
	.ascii	"INTMAX_C(x) __INTMAX_C(x)\000"
.LASF144:
	.ascii	"__DBL_DENORM_MIN__ ((double)4.9406564584124654e-324"
	.ascii	"L)\000"
.LASF638:
	.ascii	"signed char\000"
.LASF139:
	.ascii	"__DBL_MAX_10_EXP__ 308\000"
.LASF390:
	.ascii	"UINT32_MAX __UINT32_MAX__\000"
.LASF641:
	.ascii	"short unsigned int\000"
.LASF686:
	.ascii	"mntrWaitr\000"
.LASF376:
	.ascii	"INT8_MIN (-__INT8_MAX__ - 1)\000"
.LASF290:
	.ascii	"__TA_IBIT__ 64\000"
.LASF263:
	.ascii	"__QQ_FBIT__ 7\000"
.LASF372:
	.ascii	"__int_fast64_t_defined 1\000"
.LASF493:
	.ascii	"RET_TSK_CONFLICTING_IDLE_TSK ((RetCode)0x21u)\000"
.LASF322:
	.ascii	"__ARM_ARCH_PROFILE 77\000"
.LASF383:
	.ascii	"INT16_MAX __INT16_MAX__\000"
.LASF489:
	.ascii	"RET_MEM_ALLOC_FAIL_TCB ((RetCode)0x1Au)\000"
.LASF665:
	.ascii	"mntrAccssType\000"
.LASF419:
	.ascii	"PTRDIFF_MIN (-PTRDIFF_MAX - 1)\000"
.LASF122:
	.ascii	"__FLT_MIN_EXP__ (-125)\000"
.LASF584:
	.ascii	"MEM_FLGS_PRV_SPLT_4_SHFT MEM_FLGS_SPLT_4_SHFT\000"
.LASF509:
	.ascii	"BIGGEST_BLCK_MSK ((BlckSize)(BIGGEST_BLCK - (BlckSi"
	.ascii	"ze)1u))\000"
.LASF180:
	.ascii	"__DEC128_MAX__ 9.999999999999999999999999999999999E"
	.ascii	"6144DL\000"
.LASF154:
	.ascii	"__DECIMAL_DIG__ 17\000"
.LASF673:
	.ascii	"MNTR_FREE_NOOP\000"
.LASF21:
	.ascii	"__SIZEOF_SIZE_T__ 4\000"
.LASF382:
	.ascii	"INT16_MIN (-__INT16_MAX__ - 1)\000"
.LASF303:
	.ascii	"__STRICT_ANSI__ 1\000"
.LASF580:
	.ascii	"MEM_FLGS_ISBLCKBEG_SHFT ((MemFlags)0x0u)\000"
.LASF526:
	.ascii	"MEM_FLGS_ISLOWER_MSK ((MemFlags)0x2u)\000"
.LASF145:
	.ascii	"__DBL_HAS_DENORM__ 1\000"
.LASF630:
	.ascii	"MEM_FLG_SET_BGGRMRGD(pMemMngrHead) MEM_FLG_SET_BIT_"
	.ascii	"MSK(pMemMngrHead, MEM_FLGS_BGGRMRGD_MSK, additional"
	.ascii	"Flags)\000"
.LASF359:
	.ascii	"__have_longlong64 1\000"
.LASF396:
	.ascii	"UINT64_MAX __UINT64_MAX__\000"
.LASF521:
	.ascii	"MEM_FLG_SET_BIT_MSK(pMemMngrHead,msk,whichFlags) ME"
	.ascii	"M_FLG_GET_STRUC_PFIELD(pMemMngrHead, whichFlags) |="
	.ascii	" (MemFlags)msk\000"
.LASF298:
	.ascii	"__UTA_IBIT__ 64\000"
.LASF463:
	.ascii	"TSK_GETSTATE(pTsk) (TskState)(pTsk->tskState)\000"
.LASF504:
	.ascii	"calloc rCalloc\000"
.LASF206:
	.ascii	"__LFRACT_MAX__ 0X7FFFFFFFP-31LR\000"
.LASF6:
	.ascii	"__VERSION__ \"4.8.4 20140725 (release) [ARM/embedde"
	.ascii	"d-4_8-branch revision 213147]\"\000"
.LASF295:
	.ascii	"__UDA_FBIT__ 32\000"
.LASF204:
	.ascii	"__LFRACT_IBIT__ 0\000"
.LASF536:
	.ascii	"MEM_FLGS_SPLT_64_MSK ((MemFlags)0x40u)\000"
.LASF424:
	.ascii	"INT8_C(x) __INT8_C(x)\000"
.LASF659:
	.ascii	"MNTR_ACCESS_DELETE\000"
.LASF106:
	.ascii	"__UINT64_C(c) c ## ULL\000"
.LASF172:
	.ascii	"__DEC64_MIN__ 1E-383DD\000"
.LASF272:
	.ascii	"__TQ_IBIT__ 0\000"
.LASF335:
	.ascii	"__ARM_ARCH_6M__ 1\000"
.LASF68:
	.ascii	"__INT_MAX__ 2147483647\000"
.LASF713:
	.ascii	"../source/R_RTOS/R_RTOS_monitor.c\000"
.LASF624:
	.ascii	"MEM_FLG_GET_PREV_MEMSIZE(memFlgs) (BlckSize)(memFlg"
	.ascii	"s & MEM_FLGS_SIZE_MSK)\000"
.LASF215:
	.ascii	"__LLFRACT_MIN__ (-0.5LLR-0.5LLR)\000"
.LASF472:
	.ascii	"TSK_STATE_IS_WAITING_MSGRCV(pTsk) (TskState)(TSK_GE"
	.ascii	"TSTATE(pTsk) == TSK_STATE_WAITING_MSGRCV)\000"
.LASF588:
	.ascii	"MEM_FLGS_PRV_SPLT_16_SHFT MEM_FLGS_SPLT_16_SHFT\000"
.LASF392:
	.ascii	"INT_LEAST32_MAX __INT_LEAST32_MAX__\000"
.LASF222:
	.ascii	"__ULLFRACT_EPSILON__ 0x1P-64ULLR\000"
.LASF159:
	.ascii	"__LDBL_HAS_DENORM__ 1\000"
.LASF422:
	.ascii	"WINT_MAX __WINT_MAX__\000"
.LASF618:
	.ascii	"MEM_FLG_NXT_SPLT(memFlgs) MEM_FLG_PARSE(memFlgs,MEM"
	.ascii	"_FLGS_NXT_SPLT_SHFT)\000"
.LASF444:
	.ascii	"MSGQ_SYS_ID_POS (uint8_t)0x1u\000"
.LASF262:
	.ascii	"__ULLACCUM_EPSILON__ 0x1P-32ULLK\000"
.LASF169:
	.ascii	"__DEC64_MANT_DIG__ 16\000"
.LASF131:
	.ascii	"__FLT_HAS_DENORM__ 1\000"
.LASF238:
	.ascii	"__UACCUM_FBIT__ 16\000"
.LASF140:
	.ascii	"__DBL_DECIMAL_DIG__ 17\000"
	.ident	"GCC: (GNU Tools for ARM Embedded Processors) 4.8.4 20140725 (release) [ARM/embedded-4_8-branch revision 213147]"
