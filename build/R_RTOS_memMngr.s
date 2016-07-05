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
	.file	"R_RTOS_memMngr.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.section	.rodata.memoryHEAPBASE,"a",%progbits
	.align	2
	.type	memoryHEAPBASE, %object
	.size	memoryHEAPBASE, 4
memoryHEAPBASE:
	.word	__HeapBase
	.section	.rodata.failMemIndex,"a",%progbits
	.align	1
	.type	failMemIndex, %object
	.size	failMemIndex, 2
failMemIndex:
	.short	-1
	.section	.bss.freeMemLst,"aw",%nobits
	.align	2
	.type	freeMemLst, %object
	.size	freeMemLst, 4
freeMemLst:
	.space	4
	.section	.bss.objCache,"aw",%nobits
	.align	2
	.type	objCache, %object
	.size	objCache, 4
objCache:
	.space	4
	.section	.bss.objCacheEnd,"aw",%nobits
	.align	2
	.type	objCacheEnd, %object
	.size	objCacheEnd, 4
objCacheEnd:
	.space	4
	.section	.bss.buddyOffset,"aw",%nobits
	.type	buddyOffset, %object
	.size	buddyOffset, 1
buddyOffset:
	.space	1
	.section	.bss.cacheSize,"aw",%nobits
	.type	cacheSize, %object
	.size	cacheSize, 1
cacheSize:
	.space	1
	.section	.bss.memPoolsInUse,"aw",%nobits
	.align	2
	.type	memPoolsInUse, %object
	.size	memPoolsInUse, 4
memPoolsInUse:
	.space	4
	.section	.bss.memPools,"aw",%nobits
	.align	2
	.type	memPools, %object
	.size	memPools, 28
memPools:
	.space	28
	.section	.text.BREAK,"ax",%progbits
	.align	2
	.code	16
	.thumb_func
	.type	BREAK, %function
BREAK:
.LFB0:
	.file 1 "../source/R_RTOS/R_RTOS_memMngr.c"
	.loc 1 77 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	add	r7, sp, #0
	.cfi_def_cfa_register 7
.L2:
	.loc 1 81 0 discriminator 1
	b	.L2
	.cfi_endproc
.LFE0:
	.size	BREAK, .-BREAK
	.section	.text.setBlckMemSize,"ax",%progbits
	.align	2
	.code	16
	.thumb_func
	.type	setBlckMemSize, %function
setBlckMemSize:
.LFB1:
	.loc 1 92 0
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
	add	r3, r7, #2
	strh	r2, [r3]
	.loc 1 93 0
	add	r3, r7, #2
	ldrh	r3, [r3]
	cmp	r3, #255
	bhi	.L4
	.loc 1 95 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3]
	mov	r2, #128
	lsl	r2, r2, #5
	orr	r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #4]
	strh	r2, [r3]
	b	.L5
.L4:
	.loc 1 99 0
	ldr	r3, [r7, #4]
	ldrh	r2, [r3]
	ldr	r3, .L7
	and	r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #4]
	strh	r2, [r3]
.L5:
	.loc 1 103 0
	ldr	r3, [r7, #4]
	ldrh	r2, [r3]
	ldr	r3, .L7+4
	and	r3, r2
	uxth	r2, r3
	.loc 1 102 0
	ldr	r3, [r7, #4]
	strh	r2, [r3]
	.loc 1 106 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3]
	uxth	r2, r3
	add	r3, r7, #2
	ldrh	r3, [r3]
	add	r1, r3, #0
	ldr	r3, .L7+8
	and	r3, r1
	uxth	r3, r3
	orr	r3, r2
	uxth	r3, r3
	uxth	r2, r3
	.loc 1 105 0
	ldr	r3, [r7, #4]
	strh	r2, [r3]
	.loc 1 109 0
	add	r3, r7, #2
	ldrh	r3, [r3]
	.loc 1 110 0
	mov	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L8:
	.align	2
.L7:
	.word	-4097
	.word	-4093
	.word	4092
	.cfi_endproc
.LFE1:
	.size	setBlckMemSize, .-setBlckMemSize
	.section	.text.setPRVBlckMemSize,"ax",%progbits
	.align	2
	.code	16
	.thumb_func
	.type	setPRVBlckMemSize, %function
setPRVBlckMemSize:
.LFB2:
	.loc 1 120 0
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
	add	r3, r7, #2
	strh	r2, [r3]
	.loc 1 122 0
	ldr	r3, [r7, #4]
	ldrh	r2, [r3, #2]
	ldr	r3, .L11
	and	r3, r2
	uxth	r2, r3
	.loc 1 121 0
	ldr	r3, [r7, #4]
	strh	r2, [r3, #2]
	.loc 1 125 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #2]
	uxth	r2, r3
	add	r3, r7, #2
	ldrh	r3, [r3]
	add	r1, r3, #0
	ldr	r3, .L11+4
	and	r3, r1
	uxth	r3, r3
	orr	r3, r2
	uxth	r3, r3
	uxth	r2, r3
	.loc 1 124 0
	ldr	r3, [r7, #4]
	strh	r2, [r3, #2]
	.loc 1 127 0
	add	r3, r7, #2
	ldrh	r3, [r3]
	.loc 1 128 0
	mov	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L12:
	.align	2
.L11:
	.word	-4093
	.word	4092
	.cfi_endproc
.LFE2:
	.size	setPRVBlckMemSize, .-setPRVBlckMemSize
	.section	.text.initMEM,"ax",%progbits
	.align	2
	.global	initMEM
	.code	16
	.thumb_func
	.type	initMEM, %function
initMEM:
.LFB3:
	.loc 1 131 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	sub	sp, sp, #8
	.cfi_def_cfa_offset 16
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 132 0
	ldr	r2, .L19
	ldr	r3, .L19+4
	str	r2, [r3]
	ldr	r3, .L19+4
	ldr	r3, [r3]
	str	r3, [r7, #4]
	.loc 1 134 0
	ldr	r3, .L19
	uxtb	r2, r3
	ldr	r3, .L19+8
	strb	r2, [r3]
	.loc 1 137 0
	add	r3, r7, #2
	mov	r2, #1
	neg	r2, r2
	strh	r2, [r3]
	.loc 1 138 0
	mov	r3, r7
	mov	r2, #0
	strh	r2, [r3]
	.loc 1 140 0
	b	.L14
.L17:
	.loc 1 143 0
	ldr	r2, .L19
	mov	r3, r7
	ldrh	r3, [r3]
	lsl	r3, r3, #3
	add	r3, r2, r3
	str	r3, [r7, #4]
	.loc 1 145 0
	ldr	r2, [r7, #4]
	ldr	r3, .L19+12
	cmp	r2, r3
	bcc	.L15
	.loc 1 147 0
	ldr	r2, .L19
	add	r3, r7, #2
	ldrh	r3, [r3]
	lsl	r3, r3, #3
	add	r3, r2, r3
	str	r3, [r7, #4]
	.loc 1 148 0
	b	.L16
.L15:
	.loc 1 152 0
	ldr	r3, [r7, #4]
	mov	r2, #0
	strh	r2, [r3]
	.loc 1 154 0
	ldr	r2, [r7, #4]
	mov	r3, #128
	lsl	r3, r3, #1
	mov	r0, r2
	mov	r1, r3
	bl	setBlckMemSize
	.loc 1 156 0
	ldr	r3, [r7, #4]
	mov	r2, #0
	strh	r2, [r3, #2]
	.loc 1 158 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #2]
	mov	r2, #1
	orr	r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #4]
	strh	r2, [r3, #2]
	.loc 1 160 0
	ldr	r2, [r7, #4]
	mov	r3, #128
	lsl	r3, r3, #1
	mov	r0, r2
	mov	r1, r3
	bl	setPRVBlckMemSize
	.loc 1 162 0
	ldr	r3, [r7, #4]
	add	r2, r7, #2
	ldrh	r2, [r2]
	strh	r2, [r3, #6]
	.loc 1 165 0
	add	r3, r7, #2
	mov	r2, r7
	ldrh	r2, [r2]
	strh	r2, [r3]
	.loc 1 167 0
	mov	r3, r7
	mov	r2, r7
	ldrh	r2, [r2]
	add	r2, r2, #32
	strh	r2, [r3]
	.loc 1 172 0
	ldr	r3, [r7, #4]
	mov	r2, r7
	ldrh	r2, [r2]
	strh	r2, [r3, #4]
.L14:
	.loc 1 140 0 discriminator 1
	ldr	r3, [r7, #4]
	cmp	r3, #0
	bne	.L17
.L16:
	.loc 1 175 0
	ldr	r3, .L19+4
	ldr	r3, [r3]
	ldr	r2, .L19+16
	strh	r2, [r3, #6]
	.loc 1 176 0
	ldr	r3, .L19+4
	ldr	r3, [r3]
	mov	r0, r3
	mov	r1, #0
	bl	setPRVBlckMemSize
	.loc 1 177 0
	ldr	r2, .L19+16
	ldr	r3, [r7, #4]
	strh	r2, [r3, #4]
	.loc 1 178 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #2]
	mov	r2, #2
	orr	r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #4]
	strh	r2, [r3, #2]
	.loc 1 182 0
	ldr	r3, .L19+20
	mov	r2, #128
	str	r2, [r3]
	.loc 1 184 0
	ldr	r3, .L19+20
	ldr	r3, [r3]
	neg	r2, r3
	ldr	r3, .L19+20
	ldr	r3, [r3]
	orr	r2, r3
	ldr	r3, .L19+20
	str	r2, [r3]
	.loc 1 186 0
	mov	r3, #1
	.loc 1 187 0
	mov	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L20:
	.align	2
.L19:
	.word	__HeapBase
	.word	freeMemLst
	.word	buddyOffset
	.word	__HeapLimit
	.word	65535
	.word	memPoolsInUse
	.cfi_endproc
.LFE3:
	.size	initMEM, .-initMEM
	.section	.text.delMemBlck,"ax",%progbits
	.align	2
	.code	16
	.thumb_func
	.type	delMemBlck, %function
delMemBlck:
.LFB4:
	.loc 1 197 0
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
	.loc 1 198 0
	ldr	r3, [r7, #4]
	ldrh	r2, [r3, #4]
	ldr	r3, .L25
	cmp	r2, r3
	beq	.L22
	.loc 1 201 0
	ldr	r2, .L25+4
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #4]
	lsl	r3, r3, #3
	add	r3, r2, r3
	.loc 1 202 0
	ldr	r2, [r7, #4]
	ldrh	r2, [r2, #6]
	.loc 1 201 0
	strh	r2, [r3, #6]
.L22:
	.loc 1 204 0
	ldr	r3, [r7, #4]
	ldrh	r2, [r3, #6]
	ldr	r3, .L25
	cmp	r2, r3
	beq	.L23
	.loc 1 207 0
	ldr	r2, .L25+4
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #6]
	lsl	r3, r3, #3
	add	r3, r2, r3
	.loc 1 208 0
	ldr	r2, [r7, #4]
	ldrh	r2, [r2, #4]
	.loc 1 207 0
	strh	r2, [r3, #4]
	b	.L21
.L23:
	.loc 1 212 0
	ldr	r2, .L25+4
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #4]
	lsl	r3, r3, #3
	add	r2, r2, r3
	ldr	r3, .L25+8
	str	r2, [r3]
.L21:
	.loc 1 214 0
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L26:
	.align	2
.L25:
	.word	65535
	.word	__HeapBase
	.word	freeMemLst
	.cfi_endproc
.LFE4:
	.size	delMemBlck, .-delMemBlck
	.section	.text.getAdjacentPrevBlck,"ax",%progbits
	.align	2
	.code	16
	.thumb_func
	.type	getAdjacentPrevBlck, %function
getAdjacentPrevBlck:
.LFB5:
	.loc 1 224 0
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
	.loc 1 225 0
	ldr	r2, [r7, #4]
	.loc 1 226 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #2]
	mov	r1, r3
	ldr	r3, .L31
	and	r3, r1
	sub	r3, r2, r3
	.loc 1 225 0
	str	r3, [r7, #12]
	.loc 1 229 0
	ldr	r2, [r7, #12]
	ldr	r3, .L31+4
	.loc 1 230 0
	cmp	r2, r3
	bls	.L28
	.loc 1 230 0 is_stmt 0 discriminator 1
	ldr	r3, [r7, #12]
	b	.L29
.L28:
	.loc 1 230 0 discriminator 2
	mov	r3, #0
.L29:
	.loc 1 231 0 is_stmt 1
	mov	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.L32:
	.align	2
.L31:
	.word	4092
	.word	__HeapBase
	.cfi_endproc
.LFE5:
	.size	getAdjacentPrevBlck, .-getAdjacentPrevBlck
	.section	.text.getAdjacentNxtBlck,"ax",%progbits
	.align	2
	.code	16
	.thumb_func
	.type	getAdjacentNxtBlck, %function
getAdjacentNxtBlck:
.LFB6:
	.loc 1 241 0
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
	.loc 1 243 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3]
	mov	r2, r3
	ldr	r3, .L37
	and	r2, r3
	.loc 1 242 0
	ldr	r3, [r7, #4]
	.loc 1 243 0
	add	r3, r2, r3
	.loc 1 242 0
	str	r3, [r7, #12]
	.loc 1 245 0
	ldr	r2, [r7, #12]
	ldr	r3, .L37+4
	.loc 1 246 0
	cmp	r2, r3
	bcs	.L34
	.loc 1 246 0 is_stmt 0 discriminator 1
	ldr	r3, [r7, #12]
	b	.L35
.L34:
	.loc 1 246 0 discriminator 2
	mov	r3, #0
.L35:
	.loc 1 247 0 is_stmt 1
	mov	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.L38:
	.align	2
.L37:
	.word	4092
	.word	__HeapLimit
	.cfi_endproc
.LFE6:
	.size	getAdjacentNxtBlck, .-getAdjacentNxtBlck
	.section	.text.getBuddyBlck,"ax",%progbits
	.align	2
	.code	16
	.thumb_func
	.type	getBuddyBlck, %function
getBuddyBlck:
.LFB7:
	.loc 1 260 0
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
	.loc 1 261 0
	ldr	r2, [r7, #4]
	.loc 1 262 0
	ldr	r3, .L41
	ldrb	r3, [r3]
	.loc 1 261 0
	sub	r2, r2, r3
	.loc 1 263 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3]
	mov	r1, r3
	ldr	r3, .L41+4
	and	r3, r1
	.loc 1 261 0
	eor	r2, r3
	.loc 1 265 0
	ldr	r3, .L41
	ldrb	r3, [r3]
	add	r3, r2, r3
	.loc 1 266 0
	mov	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L42:
	.align	2
.L41:
	.word	buddyOffset
	.word	4092
	.cfi_endproc
.LFE7:
	.size	getBuddyBlck, .-getBuddyBlck
	.section	.text.getIndex,"ax",%progbits
	.align	2
	.code	16
	.thumb_func
	.type	getIndex, %function
getIndex:
.LFB8:
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
	ldr	r2, [r7, #4]
	ldr	r3, .L47
	cmp	r2, r3
	bcc	.L44
	.loc 1 270 0 is_stmt 0 discriminator 1
	ldr	r2, [r7, #4]
	ldr	r3, .L47+4
	cmp	r2, r3
	bls	.L45
.L44:
	.loc 1 272 0 is_stmt 1
	bl	BREAK
.L45:
	.loc 1 274 0
	ldr	r2, [r7, #4]
	.loc 1 275 0
	ldr	r3, .L47
	sub	r3, r2, r3
	.loc 1 274 0
	uxth	r3, r3
	lsr	r3, r3, #3
	uxth	r3, r3
	.loc 1 277 0
	mov	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L48:
	.align	2
.L47:
	.word	__HeapBase
	.word	__HeapLimit
	.cfi_endproc
.LFE8:
	.size	getIndex, .-getIndex
	.section	.text.fitBlckBackIntoFreeLst,"ax",%progbits
	.align	2
	.code	16
	.thumb_func
	.type	fitBlckBackIntoFreeLst, %function
fitBlckBackIntoFreeLst:
.LFB9:
	.loc 1 289 0
	.cfi_startproc
	push	{r4, r7, lr}
	.cfi_def_cfa_offset 12
	.cfi_offset 4, -12
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	sub	sp, sp, #20
	.cfi_def_cfa_offset 32
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	str	r0, [r7, #4]
	.loc 1 292 0
	mov	r4, r7
	add	r4, r4, #10
	ldr	r3, [r7, #4]
	mov	r0, r3
	bl	getIndex
	mov	r3, r0
	strh	r3, [r4]
	.loc 1 293 0
	ldr	r3, .L56
	ldr	r3, [r3]
	mov	r4, r7
	add	r4, r4, #14
	mov	r0, r3
	bl	getIndex
	mov	r3, r0
	strh	r3, [r4]
	.loc 1 294 0
	mov	r3, r7
	add	r3, r3, #12
	mov	r2, #1
	neg	r2, r2
	strh	r2, [r3]
	.loc 1 310 0
	b	.L50
.L52:
	.loc 1 312 0
	mov	r3, r7
	add	r3, r3, #12
	mov	r2, r7
	add	r2, r2, #14
	ldrh	r2, [r2]
	strh	r2, [r3]
	.loc 1 313 0
	ldr	r2, .L56+4
	mov	r3, r7
	add	r3, r3, #14
	ldrh	r3, [r3]
	lsl	r3, r3, #3
	add	r2, r2, r3
	mov	r3, r7
	add	r3, r3, #14
	ldrh	r2, [r2, #4]
	strh	r2, [r3]
	.loc 1 314 0
	ldr	r3, .L56+8
	mov	r2, r7
	add	r2, r2, #14
	ldrh	r2, [r2]
	cmp	r2, r3
	bne	.L50
	.loc 1 316 0
	b	.L51
.L50:
	.loc 1 310 0 discriminator 1
	mov	r2, r7
	add	r2, r2, #10
	mov	r3, r7
	add	r3, r3, #14
	ldrh	r2, [r2]
	ldrh	r3, [r3]
	cmp	r2, r3
	bhi	.L52
.L51:
	.loc 1 320 0
	ldr	r3, [r7, #4]
	mov	r2, r7
	add	r2, r2, #14
	ldrh	r2, [r2]
	strh	r2, [r3, #4]
	.loc 1 321 0
	ldr	r3, [r7, #4]
	mov	r2, r7
	add	r2, r2, #12
	ldrh	r2, [r2]
	strh	r2, [r3, #6]
	.loc 1 323 0
	ldr	r3, .L56+8
	mov	r2, r7
	add	r2, r2, #14
	ldrh	r2, [r2]
	cmp	r2, r3
	beq	.L53
	.loc 1 325 0
	ldr	r2, .L56+4
	mov	r3, r7
	add	r3, r3, #14
	ldrh	r3, [r3]
	lsl	r3, r3, #3
	add	r3, r2, r3
	mov	r2, r7
	add	r2, r2, #10
	ldrh	r2, [r2]
	strh	r2, [r3, #6]
.L53:
	.loc 1 327 0
	ldr	r3, .L56+8
	mov	r2, r7
	add	r2, r2, #12
	ldrh	r2, [r2]
	cmp	r2, r3
	beq	.L54
	.loc 1 329 0
	ldr	r2, .L56+4
	mov	r3, r7
	add	r3, r3, #12
	ldrh	r3, [r3]
	lsl	r3, r3, #3
	add	r3, r2, r3
	mov	r2, r7
	add	r2, r2, #10
	ldrh	r2, [r2]
	strh	r2, [r3, #4]
	b	.L49
.L54:
	.loc 1 333 0
	ldr	r3, .L56
	ldr	r2, [r7, #4]
	str	r2, [r3]
.L49:
	.loc 1 335 0
	mov	sp, r7
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r7, pc}
.L57:
	.align	2
.L56:
	.word	freeMemLst
	.word	__HeapBase
	.word	65535
	.cfi_endproc
.LFE9:
	.size	fitBlckBackIntoFreeLst, .-fitBlckBackIntoFreeLst
	.section	.text.mergeMemBlck,"ax",%progbits
	.align	2
	.code	16
	.thumb_func
	.type	mergeMemBlck, %function
mergeMemBlck:
.LFB10:
	.loc 1 347 0
	.cfi_startproc
	push	{r4, r7, lr}
	.cfi_def_cfa_offset 12
	.cfi_offset 4, -12
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	sub	sp, sp, #28
	.cfi_def_cfa_offset 40
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	str	r0, [r7, #4]
	.loc 1 348 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldrh	r1, [r3]
	mov	r3, r7
	add	r3, r3, #22
	ldr	r2, .L75
	and	r2, r1
	strh	r2, [r3]
	.loc 1 352 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldrh	r3, [r3]
	lsr	r3, r3, #1
	uxth	r3, r3
	mov	r2, r3
	mov	r3, #1
	and	r3, r2
	beq	.L59
.LBB2:
	.loc 1 354 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	mov	r0, r3
	bl	getAdjacentNxtBlck
	mov	r3, r0
	str	r3, [r7, #16]
	.loc 1 356 0
	ldr	r3, [r7, #16]
	cmp	r3, #0
	beq	.L60
	.loc 1 356 0 is_stmt 0 discriminator 1
	ldr	r3, [r7, #16]
	ldrh	r3, [r3]
	uxth	r3, r3
	add	r2, r3, #0
	mov	r3, #1
	and	r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #16]
	ldrh	r3, [r3, #2]
	lsr	r3, r3, #15
	uxth	r3, r3
	uxth	r3, r3
	orr	r3, r2
	uxth	r3, r3
	cmp	r3, #0
	beq	.L61
.L60:
	.loc 1 359 0 is_stmt 1
	mov	r3, #0
	b	.L62
.L61:
	.loc 1 363 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldrh	r3, [r3]
	mov	r2, r3
	ldr	r3, [r7, #16]
	ldrh	r3, [r3]
	eor	r2, r3
	ldr	r3, .L75
	and	r3, r2
	bne	.L63
	.loc 1 367 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r7, #16]
	ldrh	r2, [r2, #4]
	strh	r2, [r3, #4]
	.loc 1 368 0
	ldr	r3, [r7, #16]
	ldrh	r2, [r3, #4]
	ldr	r3, .L75+4
	cmp	r2, r3
	beq	.L64
	.loc 1 370 0
	ldr	r2, .L75+8
	ldr	r3, [r7, #16]
	ldrh	r3, [r3, #4]
	lsl	r3, r3, #3
	add	r4, r2, r3
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	mov	r0, r3
	bl	getIndex
	mov	r3, r0
	strh	r3, [r4, #6]
.L64:
	.loc 1 373 0
	mov	r2, r7
	add	r2, r2, #22
	mov	r3, r7
	add	r3, r3, #22
	ldrh	r3, [r3]
	add	r3, r3, r3
	strh	r3, [r2]
	.loc 1 374 0
	ldr	r3, [r7, #4]
	ldr	r2, [r3]
	mov	r3, r7
	add	r3, r3, #22
	ldrh	r3, [r3]
	mov	r0, r2
	mov	r1, r3
	bl	setBlckMemSize
	.loc 1 375 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	mov	r0, r3
	bl	getAdjacentNxtBlck
	mov	r3, r0
	str	r3, [r7, #12]
	.loc 1 376 0
	ldr	r3, [r7, #12]
	cmp	r3, #0
	beq	.L66
	.loc 1 378 0
	ldr	r2, [r7, #12]
	mov	r3, r7
	add	r3, r3, #22
	ldrh	r3, [r3]
	mov	r0, r2
	mov	r1, r3
	bl	setPRVBlckMemSize
.LBE2:
	b	.L67
.L63:
.LBB3:
	.loc 1 383 0
	mov	r3, #0
	b	.L62
.L66:
.LBE3:
	b	.L67
.L59:
.LBB4:
	.loc 1 389 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	mov	r0, r3
	bl	getAdjacentPrevBlck
	mov	r3, r0
	str	r3, [r7, #8]
	.loc 1 392 0
	ldr	r3, [r7, #8]
	cmp	r3, #0
	beq	.L68
	.loc 1 392 0 is_stmt 0 discriminator 1
	ldr	r3, [r7, #8]
	ldrh	r3, [r3]
	uxth	r3, r3
	add	r2, r3, #0
	mov	r3, #1
	and	r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #8]
	ldrh	r3, [r3, #2]
	lsr	r3, r3, #15
	uxth	r3, r3
	uxth	r3, r3
	orr	r3, r2
	uxth	r3, r3
	cmp	r3, #0
	beq	.L69
.L68:
	.loc 1 395 0 is_stmt 1
	mov	r3, #0
	b	.L62
.L69:
	.loc 1 399 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldrh	r3, [r3]
	mov	r2, r3
	ldr	r3, [r7, #8]
	ldrh	r3, [r3]
	eor	r2, r3
	ldr	r3, .L75
	and	r3, r2
	bne	.L70
	.loc 1 402 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldrh	r2, [r3, #4]
	ldr	r3, [r7, #8]
	strh	r2, [r3, #4]
	.loc 1 403 0
	ldr	r3, [r7, #8]
	ldrh	r2, [r3, #4]
	ldr	r3, .L75+4
	cmp	r2, r3
	beq	.L71
	.loc 1 405 0
	ldr	r2, .L75+8
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldrh	r3, [r3, #4]
	lsl	r3, r3, #3
	add	r4, r2, r3
	.loc 1 406 0
	ldr	r3, [r7, #8]
	mov	r0, r3
	bl	getIndex
	mov	r3, r0
	.loc 1 405 0
	strh	r3, [r4, #6]
.L71:
	.loc 1 409 0
	ldr	r3, [r7, #4]
	ldr	r2, [r7, #8]
	str	r2, [r3]
	.loc 1 410 0
	mov	r2, r7
	add	r2, r2, #22
	mov	r3, r7
	add	r3, r3, #22
	ldrh	r3, [r3]
	add	r3, r3, r3
	strh	r3, [r2]
	.loc 1 411 0
	ldr	r3, [r7, #4]
	ldr	r2, [r3]
	mov	r3, r7
	add	r3, r3, #22
	ldrh	r3, [r3]
	mov	r0, r2
	mov	r1, r3
	bl	setBlckMemSize
	.loc 1 412 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	mov	r0, r3
	bl	getAdjacentNxtBlck
	mov	r3, r0
	str	r3, [r7, #12]
	.loc 1 413 0
	ldr	r3, [r7, #12]
	cmp	r3, #0
	beq	.L72
	.loc 1 416 0
	ldr	r2, [r7, #12]
	mov	r3, r7
	add	r3, r3, #22
	ldrh	r3, [r3]
	mov	r0, r2
	mov	r1, r3
	bl	setPRVBlckMemSize
	b	.L67
.L72:
	.loc 1 420 0
	mov	r3, #0
	b	.L62
.L70:
	.loc 1 425 0
	mov	r3, #0
	b	.L62
.L67:
.LBE4:
	.loc 1 431 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	mov	r4, r3
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	mov	r0, r3
	bl	getBuddyBlck
	mov	r3, r0
	cmp	r4, r3
	bls	.L73
	.loc 1 434 0
	ldr	r3, [r7, #4]
	ldr	r2, [r3]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldrh	r3, [r3]
	mov	r1, #2
	bic	r3, r1
	uxth	r3, r3
	strh	r3, [r2]
	b	.L74
.L73:
	.loc 1 438 0
	ldr	r3, [r7, #4]
	ldr	r2, [r3]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldrh	r3, [r3]
	mov	r1, #2
	orr	r3, r1
	uxth	r3, r3
	strh	r3, [r2]
.L74:
	.loc 1 440 0
	mov	r3, #1
.L62:
	.loc 1 441 0
	mov	r0, r3
	mov	sp, r7
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r7, pc}
.L76:
	.align	2
.L75:
	.word	4092
	.word	65535
	.word	__HeapBase
	.cfi_endproc
.LFE10:
	.size	mergeMemBlck, .-mergeMemBlck
	.section	.text.reMergeMemBlck,"ax",%progbits
	.align	2
	.code	16
	.thumb_func
	.type	reMergeMemBlck, %function
reMergeMemBlck:
.LFB11:
	.loc 1 451 0
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
	.loc 1 452 0
	b	.L78
.L80:
	.loc 1 454 0
	ldr	r3, [r7, #4]
	mov	r0, r3
	bl	mergeMemBlck
	mov	r3, r0
	cmp	r3, #0
	bne	.L78
	.loc 1 455 0
	b	.L77
.L78:
	.loc 1 452 0 discriminator 1
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldrh	r3, [r3]
	lsr	r3, r3, #12
	uxth	r3, r3
	mov	r2, r3
	mov	r3, #1
	and	r3, r2
	bne	.L80
.L77:
	.loc 1 457 0
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
	.cfi_endproc
.LFE11:
	.size	reMergeMemBlck, .-reMergeMemBlck
	.section	.text.splitMemBlck,"ax",%progbits
	.align	2
	.code	16
	.thumb_func
	.type	splitMemBlck, %function
splitMemBlck:
.LFB12:
	.loc 1 467 0
	.cfi_startproc
	push	{r4, r7, lr}
	.cfi_def_cfa_offset 12
	.cfi_offset 4, -12
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	sub	sp, sp, #28
	.cfi_def_cfa_offset 40
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	str	r0, [r7, #4]
	.loc 1 468 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldrh	r3, [r3]
	.loc 1 470 0
	mov	r2, r3
	ldr	r3, .L84
	and	r3, r2
	asr	r2, r3, #1
	.loc 1 468 0
	mov	r3, r7
	add	r3, r3, #22
	strh	r2, [r3]
	.loc 1 472 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	mov	r2, r3
	mov	r3, r7
	add	r3, r3, #22
	ldrh	r3, [r3]
	add	r3, r2, r3
	.loc 1 471 0
	str	r3, [r7, #16]
	.loc 1 474 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	mov	r0, r3
	bl	getAdjacentNxtBlck
	mov	r3, r0
	str	r3, [r7, #12]
	.loc 1 477 0
	ldr	r3, [r7, #12]
	cmp	r3, #0
	beq	.L82
	.loc 1 479 0
	ldr	r2, [r7, #12]
	mov	r3, r7
	add	r3, r3, #22
	ldrh	r3, [r3]
	mov	r0, r2
	mov	r1, r3
	bl	setPRVBlckMemSize
.L82:
	.loc 1 482 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldrh	r2, [r3, #4]
	ldr	r3, [r7, #16]
	strh	r2, [r3, #4]
	.loc 1 483 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	mov	r0, r3
	bl	getIndex
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [r7, #16]
	strh	r2, [r3, #6]
	.loc 1 484 0
	ldr	r3, [r7, #16]
	ldrh	r2, [r3, #4]
	ldr	r3, .L84+4
	cmp	r2, r3
	beq	.L83
	.loc 1 486 0
	ldr	r2, .L84+8
	ldr	r3, [r7, #16]
	ldrh	r3, [r3, #4]
	lsl	r3, r3, #3
	add	r4, r2, r3
	ldr	r3, [r7, #16]
	mov	r0, r3
	bl	getIndex
	mov	r3, r0
	strh	r3, [r4, #6]
.L83:
	.loc 1 489 0
	ldr	r3, [r7, #4]
	ldr	r4, [r3]
	ldr	r3, [r7, #16]
	mov	r0, r3
	bl	getIndex
	mov	r3, r0
	strh	r3, [r4, #4]
	.loc 1 490 0
	ldr	r3, [r7, #16]
	mov	r2, #0
	strh	r2, [r3]
	.loc 1 491 0
	ldr	r3, [r7, #16]
	mov	r2, #0
	strh	r2, [r3, #2]
	.loc 1 492 0
	ldr	r2, [r7, #16]
	mov	r3, r7
	add	r3, r3, #22
	ldrh	r3, [r3]
	mov	r0, r2
	mov	r1, r3
	bl	setBlckMemSize
	.loc 1 493 0
	ldr	r2, [r7, #16]
	mov	r3, r7
	add	r3, r3, #22
	ldrh	r3, [r3]
	mov	r0, r2
	mov	r1, r3
	bl	setPRVBlckMemSize
	.loc 1 494 0
	ldr	r3, [r7, #4]
	ldr	r2, [r3]
	mov	r3, r7
	add	r3, r3, #22
	ldrh	r3, [r3]
	mov	r0, r2
	mov	r1, r3
	bl	setBlckMemSize
	.loc 1 495 0
	ldr	r3, [r7, #4]
	ldr	r2, [r3]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldrh	r3, [r3]
	mov	r1, #2
	orr	r3, r1
	uxth	r3, r3
	strh	r3, [r2]
	.loc 1 496 0
	mov	sp, r7
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r7, pc}
.L85:
	.align	2
.L84:
	.word	4092
	.word	65535
	.word	__HeapBase
	.cfi_endproc
.LFE12:
	.size	splitMemBlck, .-splitMemBlck
	.section	.text.unMergeUnevenBlcks,"ax",%progbits
	.align	2
	.code	16
	.thumb_func
	.type	unMergeUnevenBlcks, %function
unMergeUnevenBlcks:
.LFB13:
	.loc 1 508 0
	.cfi_startproc
	push	{r4, r7, lr}
	.cfi_def_cfa_offset 12
	.cfi_offset 4, -12
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	sub	sp, sp, #28
	.cfi_def_cfa_offset 40
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	str	r0, [r7, #4]
	.loc 1 510 0
	mov	r3, r7
	add	r3, r3, #22
	mov	r2, #0
	strh	r2, [r3]
	.loc 1 511 0
	mov	r3, r7
	add	r3, r3, #20
	mov	r2, #0
	strh	r2, [r3]
	.loc 1 514 0
	b	.L87
.L92:
	.loc 1 516 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3]
	ldr	r2, [r7, #4]
	ldrh	r1, [r2]
	ldr	r2, .L93
	and	r2, r1
	uxth	r2, r2
	neg	r2, r2
	uxth	r2, r2
	and	r3, r2
	uxth	r1, r3
	mov	r3, r7
	add	r3, r3, #20
	ldr	r2, .L93
	and	r2, r1
	strh	r2, [r3]
	.loc 1 518 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3]
	uxth	r3, r3
	add	r2, r3, #0
	ldr	r3, .L93
	and	r3, r2
	uxth	r3, r3
	mov	r2, r7
	add	r2, r2, #20
	ldrh	r2, [r2]
	mvn	r2, r2
	uxth	r2, r2
	and	r3, r2
	uxth	r2, r3
	mov	r3, r7
	add	r3, r3, #22
	strh	r2, [r3]
	.loc 1 523 0
	mov	r3, r7
	add	r3, r3, #22
	ldrh	r2, [r3]
	.loc 1 522 0
	ldr	r3, [r7, #4]
	.loc 1 523 0
	add	r3, r2, r3
	.loc 1 522 0
	str	r3, [r7, #12]
	.loc 1 525 0
	ldr	r3, [r7, #12]
	mov	r2, #0
	strh	r2, [r3]
	.loc 1 526 0
	ldr	r3, [r7, #12]
	mov	r2, #0
	strh	r2, [r3, #2]
	.loc 1 527 0
	ldr	r2, [r7, #12]
	mov	r3, r7
	add	r3, r3, #20
	ldrh	r3, [r3]
	mov	r0, r2
	mov	r1, r3
	bl	setBlckMemSize
	.loc 1 528 0
	ldr	r3, [r7, #12]
	mov	r0, r3
	bl	getAdjacentNxtBlck
	mov	r3, r0
	str	r3, [r7, #16]
	.loc 1 529 0
	ldr	r3, [r7, #16]
	cmp	r3, #0
	beq	.L88
	.loc 1 531 0
	ldr	r2, [r7, #16]
	mov	r3, r7
	add	r3, r3, #20
	ldrh	r3, [r3]
	mov	r0, r2
	mov	r1, r3
	bl	setPRVBlckMemSize
.L88:
	.loc 1 533 0
	ldr	r2, [r7, #12]
	mov	r3, r7
	add	r3, r3, #22
	ldrh	r3, [r3]
	mov	r0, r2
	mov	r1, r3
	bl	setPRVBlckMemSize
	.loc 1 535 0
	ldr	r3, [r7, #12]
	mov	r4, r3
	ldr	r3, [r7, #12]
	mov	r0, r3
	bl	getBuddyBlck
	mov	r3, r0
	cmp	r4, r3
	bls	.L89
	.loc 1 538 0
	ldr	r3, [r7, #12]
	ldr	r2, [r7, #12]
	ldrh	r2, [r2]
	mov	r1, #2
	bic	r2, r1
	uxth	r2, r2
	strh	r2, [r3]
	b	.L90
.L89:
	.loc 1 542 0
	ldr	r3, [r7, #12]
	ldr	r2, [r7, #12]
	ldrh	r2, [r2]
	mov	r1, #2
	orr	r2, r1
	uxth	r2, r2
	strh	r2, [r3]
.L90:
	.loc 1 545 0
	ldr	r3, [r7, #12]
	ldr	r2, [r7, #12]
	ldrh	r2, [r2]
	mov	r1, #1
	bic	r2, r1
	uxth	r2, r2
	strh	r2, [r3]
	.loc 1 546 0
	ldr	r2, [r7, #12]
	mov	r3, r7
	add	r3, r3, #22
	ldrh	r3, [r3]
	mov	r0, r2
	mov	r1, r3
	bl	setPRVBlckMemSize
	.loc 1 547 0
	ldr	r3, [r7, #12]
	mov	r0, r3
	bl	fitBlckBackIntoFreeLst
	.loc 1 549 0
	mov	r3, r7
	add	r3, r3, #20
	ldrh	r3, [r3]
	cmp	r3, #255
	bhi	.L91
	.loc 1 550 0
	mov	r3, r7
	add	r3, r3, #12
	mov	r0, r3
	bl	reMergeMemBlck
.L91:
	.loc 1 552 0
	ldr	r2, [r7, #4]
	mov	r3, r7
	add	r3, r3, #22
	ldrh	r3, [r3]
	mov	r0, r2
	mov	r1, r3
	bl	setBlckMemSize
.L87:
	.loc 1 514 0 discriminator 1
	ldr	r3, [r7, #4]
	ldrh	r3, [r3]
	mov	r2, r3
	ldr	r3, .L93
	and	r3, r2
	ldr	r2, [r7, #4]
	ldrh	r1, [r2]
	ldr	r2, .L93
	and	r2, r1
	uxth	r2, r2
	sub	r2, r2, #1
	uxth	r2, r2
	and	r3, r2
	beq	.LCB1412
	b	.L92	@long jump
.LCB1412:
	.loc 1 554 0
	mov	sp, r7
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r7, pc}
.L94:
	.align	2
.L93:
	.word	4092
	.cfi_endproc
.LFE13:
	.size	unMergeUnevenBlcks, .-unMergeUnevenBlcks
	.section	.text.mergeUnevenBlocks,"ax",%progbits
	.align	2
	.code	16
	.thumb_func
	.type	mergeUnevenBlocks, %function
mergeUnevenBlocks:
.LFB14:
	.loc 1 592 0
	.cfi_startproc
	push	{r4, r7, lr}
	.cfi_def_cfa_offset 12
	.cfi_offset 4, -12
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	sub	sp, sp, #20
	.cfi_def_cfa_offset 32
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	str	r0, [r7, #4]
	str	r1, [r7]
	.loc 1 594 0
	ldr	r3, [r7, #4]
	ldrh	r2, [r3]
	.loc 1 593 0
	ldr	r3, .L98
	and	r3, r2
	uxth	r1, r3
	.loc 1 594 0
	ldr	r3, [r7]
	ldrh	r2, [r3]
	.loc 1 593 0
	ldr	r3, .L98
	and	r3, r2
	uxth	r2, r3
	mov	r3, r7
	add	r3, r3, #14
	add	r2, r1, r2
	strh	r2, [r3]
	.loc 1 596 0
	ldr	r3, [r7]
	mov	r0, r3
	bl	getAdjacentNxtBlck
	mov	r3, r0
	cmp	r3, #0
	beq	.L96
	.loc 1 598 0
	ldr	r2, .L98+4
	ldr	r3, [r7]
	ldrh	r3, [r3, #4]
	lsl	r3, r3, #3
	add	r2, r2, r3
	mov	r3, r7
	add	r3, r3, #14
	ldrh	r3, [r3]
	mov	r0, r2
	mov	r1, r3
	bl	setPRVBlckMemSize
	.loc 1 600 0
	ldr	r2, .L98+4
	ldr	r3, [r7]
	ldrh	r3, [r3, #4]
	lsl	r3, r3, #3
	add	r4, r2, r3
	ldr	r3, [r7, #4]
	mov	r0, r3
	bl	getIndex
	mov	r3, r0
	strh	r3, [r4, #6]
.L96:
	.loc 1 602 0
	ldr	r3, [r7]
	ldrh	r2, [r3, #4]
	ldr	r3, [r7, #4]
	strh	r2, [r3, #4]
	.loc 1 603 0
	ldr	r3, [r7]
	ldrh	r3, [r3]
	.loc 1 605 0
	mov	r2, r3
	ldr	r3, .L98
	and	r2, r3
	ldr	r3, [r7, #4]
	ldrh	r3, [r3]
	mov	r1, r3
	ldr	r3, .L98
	and	r3, r1
	.loc 1 603 0
	cmp	r2, r3
	ble	.L97
	.loc 1 606 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #2]
	mov	r2, #128
	lsl	r2, r2, #7
	orr	r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #4]
	strh	r2, [r3, #2]
.L97:
	.loc 1 608 0
	ldr	r2, [r7, #4]
	mov	r3, r7
	add	r3, r3, #14
	ldrh	r3, [r3]
	mov	r0, r2
	mov	r1, r3
	bl	setBlckMemSize
	.loc 1 609 0
	mov	sp, r7
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r7, pc}
.L99:
	.align	2
.L98:
	.word	4092
	.word	__HeapBase
	.cfi_endproc
.LFE14:
	.size	mergeUnevenBlocks, .-mergeUnevenBlocks
	.section	.text.shrinkCacheFIFO,"ax",%progbits
	.align	2
	.code	16
	.thumb_func
	.type	shrinkCacheFIFO, %function
shrinkCacheFIFO:
.LFB15:
	.loc 1 617 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	sub	sp, sp, #8
	.cfi_def_cfa_offset 16
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 618 0
	ldr	r3, .L105
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L100
.LBB5:
	.loc 1 620 0
	ldr	r3, .L105+4
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L102
	.loc 1 622 0
	bl	BREAK
.L102:
	.loc 1 625 0
	ldr	r3, .L105+4
	ldr	r3, [r3]
	ldrh	r2, [r3, #6]
	ldr	r3, .L105+8
	cmp	r2, r3
	bne	.L103
	.loc 1 633 0
	ldr	r3, .L105+12
	mov	r2, #0
	str	r2, [r3]
	.loc 1 634 0
	mov	r3, #0
	str	r3, [r7, #4]
	b	.L104
.L103:
	.loc 1 643 0
	ldr	r2, .L105+16
	ldr	r3, .L105+4
	ldr	r3, [r3]
	ldrh	r3, [r3, #6]
	lsl	r3, r3, #3
	add	r3, r2, r3
	str	r3, [r7, #4]
.L104:
	.loc 1 646 0
	ldr	r3, .L105+4
	ldr	r2, [r3]
	ldr	r3, .L105+4
	ldr	r3, [r3]
	ldrh	r3, [r3, #2]
	lsl	r3, r3, #17
	lsr	r3, r3, #17
	uxth	r3, r3
	strh	r3, [r2, #2]
	.loc 1 648 0
	ldr	r3, .L105+4
	ldr	r3, [r3]
	mov	r0, r3
	bl	rFullyFree
	.loc 1 650 0
	ldr	r3, .L105+4
	ldr	r2, [r7, #4]
	str	r2, [r3]
	.loc 1 651 0
	ldr	r3, .L105
	ldrb	r3, [r3]
	sub	r3, r3, #1
	uxtb	r2, r3
	ldr	r3, .L105
	strb	r2, [r3]
.L100:
.LBE5:
	.loc 1 653 0
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L106:
	.align	2
.L105:
	.word	cacheSize
	.word	objCacheEnd
	.word	65535
	.word	objCache
	.word	__HeapBase
	.cfi_endproc
.LFE15:
	.size	shrinkCacheFIFO, .-shrinkCacheFIFO
	.section	.text.addBlckToCache,"ax",%progbits
	.align	2
	.code	16
	.thumb_func
	.type	addBlckToCache, %function
addBlckToCache:
.LFB16:
	.loc 1 665 0
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
	.loc 1 666 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #2]
	uxth	r3, r3
	sxth	r3, r3
	cmp	r3, #0
	bge	.L108
	.loc 1 669 0
	bl	BREAK
	.loc 1 670 0
	b	.L107
.L108:
	.loc 1 679 0
	ldr	r3, .L112
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L110
	.loc 1 684 0
	ldr	r2, .L112+4
	ldr	r3, [r7, #4]
	strh	r2, [r3, #4]
	.loc 1 685 0
	ldr	r3, .L112+8
	ldr	r2, [r7, #4]
	str	r2, [r3]
	b	.L111
.L110:
	.loc 1 689 0
	ldr	r3, .L112
	ldr	r3, [r3]
	mov	r0, r3
	bl	getIndex
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [r7, #4]
	strh	r2, [r3, #4]
.L111:
	.loc 1 692 0
	ldr	r2, .L112+4
	ldr	r3, [r7, #4]
	strh	r2, [r3, #6]
	.loc 1 693 0
	ldr	r3, .L112
	ldr	r2, [r7, #4]
	str	r2, [r3]
	.loc 1 695 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #2]
	ldr	r2, .L112+12
	orr	r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #4]
	strh	r2, [r3, #2]
	.loc 1 697 0
	ldr	r3, .L112+16
	ldrb	r3, [r3]
	add	r3, r3, #1
	uxtb	r2, r3
	ldr	r3, .L112+16
	strb	r2, [r3]
	ldr	r3, .L112+16
	ldrb	r3, [r3]
	cmp	r3, #16
	bls	.L107
	.loc 1 699 0
	bl	shrinkCacheFIFO
.L107:
	.loc 1 701 0
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L113:
	.align	2
.L112:
	.word	objCache
	.word	65535
	.word	objCacheEnd
	.word	-32768
	.word	cacheSize
	.cfi_endproc
.LFE16:
	.size	addBlckToCache, .-addBlckToCache
	.section	.text.findBestFitInCache,"ax",%progbits
	.align	2
	.code	16
	.thumb_func
	.type	findBestFitInCache, %function
findBestFitInCache:
.LFB17:
	.loc 1 704 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	sub	sp, sp, #8
	.cfi_def_cfa_offset 16
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	mov	r3, r0
	.loc 1 705 0
	ldr	r2, .L126
	ldr	r2, [r2]
	cmp	r2, #0
	bne	.LCB1738
	b	.L115	@long jump
.LCB1738:
.LBB6:
	.loc 1 711 0
	mov	r1, r3
	mov	r2, #7
	and	r2, r1
	beq	.L116
	.loc 1 719 0
	mov	r2, #7
	bic	r3, r2
	uxth	r3, r3
	.loc 1 720 0
	add	r3, r3, #8
	uxth	r3, r3
.L116:
	.loc 1 723 0
	ldr	r2, .L126
	ldr	r2, [r2]
	str	r2, [r7, #4]
	.loc 1 729 0
	b	.L117
.L120:
	.loc 1 732 0
	ldr	r2, [r7, #4]
	ldrh	r1, [r2, #4]
	ldr	r2, .L126+4
	cmp	r1, r2
	bne	.L118
	.loc 1 735 0
	mov	r3, #0
	b	.L119
.L118:
	.loc 1 738 0
	ldr	r1, .L126+8
	ldr	r2, [r7, #4]
	ldrh	r2, [r2, #4]
	lsl	r2, r2, #3
	add	r2, r1, r2
	str	r2, [r7, #4]
.L117:
	.loc 1 729 0 discriminator 1
	ldr	r2, [r7, #4]
	ldrh	r2, [r2]
	.loc 1 730 0 discriminator 1
	mov	r1, r2
	ldr	r2, .L126+12
	and	r1, r2
	mov	r2, r3
	.loc 1 729 0 discriminator 1
	cmp	r1, r2
	bne	.L120
	.loc 1 743 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #2]
	lsl	r3, r3, #17
	lsr	r3, r3, #17
	uxth	r2, r3
	ldr	r3, [r7, #4]
	strh	r2, [r3, #2]
	.loc 1 745 0
	ldr	r3, .L126+16
	ldrb	r3, [r3]
	sub	r3, r3, #1
	uxtb	r2, r3
	ldr	r3, .L126+16
	strb	r2, [r3]
	.loc 1 750 0
	add	r3, r7, #2
	ldr	r2, [r7, #4]
	ldrh	r2, [r2, #6]
	strh	r2, [r3]
	.loc 1 751 0
	mov	r3, r7
	ldr	r2, [r7, #4]
	ldrh	r2, [r2, #4]
	strh	r2, [r3]
	.loc 1 760 0
	ldr	r3, .L126+4
	add	r2, r7, #2
	ldrh	r2, [r2]
	cmp	r2, r3
	beq	.L121
	.loc 1 766 0
	ldr	r2, .L126+8
	add	r3, r7, #2
	ldrh	r3, [r3]
	lsl	r3, r3, #3
	add	r3, r2, r3
	mov	r2, r7
	ldrh	r2, [r2]
	strh	r2, [r3, #4]
	.loc 1 767 0
	ldr	r3, .L126+4
	mov	r2, r7
	ldrh	r2, [r2]
	cmp	r2, r3
	bne	.L122
	.loc 1 773 0
	ldr	r2, .L126+8
	add	r3, r7, #2
	ldrh	r3, [r3]
	lsl	r3, r3, #3
	add	r2, r2, r3
	ldr	r3, .L126+20
	str	r2, [r3]
	b	.L124
.L122:
	.loc 1 781 0
	ldr	r2, .L126+8
	mov	r3, r7
	ldrh	r3, [r3]
	lsl	r3, r3, #3
	add	r3, r2, r3
	add	r2, r7, #2
	ldrh	r2, [r2]
	strh	r2, [r3, #6]
	b	.L124
.L121:
	.loc 1 791 0
	ldr	r3, .L126+4
	mov	r2, r7
	ldrh	r2, [r2]
	cmp	r2, r3
	bne	.L125
	.loc 1 793 0
	ldr	r3, .L126
	mov	r2, #0
	str	r2, [r3]
	.loc 1 794 0
	ldr	r3, .L126+20
	mov	r2, #0
	str	r2, [r3]
	b	.L124
.L125:
	.loc 1 798 0
	ldr	r2, .L126+8
	mov	r3, r7
	ldrh	r3, [r3]
	lsl	r3, r3, #3
	add	r2, r2, r3
	ldr	r3, .L126
	str	r2, [r3]
.L124:
	.loc 1 801 0
	ldr	r3, [r7, #4]
	b	.L119
.L115:
.LBE6:
	.loc 1 803 0
	mov	r3, #0
.L119:
	.loc 1 804 0
	mov	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L127:
	.align	2
.L126:
	.word	objCache
	.word	65535
	.word	__HeapBase
	.word	4092
	.word	cacheSize
	.word	objCacheEnd
	.cfi_endproc
.LFE17:
	.size	findBestFitInCache, .-findBestFitInCache
	.section	.text.findBestFitFree,"ax",%progbits
	.align	2
	.code	16
	.thumb_func
	.type	findBestFitFree, %function
findBestFitFree:
.LFB18:
	.loc 1 809 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	sub	sp, sp, #24
	.cfi_def_cfa_offset 32
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	str	r0, [r7, #4]
	mov	r2, r1
	add	r3, r7, #2
	strh	r2, [r3]
	.loc 1 810 0
	mov	r3, #0
	str	r3, [r7, #12]
	.loc 1 811 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	str	r3, [r7, #20]
	.loc 1 812 0
	mov	r3, r7
	add	r3, r3, #18
	mov	r2, #1
	neg	r2, r2
	strh	r2, [r3]
	.loc 1 814 0
	ldr	r3, [r7, #20]
	cmp	r3, #0
	bne	.L129
	.loc 1 815 0
	mov	r3, #0
	b	.L145
.L129:
	.loc 1 823 0
	add	r3, r7, #2
	ldrh	r2, [r3]
	ldr	r3, [r7, #20]
	ldrh	r3, [r3]
	mov	r1, r3
	ldr	r3, .L146
	and	r3, r1
	cmp	r2, r3
	bgt	.L131
	.loc 1 827 0
	mov	r3, r7
	add	r3, r3, #18
	ldrh	r2, [r3]
	ldr	r3, [r7, #20]
	ldrh	r3, [r3]
	mov	r1, r3
	ldr	r3, .L146
	and	r3, r1
	cmp	r2, r3
	ble	.L131
	.loc 1 830 0
	ldr	r3, [r7, #20]
	ldrh	r1, [r3]
	mov	r3, r7
	add	r3, r3, #18
	ldr	r2, .L146
	and	r2, r1
	strh	r2, [r3]
	.loc 1 832 0
	ldr	r3, [r7, #20]
	str	r3, [r7, #12]
.L131:
	.loc 1 836 0
	ldr	r2, .L146+4
	ldr	r3, [r7, #20]
	ldrh	r3, [r3, #4]
	lsl	r3, r3, #3
	add	r3, r2, r3
	str	r3, [r7, #20]
	.loc 1 838 0
	ldr	r2, [r7, #20]
	ldr	r3, .L146+4
	cmp	r2, r3
	bcc	.L132
	.loc 1 838 0 is_stmt 0 discriminator 1
	ldr	r2, [r7, #20]
	.loc 1 839 0 is_stmt 1 discriminator 1
	ldr	r3, .L146+8
	.loc 1 838 0 discriminator 1
	cmp	r2, r3
	bhi	.L132
	.loc 1 841 0
	ldr	r3, [r7, #20]
	cmp	r3, #0
	bne	.L129
.L132:
	.loc 1 844 0
	ldr	r3, [r7, #12]
	cmp	r3, #0
	bne	.L133
	.loc 1 845 0
	mov	r3, #0
	b	.L145
.L133:
	.loc 1 848 0
	b	.L134
.L136:
	.loc 1 852 0
	mov	r3, r7
	add	r3, r3, #12
	mov	r0, r3
	bl	splitMemBlck
	.loc 1 853 0
	ldr	r3, [r7, #12]
	ldrh	r3, [r3]
	mov	r2, r3
	ldr	r3, .L146
	and	r3, r2
	cmp	r3, #8
	bne	.L134
	.loc 1 854 0
	b	.L135
.L134:
	.loc 1 848 0 discriminator 1
	ldr	r3, [r7, #12]
	ldrh	r3, [r3]
	.loc 1 850 0 discriminator 1
	mov	r2, r3
	ldr	r3, .L146
	and	r3, r2
	asr	r3, r3, #1
	.loc 1 848 0 discriminator 1
	uxth	r3, r3
	add	r2, r7, #2
	ldrh	r2, [r2]
	cmp	r2, r3
	bls	.L136
.L135:
	.loc 1 857 0
	ldr	r3, [r7, #12]
	ldrh	r3, [r3]
	.loc 1 859 0
	mov	r2, r3
	ldr	r3, .L146
	and	r2, r3
	add	r3, r7, #2
	ldrh	r3, [r3]
	.loc 1 857 0
	cmp	r2, r3
	bgt	.LCB2032
	b	.L137	@long jump
.LCB2032:
	.loc 1 861 0
	ldr	r3, [r7, #12]
	ldrh	r2, [r3]
	.loc 1 860 0
	ldr	r3, .L146
	and	r3, r2
	uxth	r2, r3
	add	r3, r7, #2
	ldrh	r3, [r3]
	sub	r3, r2, r3
	uxth	r3, r3
	cmp	r3, #8
	bls	.L137
	.loc 1 864 0
	mov	r3, r7
	add	r3, r3, #12
	mov	r0, r3
	bl	splitMemBlck
	.loc 1 866 0
	b	.L138
.L144:
.LBB7:
	.loc 1 870 0
	ldr	r3, [r7, #12]
	mov	r0, r3
	bl	getAdjacentNxtBlck
	mov	r3, r0
	str	r3, [r7, #8]
	.loc 1 874 0
	ldr	r3, [r7, #12]
	ldrh	r2, [r3]
	.loc 1 873 0
	ldr	r3, .L146
	and	r3, r2
	uxth	r2, r3
	mov	r3, r7
	add	r3, r3, #16
	add	r1, r7, #2
	ldrh	r1, [r1]
	sub	r2, r1, r2
	strh	r2, [r3]
	.loc 1 877 0
	b	.L139
.L142:
	.loc 1 881 0
	ldr	r3, [r7, #8]
	ldrh	r3, [r3]
	mov	r2, r3
	ldr	r3, .L146
	and	r3, r2
	cmp	r3, #8
	bne	.L140
	.loc 1 882 0
	b	.L141
.L140:
	.loc 1 883 0
	mov	r3, r7
	add	r3, r3, #8
	mov	r0, r3
	bl	splitMemBlck
.L139:
	.loc 1 877 0 discriminator 1
	ldr	r3, [r7, #8]
	ldrh	r3, [r3]
	.loc 1 879 0 discriminator 1
	mov	r2, r3
	ldr	r3, .L146
	and	r3, r2
	asr	r3, r3, #1
	.loc 1 877 0 discriminator 1
	uxth	r3, r3
	mov	r2, r7
	add	r2, r2, #16
	ldrh	r2, [r2]
	cmp	r2, r3
	bls	.L142
.L141:
	.loc 1 887 0
	add	r3, r7, #2
	ldrh	r2, [r3]
	ldr	r3, [r7, #12]
	ldrh	r3, [r3]
	.loc 1 889 0
	mov	r1, r3
	ldr	r3, .L146
	and	r1, r3
	ldr	r3, [r7, #8]
	ldrh	r3, [r3]
	.loc 1 891 0
	mov	r0, r3
	ldr	r3, .L146
	and	r3, r0
	asr	r3, r3, #1
	.loc 1 889 0
	add	r3, r1, r3
	.loc 1 887 0
	cmp	r2, r3
	ble	.L143
	.loc 1 892 0
	ldr	r3, [r7, #8]
	ldrh	r3, [r3]
	mov	r2, r3
	ldr	r3, .L146
	and	r3, r2
	asr	r3, r3, #1
	cmp	r3, #8
	ble	.L143
	.loc 1 894 0
	mov	r3, r7
	add	r3, r3, #8
	mov	r0, r3
	bl	splitMemBlck
	.loc 1 895 0
	ldr	r2, [r7, #12]
	ldr	r3, [r7, #8]
	mov	r0, r2
	mov	r1, r3
	bl	mergeUnevenBlocks
	b	.L138
.L143:
	.loc 1 899 0
	ldr	r2, [r7, #12]
	ldr	r3, [r7, #8]
	mov	r0, r2
	mov	r1, r3
	bl	mergeUnevenBlocks
	b	.L137
.L138:
.LBE7:
	.loc 1 866 0 discriminator 1
	ldr	r3, [r7, #12]
	ldrh	r3, [r3]
	.loc 1 868 0 discriminator 1
	mov	r2, r3
	ldr	r3, .L146
	and	r2, r3
	add	r3, r7, #2
	ldrh	r3, [r3]
	.loc 1 866 0 discriminator 1
	cmp	r2, r3
	blt	.L144
.L137:
	.loc 1 904 0
	ldr	r3, [r7, #12]
.L145:
	.loc 1 905 0
	mov	r0, r3
	mov	sp, r7
	add	sp, sp, #24
	@ sp needed
	pop	{r7, pc}
.L147:
	.align	2
.L146:
	.word	4092
	.word	__HeapBase
	.word	__HeapLimit
	.cfi_endproc
.LFE18:
	.size	findBestFitFree, .-findBestFitFree
	.section	.text.cpyMemBlock,"ax",%progbits
	.align	2
	.code	16
	.thumb_func
	.type	cpyMemBlock, %function
cpyMemBlock:
.LFB19:
	.loc 1 909 0
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
	str	r1, [r7]
	.loc 1 910 0
	ldr	r3, [r7]
	ldrh	r1, [r3]
	mov	r3, r7
	add	r3, r3, #12
	ldr	r2, .L154
	and	r2, r1
	strh	r2, [r3]
	.loc 1 911 0
	mov	r3, r7
	add	r3, r3, #14
	mov	r2, #4
	strh	r2, [r3]
	.loc 1 913 0
	ldr	r3, [r7, #4]
	cmp	r3, #0
	beq	.L149
	.loc 1 913 0 is_stmt 0 discriminator 1
	ldr	r3, [r7]
	cmp	r3, #0
	bne	.L150
.L149:
	.loc 1 914 0 is_stmt 1
	b	.L148
.L150:
	.loc 1 916 0
	b	.L152
.L153:
	.loc 1 918 0
	mov	r3, r7
	add	r3, r3, #14
	ldrh	r2, [r3]
	ldr	r3, [r7, #4]
	add	r3, r2, r3
	mov	r2, r3
	.loc 1 919 0
	mov	r3, r7
	add	r3, r3, #14
	ldrh	r1, [r3]
	ldr	r3, [r7]
	add	r3, r1, r3
	.loc 1 918 0
	mov	r1, r2
	mov	r2, r3
	mov	r3, #8
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	bl	memcpy
	.loc 1 920 0
	mov	r3, r7
	add	r3, r3, #14
	ldrh	r2, [r3]
	mov	r3, r7
	add	r3, r3, #14
	add	r2, r2, #1
	strh	r2, [r3]
.L152:
	.loc 1 916 0 discriminator 1
	mov	r2, r7
	add	r2, r2, #14
	mov	r3, r7
	add	r3, r3, #12
	ldrh	r2, [r2]
	ldrh	r3, [r3]
	cmp	r2, r3
	bls	.L153
.L148:
	.loc 1 922 0
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.L155:
	.align	2
.L154:
	.word	4092
	.cfi_endproc
.LFE19:
	.size	cpyMemBlock, .-cpyMemBlock
	.section	.text.rMalloc,"ax",%progbits
	.align	2
	.global	rMalloc
	.code	16
	.thumb_func
	.type	rMalloc, %function
rMalloc:
.LFB20:
	.loc 1 925 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	sub	sp, sp, #16
	.cfi_def_cfa_offset 24
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	mov	r2, r0
	add	r3, r7, #6
	strh	r2, [r3]
	.loc 1 927 0
	mov	r3, r7
	add	r3, r3, #10
	add	r2, r7, #6
	ldrh	r2, [r2]
	add	r2, r2, #4
	strh	r2, [r3]
	.loc 1 929 0
	mov	r2, r7
	add	r2, r2, #10
	mov	r3, r7
	add	r3, r3, #10
	ldrh	r3, [r3]
	uxth	r1, r3
	cmp	r1, #8
	bcs	.L157
	mov	r3, #8
.L157:
	strh	r3, [r2]
	.loc 1 930 0
	mov	r3, r7
	add	r3, r3, #10
	ldrh	r3, [r3]
	mov	r0, r3
	bl	findBestFitInCache
	mov	r3, r0
	str	r3, [r7, #12]
	.loc 1 931 0
	ldr	r3, [r7, #12]
	cmp	r3, #0
	bne	.L158
	.loc 1 933 0
	ldr	r2, .L164
	mov	r3, r7
	add	r3, r3, #10
	ldrh	r3, [r3]
	mov	r0, r2
	mov	r1, r3
	bl	findBestFitFree
	mov	r3, r0
	str	r3, [r7, #12]
	.loc 1 934 0
	b	.L159
.L161:
	.loc 1 937 0
	bl	shrinkCacheFIFO
	.loc 1 938 0
	ldr	r2, .L164
	mov	r3, r7
	add	r3, r3, #10
	ldrh	r3, [r3]
	mov	r0, r2
	mov	r1, r3
	bl	findBestFitFree
	mov	r3, r0
	str	r3, [r7, #12]
.L159:
	.loc 1 934 0 discriminator 1
	ldr	r3, [r7, #12]
	cmp	r3, #0
	bne	.L160
	.loc 1 934 0 is_stmt 0 discriminator 2
	ldr	r3, .L164+4
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L161
.L160:
	.loc 1 941 0 is_stmt 1
	ldr	r3, [r7, #12]
	cmp	r3, #0
	bne	.L162
	.loc 1 942 0
	bl	BREAK
.L162:
	.loc 1 944 0
	ldr	r3, [r7, #12]
	mov	r0, r3
	bl	delMemBlck
.L158:
	.loc 1 947 0
	ldr	r3, [r7, #12]
	ldrh	r3, [r3]
	mov	r2, #1
	orr	r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #12]
	strh	r2, [r3]
	.loc 1 949 0
	ldr	r3, [r7, #12]
	add	r3, r3, #4
	.loc 1 950 0
	mov	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.L165:
	.align	2
.L164:
	.word	freeMemLst
	.word	objCache
	.cfi_endproc
.LFE20:
	.size	rMalloc, .-rMalloc
	.section	.text.rCalloc,"ax",%progbits
	.align	2
	.global	rCalloc
	.code	16
	.thumb_func
	.type	rCalloc, %function
rCalloc:
.LFB21:
	.loc 1 953 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	sub	sp, sp, #24
	.cfi_def_cfa_offset 32
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	mov	r2, r0
	add	r3, r7, #6
	strh	r2, [r3]
	.loc 1 954 0
	add	r3, r7, #6
	ldrh	r3, [r3]
	mov	r0, r3
	bl	rMalloc
	mov	r3, r0
	str	r3, [r7, #16]
	.loc 1 956 0
	mov	r3, r7
	add	r3, r3, #22
	add	r2, r7, #6
	ldrh	r2, [r2]
	strh	r2, [r3]
	.loc 1 957 0
	b	.L167
.L168:
	.loc 1 959 0
	mov	r3, r7
	add	r3, r3, #22
	ldrh	r2, [r3]
	ldr	r3, [r7, #16]
	add	r3, r2, r3
	str	r3, [r7, #12]
	.loc 1 960 0
	ldr	r3, [r7, #12]
	mov	r2, #0
	str	r2, [r3]
.L167:
	.loc 1 957 0 discriminator 1
	mov	r3, r7
	add	r3, r3, #22
	mov	r2, r7
	add	r2, r2, #22
	ldrh	r2, [r2]
	sub	r2, r2, #1
	strh	r2, [r3]
	mov	r3, r7
	add	r3, r3, #22
	ldrh	r3, [r3]
	cmp	r3, #0
	bne	.L168
	.loc 1 962 0
	ldr	r3, [r7, #16]
	.loc 1 963 0
	mov	r0, r3
	mov	sp, r7
	add	sp, sp, #24
	@ sp needed
	pop	{r7, pc}
	.cfi_endproc
.LFE21:
	.size	rCalloc, .-rCalloc
	.section	.text.rRealloc,"ax",%progbits
	.align	2
	.global	rRealloc
	.code	16
	.thumb_func
	.type	rRealloc, %function
rRealloc:
.LFB22:
	.loc 1 966 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	sub	sp, sp, #24
	.cfi_def_cfa_offset 32
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	str	r0, [r7, #4]
	mov	r2, r1
	add	r3, r7, #2
	strh	r2, [r3]
	.loc 1 967 0
	ldr	r3, [r7, #4]
	cmp	r3, #0
	bne	.L171
	.loc 1 969 0
	add	r3, r7, #2
	ldrh	r3, [r3]
	mov	r0, r3
	bl	rMalloc
	mov	r3, r0
	b	.L172
.L171:
.LBB8:
	.loc 1 974 0
	mov	r3, r7
	add	r3, r3, #18
	add	r2, r7, #2
	ldrh	r2, [r2]
	add	r2, r2, #4
	strh	r2, [r3]
	.loc 1 976 0
	mov	r2, r7
	add	r2, r2, #18
	mov	r3, r7
	add	r3, r3, #18
	ldrh	r3, [r3]
	uxth	r1, r3
	cmp	r1, #8
	bcs	.L173
	mov	r3, #8
.L173:
	strh	r3, [r2]
	.loc 1 979 0
	ldr	r3, [r7, #4]
	sub	r3, r3, #4
	str	r3, [r7, #20]
	.loc 1 981 0
	b	.L174
.L177:
	.loc 1 983 0
	ldr	r3, [r7, #20]
	mov	r0, r3
	bl	getAdjacentNxtBlck
	mov	r3, r0
	str	r3, [r7, #12]
	.loc 1 985 0
	ldr	r3, [r7, #12]
	ldrh	r3, [r3]
	uxth	r3, r3
	add	r2, r3, #0
	mov	r3, #1
	and	r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #12]
	ldrh	r3, [r3, #2]
	lsr	r3, r3, #15
	uxth	r3, r3
	uxth	r3, r3
	orr	r3, r2
	uxth	r3, r3
	cmp	r3, #0
	beq	.L175
	.loc 1 986 0
	b	.L176
.L175:
	.loc 1 988 0
	ldr	r3, [r7, #12]
	mov	r0, r3
	bl	delMemBlck
	.loc 1 992 0
	ldr	r3, [r7, #20]
	ldrh	r2, [r3]
	.loc 1 990 0
	ldr	r3, .L179
	and	r3, r2
	uxth	r2, r3
	.loc 1 993 0
	ldr	r3, [r7, #12]
	ldrh	r1, [r3]
	.loc 1 990 0
	ldr	r3, .L179
	and	r3, r1
	uxth	r3, r3
	add	r3, r2, r3
	uxth	r3, r3
	ldr	r2, [r7, #20]
	mov	r0, r2
	mov	r1, r3
	bl	setBlckMemSize
	.loc 1 995 0
	ldr	r3, [r7, #20]
	ldrh	r2, [r3]
	.loc 1 994 0
	ldr	r3, .L179
	and	r3, r2
	uxth	r3, r3
	ldr	r2, [r7, #12]
	mov	r0, r2
	mov	r1, r3
	bl	setPRVBlckMemSize
.L174:
	.loc 1 981 0 discriminator 1
	ldr	r3, [r7, #20]
	ldrh	r3, [r3]
	mov	r2, r3
	ldr	r3, .L179
	and	r2, r3
	mov	r3, r7
	add	r3, r3, #18
	ldrh	r3, [r3]
	cmp	r2, r3
	blt	.L177
.L176:
	.loc 1 997 0
	ldr	r3, [r7, #20]
	ldrh	r3, [r3]
	mov	r2, r3
	ldr	r3, .L179
	and	r2, r3
	mov	r3, r7
	add	r3, r3, #18
	ldrh	r3, [r3]
	cmp	r2, r3
	bge	.L178
.LBB9:
	.loc 1 999 0
	add	r3, r7, #2
	ldrh	r3, [r3]
	mov	r0, r3
	bl	rMalloc
	mov	r3, r0
	str	r3, [r7, #8]
	.loc 1 1000 0
	ldr	r2, [r7, #8]
	ldr	r3, [r7, #20]
	mov	r0, r2
	mov	r1, r3
	bl	cpyMemBlock
	.loc 1 1001 0
	ldr	r3, [r7, #20]
	mov	r0, r3
	bl	rFullyFree
	.loc 1 1002 0
	ldr	r3, [r7, #8]
	str	r3, [r7, #20]
.L178:
.LBE9:
	.loc 1 1005 0
	ldr	r3, [r7, #20]
	add	r3, r3, #4
.L172:
.LBE8:
	.loc 1 1007 0
	mov	r0, r3
	mov	sp, r7
	add	sp, sp, #24
	@ sp needed
	pop	{r7, pc}
.L180:
	.align	2
.L179:
	.word	4092
	.cfi_endproc
.LFE22:
	.size	rRealloc, .-rRealloc
	.section	.text.rFree,"ax",%progbits
	.align	2
	.global	rFree
	.code	16
	.thumb_func
	.type	rFree, %function
rFree:
.LFB23:
	.loc 1 1011 0
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
	.loc 1 1012 0
	ldr	r3, [r7, #4]
	cmp	r3, #0
	bne	.L182
	.loc 1 1013 0
	bl	BREAK
.L182:
	.loc 1 1015 0
	ldr	r3, [r7, #4]
	sub	r3, r3, #4
	str	r3, [r7, #12]
	.loc 1 1018 0
	ldr	r3, [r7, #12]
	ldrh	r3, [r3]
	mov	r2, r3
	mov	r3, #1
	and	r3, r2
	bne	.L183
	.loc 1 1019 0
	bl	BREAK
.L183:
	.loc 1 1021 0
	ldr	r3, [r7, #12]
	ldrh	r3, [r3]
	mov	r2, #1
	bic	r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #12]
	strh	r2, [r3]
	.loc 1 1022 0
	ldr	r3, [r7, #12]
	mov	r0, r3
	bl	addBlckToCache
	.loc 1 1023 0
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
	.cfi_endproc
.LFE23:
	.size	rFree, .-rFree
	.section	.text.rFullyFree,"ax",%progbits
	.align	2
	.global	rFullyFree
	.code	16
	.thumb_func
	.type	rFullyFree, %function
rFullyFree:
.LFB24:
	.loc 1 1027 0
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
	.loc 1 1028 0
	ldr	r3, [r7, #4]
	ldr	r2, [r7, #4]
	ldrh	r2, [r2]
	mov	r1, #1
	bic	r2, r1
	uxth	r2, r2
	strh	r2, [r3]
	.loc 1 1030 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3]
	mov	r2, r3
	ldr	r3, .L187
	and	r3, r2
	ldr	r2, [r7, #4]
	ldrh	r1, [r2]
	ldr	r2, .L187
	and	r2, r1
	uxth	r2, r2
	sub	r2, r2, #1
	uxth	r2, r2
	and	r3, r2
	beq	.L185
	.loc 1 1032 0
	ldr	r3, [r7, #4]
	mov	r0, r3
	bl	unMergeUnevenBlcks
.L185:
	.loc 1 1035 0
	ldr	r3, [r7, #4]
	mov	r0, r3
	bl	fitBlckBackIntoFreeLst
	.loc 1 1037 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3]
	lsr	r3, r3, #12
	uxth	r3, r3
	mov	r2, r3
	mov	r3, #1
	and	r3, r2
	beq	.L184
	.loc 1 1039 0
	add	r3, r7, #4
	mov	r0, r3
	bl	reMergeMemBlck
.L184:
	.loc 1 1041 0
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L188:
	.align	2
.L187:
	.word	4092
	.cfi_endproc
.LFE24:
	.size	rFullyFree, .-rFullyFree
	.section	.text.memMngr_CreateMemPool,"ax",%progbits
	.align	2
	.global	memMngr_CreateMemPool
	.code	16
	.thumb_func
	.type	memMngr_CreateMemPool, %function
memMngr_CreateMemPool:
.LFB25:
	.loc 1 1047 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	sub	sp, sp, #24
	.cfi_def_cfa_offset 32
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	str	r2, [r7]
	add	r3, r7, #6
	add	r2, r0, #0
	strh	r2, [r3]
	add	r3, r7, #5
	add	r2, r1, #0
	strb	r2, [r3]
	.loc 1 1050 0
	mov	r3, r7
	add	r3, r3, #19
	add	r2, r7, #5
	ldrb	r2, [r2]
	strb	r2, [r3]
	.loc 1 1052 0
	ldr	r3, .L196
	ldr	r3, [r3]
	add	r3, r3, #1
	bne	.L190
	.loc 1 1053 0
	mov	r3, #0
	b	.L191
.L190:
	.loc 1 1057 0
	ldr	r3, .L196
	ldr	r3, [r3]
	mvn	r2, r3
	ldr	r3, .L196
	ldr	r3, [r3]
	add	r3, r3, #1
	.loc 1 1056 0
	and	r3, r2
	mov	r0, r3
	bl	bitM_bitPos
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [r7]
	strb	r2, [r3]
	.loc 1 1061 0
	add	r3, r7, #6
	ldrh	r3, [r3]
	mov	r0, r3
	bl	rMalloc
	mov	r3, r0
	str	r3, [r7, #20]
	.loc 1 1062 0
	ldr	r3, [r7, #20]
	cmp	r3, #0
	bne	.L192
	.loc 1 1063 0
	mov	r3, #0
	b	.L191
.L192:
	.loc 1 1065 0
	ldr	r3, [r7, #20]
	sub	r3, r3, #4
	str	r3, [r7, #20]
	.loc 1 1067 0
	ldr	r3, [r7]
	ldrb	r3, [r3]
	mov	r2, r3
	ldr	r3, .L196+4
	lsl	r2, r2, #2
	ldr	r1, [r7, #20]
	str	r1, [r2, r3]
	.loc 1 1068 0
	ldr	r2, .L196+8
	ldr	r3, [r7, #20]
	strh	r2, [r3, #6]
	.loc 1 1069 0
	mov	r3, r7
	add	r3, r3, #19
	ldrb	r2, [r3]
	mov	r3, r7
	add	r3, r3, #19
	sub	r2, r2, #1
	strb	r2, [r3]
	.loc 1 1070 0
	b	.L193
.L195:
	.loc 1 1072 0
	add	r3, r7, #6
	ldrh	r3, [r3]
	mov	r0, r3
	bl	rMalloc
	mov	r3, r0
	str	r3, [r7, #12]
	.loc 1 1073 0
	ldr	r3, [r7, #12]
	cmp	r3, #0
	beq	.L194
	.loc 1 1075 0
	ldr	r3, [r7, #12]
	sub	r3, r3, #4
	str	r3, [r7, #12]
	.loc 1 1076 0
	ldr	r3, [r7, #20]
	mov	r0, r3
	bl	getIndex
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [r7, #12]
	strh	r2, [r3, #6]
	.loc 1 1077 0
	ldr	r3, [r7, #12]
	mov	r0, r3
	bl	getIndex
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [r7, #20]
	strh	r2, [r3, #4]
	.loc 1 1078 0
	ldr	r3, [r7, #12]
	str	r3, [r7, #20]
	b	.L193
.L194:
	.loc 1 1083 0
	bl	BREAK
	.loc 1 1084 0
	mov	r3, #0
	b	.L191
.L193:
	.loc 1 1070 0 discriminator 1
	mov	r3, r7
	add	r3, r3, #19
	ldrb	r3, [r3]
	mov	r2, r7
	add	r2, r2, #19
	sub	r1, r3, #1
	strb	r1, [r2]
	cmp	r3, #0
	bne	.L195
	.loc 1 1088 0
	ldr	r2, .L196+8
	ldr	r3, [r7, #20]
	strh	r2, [r3, #4]
	.loc 1 1089 0
	ldr	r3, [r7]
	ldrb	r3, [r3]
	mov	r2, #1
	lsl	r2, r2, r3
	ldr	r3, .L196
	ldr	r3, [r3]
	orr	r2, r3
	ldr	r3, .L196
	str	r2, [r3]
	.loc 1 1090 0
	mov	r3, #1
.L191:
	.loc 1 1091 0
	mov	r0, r3
	mov	sp, r7
	add	sp, sp, #24
	@ sp needed
	pop	{r7, pc}
.L197:
	.align	2
.L196:
	.word	memPoolsInUse
	.word	memPools
	.word	65535
	.cfi_endproc
.LFE25:
	.size	memMngr_CreateMemPool, .-memMngr_CreateMemPool
	.section	.text.memMngr_DeleteMemPool,"ax",%progbits
	.align	2
	.global	memMngr_DeleteMemPool
	.code	16
	.thumb_func
	.type	memMngr_DeleteMemPool, %function
memMngr_DeleteMemPool:
.LFB26:
	.loc 1 1094 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	sub	sp, sp, #8
	.cfi_def_cfa_offset 16
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	mov	r2, r0
	add	r3, r7, #7
	strb	r2, [r3]
	.loc 1 1096 0
	mov	r3, #0
	.loc 1 1097 0
	mov	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
	.cfi_endproc
.LFE26:
	.size	memMngr_DeleteMemPool, .-memMngr_DeleteMemPool
	.section	.text.memMngr_MemPoolMalloc,"ax",%progbits
	.align	2
	.global	memMngr_MemPoolMalloc
	.code	16
	.thumb_func
	.type	memMngr_MemPoolMalloc, %function
memMngr_MemPoolMalloc:
.LFB27:
	.loc 1 1100 0
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
	.loc 1 1101 0
	add	r3, r7, #3
	ldrb	r2, [r3]
	ldr	r3, .L205
	lsl	r2, r2, #2
	ldr	r3, [r2, r3]
	str	r3, [r7, #12]
	.loc 1 1102 0
	ldr	r3, [r7, #12]
	cmp	r3, #0
	beq	.L201
	.loc 1 1104 0
	ldr	r3, [r7, #12]
	ldrh	r2, [r3, #4]
	ldr	r3, .L205+4
	cmp	r2, r3
	beq	.L202
	.loc 1 1106 0
	add	r3, r7, #3
	ldrb	r2, [r3]
	ldr	r1, .L205+8
	ldr	r3, [r7, #12]
	ldrh	r3, [r3, #4]
	lsl	r3, r3, #3
	add	r1, r1, r3
	ldr	r3, .L205
	lsl	r2, r2, #2
	str	r1, [r2, r3]
	.loc 1 1107 0
	add	r3, r7, #3
	ldrb	r2, [r3]
	ldr	r3, .L205
	lsl	r2, r2, #2
	ldr	r3, [r2, r3]
	ldr	r2, .L205+4
	strh	r2, [r3, #6]
	b	.L203
.L202:
	.loc 1 1111 0
	add	r3, r7, #3
	ldrb	r2, [r3]
	ldr	r3, .L205
	lsl	r2, r2, #2
	mov	r1, #0
	str	r1, [r2, r3]
.L203:
	.loc 1 1113 0
	ldr	r3, [r7, #12]
	add	r3, r3, #4
	mov	r2, r3
	ldr	r3, [r7, #4]
	str	r2, [r3]
	.loc 1 1114 0
	mov	r3, #1
	b	.L204
.L201:
	.loc 1 1116 0
	bl	BREAK
	.loc 1 1117 0
	mov	r3, #0
.L204:
	.loc 1 1118 0
	mov	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.L206:
	.align	2
.L205:
	.word	memPools
	.word	65535
	.word	__HeapBase
	.cfi_endproc
.LFE27:
	.size	memMngr_MemPoolMalloc, .-memMngr_MemPoolMalloc
	.section	.text.memMngr_MemPoolFree,"ax",%progbits
	.align	2
	.global	memMngr_MemPoolFree
	.code	16
	.thumb_func
	.type	memMngr_MemPoolFree, %function
memMngr_MemPoolFree:
.LFB28:
	.loc 1 1121 0
	.cfi_startproc
	push	{r4, r7, lr}
	.cfi_def_cfa_offset 12
	.cfi_offset 4, -12
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	sub	sp, sp, #20
	.cfi_def_cfa_offset 32
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	str	r0, [r7, #4]
	mov	r2, r1
	add	r3, r7, #3
	strb	r2, [r3]
	.loc 1 1122 0
	ldr	r3, [r7, #4]
	cmp	r3, #0
	bne	.L208
	.loc 1 1123 0
	mov	r3, #0
	b	.L209
.L208:
	.loc 1 1125 0
	ldr	r3, [r7, #4]
	sub	r3, r3, #4
	str	r3, [r7, #12]
	.loc 1 1126 0
	add	r3, r7, #3
	ldrb	r2, [r3]
	ldr	r3, .L212
	lsl	r2, r2, #2
	ldr	r3, [r2, r3]
	cmp	r3, #0
	beq	.L210
	.loc 1 1128 0
	add	r3, r7, #3
	ldrb	r2, [r3]
	ldr	r3, .L212
	lsl	r2, r2, #2
	ldr	r4, [r2, r3]
	ldr	r3, [r7, #12]
	mov	r0, r3
	bl	getIndex
	mov	r3, r0
	strh	r3, [r4, #6]
	.loc 1 1129 0
	add	r3, r7, #3
	ldrb	r2, [r3]
	ldr	r3, .L212
	lsl	r2, r2, #2
	ldr	r3, [r2, r3]
	mov	r0, r3
	bl	getIndex
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [r7, #12]
	strh	r2, [r3, #4]
	.loc 1 1130 0
	ldr	r2, .L212+4
	ldr	r3, [r7, #12]
	strh	r2, [r3, #6]
	.loc 1 1131 0
	add	r3, r7, #3
	ldrb	r2, [r3]
	ldr	r3, .L212
	lsl	r2, r2, #2
	ldr	r1, [r7, #12]
	str	r1, [r2, r3]
	b	.L211
.L210:
	.loc 1 1135 0
	add	r3, r7, #3
	ldrb	r2, [r3]
	ldr	r3, .L212
	lsl	r2, r2, #2
	ldr	r1, [r7, #12]
	str	r1, [r2, r3]
	.loc 1 1136 0
	ldr	r2, .L212+4
	ldr	r3, [r7, #12]
	strh	r2, [r3, #4]
	.loc 1 1137 0
	ldr	r2, .L212+4
	ldr	r3, [r7, #12]
	strh	r2, [r3, #6]
.L211:
	.loc 1 1139 0
	mov	r3, #1
.L209:
	.loc 1 1140 0
	mov	r0, r3
	mov	sp, r7
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r7, pc}
.L213:
	.align	2
.L212:
	.word	memPools
	.word	65535
	.cfi_endproc
.LFE28:
	.size	memMngr_MemPoolFree, .-memMngr_MemPoolFree
	.text
.Letext0:
	.file 2 "c:\\freescale\\kds_3.0.0\\toolchain\\arm-none-eabi\\include\\machine\\_default_types.h"
	.file 3 "c:\\freescale\\kds_3.0.0\\toolchain\\arm-none-eabi\\include\\stdint.h"
	.file 4 "../include/R_RTOS_inc.h"
	.file 5 "../include/R_RTOS_memMngr.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0xa54
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF771
	.byte	0x1
	.4byte	.LASF772
	.4byte	.LASF773
	.4byte	.Ldebug_ranges0+0x18
	.4byte	0
	.4byte	.Ldebug_line0
	.4byte	.Ldebug_macro0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.4byte	.LASF648
	.uleb128 0x3
	.4byte	.LASF651
	.byte	0x2
	.byte	0x1c
	.4byte	0x3b
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF649
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.4byte	.LASF650
	.uleb128 0x3
	.4byte	.LASF652
	.byte	0x2
	.byte	0x26
	.4byte	0x54
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF653
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.4byte	.LASF654
	.uleb128 0x3
	.4byte	.LASF655
	.byte	0x2
	.byte	0x38
	.4byte	0x6d
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF656
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF657
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF658
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF659
	.uleb128 0x3
	.4byte	.LASF660
	.byte	0x3
	.byte	0x2a
	.4byte	0x30
	.uleb128 0x3
	.4byte	.LASF661
	.byte	0x3
	.byte	0x36
	.4byte	0x49
	.uleb128 0x3
	.4byte	.LASF662
	.byte	0x3
	.byte	0x42
	.4byte	0x62
	.uleb128 0x5
	.byte	0x4
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF663
	.uleb128 0x6
	.4byte	.LASF664
	.byte	0x4
	.2byte	0x20d
	.4byte	0x90
	.uleb128 0x6
	.4byte	.LASF665
	.byte	0x4
	.2byte	0x212
	.4byte	0x90
	.uleb128 0x6
	.4byte	.LASF666
	.byte	0x4
	.2byte	0x59f
	.4byte	0x90
	.uleb128 0x6
	.4byte	.LASF667
	.byte	0x4
	.2byte	0x5e1
	.4byte	0x9b
	.uleb128 0x3
	.4byte	.LASF668
	.byte	0x5
	.byte	0x26
	.4byte	0x9b
	.uleb128 0x3
	.4byte	.LASF669
	.byte	0x5
	.byte	0x5e
	.4byte	0x90
	.uleb128 0x3
	.4byte	.LASF670
	.byte	0x5
	.byte	0x63
	.4byte	0x9b
	.uleb128 0x3
	.4byte	.LASF671
	.byte	0x5
	.byte	0x6a
	.4byte	0xb1
	.uleb128 0x3
	.4byte	.LASF672
	.byte	0x5
	.byte	0x6f
	.4byte	0x9b
	.uleb128 0x7
	.4byte	.LASF774
	.byte	0x8
	.byte	0x5
	.byte	0xa8
	.4byte	0x15e
	.uleb128 0x8
	.4byte	.LASF673
	.byte	0x5
	.byte	0xbf
	.4byte	0x100
	.byte	0
	.uleb128 0x8
	.4byte	.LASF674
	.byte	0x5
	.byte	0xd5
	.4byte	0x100
	.byte	0x2
	.uleb128 0x8
	.4byte	.LASF675
	.byte	0x5
	.byte	0xd6
	.4byte	0x116
	.byte	0x4
	.uleb128 0x8
	.4byte	.LASF676
	.byte	0x5
	.byte	0xd7
	.4byte	0x116
	.byte	0x6
	.byte	0
	.uleb128 0x3
	.4byte	.LASF677
	.byte	0x5
	.byte	0xda
	.4byte	0x121
	.uleb128 0x9
	.4byte	.LASF775
	.byte	0x1
	.byte	0x4c
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xa
	.4byte	.LASF680
	.byte	0x1
	.byte	0x59
	.4byte	0xde
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1b0
	.uleb128 0xb
	.4byte	.LASF678
	.byte	0x1
	.byte	0x5a
	.4byte	0x1b0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0xb
	.4byte	.LASF679
	.byte	0x1
	.byte	0x5b
	.4byte	0xde
	.uleb128 0x2
	.byte	0x91
	.sleb128 -14
	.byte	0
	.uleb128 0xc
	.4byte	0x1b5
	.uleb128 0xd
	.byte	0x4
	.4byte	0x15e
	.uleb128 0xa
	.4byte	.LASF681
	.byte	0x1
	.byte	0x75
	.4byte	0xde
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1f1
	.uleb128 0xb
	.4byte	.LASF682
	.byte	0x1
	.byte	0x76
	.4byte	0x1b0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0xb
	.4byte	.LASF679
	.byte	0x1
	.byte	0x77
	.4byte	0xde
	.uleb128 0x2
	.byte	0x91
	.sleb128 -14
	.byte	0
	.uleb128 0xe
	.4byte	.LASF737
	.byte	0x1
	.byte	0x82
	.4byte	0xd2
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x235
	.uleb128 0xf
	.4byte	.LASF683
	.byte	0x1
	.byte	0x84
	.4byte	0x1b5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0xf
	.4byte	.LASF684
	.byte	0x1
	.byte	0x89
	.4byte	0x116
	.uleb128 0x2
	.byte	0x91
	.sleb128 -14
	.uleb128 0xf
	.4byte	.LASF685
	.byte	0x1
	.byte	0x8a
	.4byte	0x116
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x10
	.4byte	.LASF694
	.byte	0x1
	.byte	0xc4
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x259
	.uleb128 0xb
	.4byte	.LASF686
	.byte	0x1
	.byte	0xc4
	.4byte	0x1b0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0xa
	.4byte	.LASF687
	.byte	0x1
	.byte	0xdf
	.4byte	0x1b5
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x28f
	.uleb128 0xb
	.4byte	.LASF685
	.byte	0x1
	.byte	0xdf
	.4byte	0x1b0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0xf
	.4byte	.LASF688
	.byte	0x1
	.byte	0xe1
	.4byte	0x1b0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0xa
	.4byte	.LASF689
	.byte	0x1
	.byte	0xf0
	.4byte	0x1b5
	.4byte	.LFB6
	.4byte	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x2c5
	.uleb128 0xb
	.4byte	.LASF685
	.byte	0x1
	.byte	0xf0
	.4byte	0x1b0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0xf
	.4byte	.LASF690
	.byte	0x1
	.byte	0xf2
	.4byte	0x1b0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x11
	.4byte	.LASF691
	.byte	0x1
	.2byte	0x103
	.4byte	0x1b5
	.4byte	.LFB7
	.4byte	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x2ef
	.uleb128 0x12
	.4byte	.LASF685
	.byte	0x1
	.2byte	0x103
	.4byte	0x1b0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x13
	.4byte	.LASF692
	.byte	0x1
	.2byte	0x10c
	.4byte	0x116
	.4byte	.LFB8
	.4byte	.LFE8-.LFB8
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x319
	.uleb128 0x12
	.4byte	.LASF693
	.byte	0x1
	.2byte	0x10c
	.4byte	0x1b0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x14
	.4byte	.LASF695
	.byte	0x1
	.2byte	0x120
	.4byte	.LFB9
	.4byte	.LFE9-.LFB9
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x36c
	.uleb128 0x12
	.4byte	.LASF685
	.byte	0x1
	.2byte	0x120
	.4byte	0x1b0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x15
	.4byte	.LASF696
	.byte	0x1
	.2byte	0x124
	.4byte	0x116
	.uleb128 0x2
	.byte	0x91
	.sleb128 -22
	.uleb128 0x15
	.4byte	.LASF697
	.byte	0x1
	.2byte	0x125
	.4byte	0x116
	.uleb128 0x2
	.byte	0x91
	.sleb128 -18
	.uleb128 0x15
	.4byte	.LASF698
	.byte	0x1
	.2byte	0x126
	.4byte	0x116
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x13
	.4byte	.LASF699
	.byte	0x1
	.2byte	0x15a
	.4byte	0x90
	.4byte	.LFB10
	.4byte	.LFE10-.LFB10
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x3e6
	.uleb128 0x12
	.4byte	.LASF700
	.byte	0x1
	.2byte	0x15a
	.4byte	0x3e6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x15
	.4byte	.LASF701
	.byte	0x1
	.2byte	0x15c
	.4byte	0xea
	.uleb128 0x2
	.byte	0x91
	.sleb128 -18
	.uleb128 0x15
	.4byte	.LASF702
	.byte	0x1
	.2byte	0x15d
	.4byte	0x1b5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x16
	.4byte	.Ldebug_ranges0+0
	.4byte	0x3cc
	.uleb128 0x15
	.4byte	.LASF703
	.byte	0x1
	.2byte	0x162
	.4byte	0x1b5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x17
	.4byte	.LBB4
	.4byte	.LBE4-.LBB4
	.uleb128 0x15
	.4byte	.LASF704
	.byte	0x1
	.2byte	0x185
	.4byte	0x1b5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.byte	0
	.uleb128 0xd
	.byte	0x4
	.4byte	0x1b5
	.uleb128 0x14
	.4byte	.LASF705
	.byte	0x1
	.2byte	0x1c2
	.4byte	.LFB11
	.4byte	.LFE11-.LFB11
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x412
	.uleb128 0x12
	.4byte	.LASF700
	.byte	0x1
	.2byte	0x1c2
	.4byte	0x3e6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x14
	.4byte	.LASF706
	.byte	0x1
	.2byte	0x1d2
	.4byte	.LFB12
	.4byte	.LFE12-.LFB12
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x465
	.uleb128 0x12
	.4byte	.LASF707
	.byte	0x1
	.2byte	0x1d2
	.4byte	0x465
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x15
	.4byte	.LASF701
	.byte	0x1
	.2byte	0x1d4
	.4byte	0x46a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -18
	.uleb128 0x15
	.4byte	.LASF708
	.byte	0x1
	.2byte	0x1d7
	.4byte	0x1b0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x15
	.4byte	.LASF702
	.byte	0x1
	.2byte	0x1da
	.4byte	0x1b5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.uleb128 0xc
	.4byte	0x3e6
	.uleb128 0xc
	.4byte	0x100
	.uleb128 0x14
	.4byte	.LASF709
	.byte	0x1
	.2byte	0x1fb
	.4byte	.LFB13
	.4byte	.LFE13-.LFB13
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x4d1
	.uleb128 0x12
	.4byte	.LASF710
	.byte	0x1
	.2byte	0x1fb
	.4byte	0x1b0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x15
	.4byte	.LASF711
	.byte	0x1
	.2byte	0x1fd
	.4byte	0x1b5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x15
	.4byte	.LASF712
	.byte	0x1
	.2byte	0x1fe
	.4byte	0xde
	.uleb128 0x2
	.byte	0x91
	.sleb128 -18
	.uleb128 0x15
	.4byte	.LASF713
	.byte	0x1
	.2byte	0x1ff
	.4byte	0xde
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x15
	.4byte	.LASF702
	.byte	0x1
	.2byte	0x200
	.4byte	0x1b5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x14
	.4byte	.LASF714
	.byte	0x1
	.2byte	0x24d
	.4byte	.LFB14
	.4byte	.LFE14-.LFB14
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x515
	.uleb128 0x12
	.4byte	.LASF715
	.byte	0x1
	.2byte	0x24e
	.4byte	0x1b0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x12
	.4byte	.LASF716
	.byte	0x1
	.2byte	0x24f
	.4byte	0x1b0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x15
	.4byte	.LASF679
	.byte	0x1
	.2byte	0x251
	.4byte	0x515
	.uleb128 0x2
	.byte	0x91
	.sleb128 -18
	.byte	0
	.uleb128 0xc
	.4byte	0xde
	.uleb128 0x14
	.4byte	.LASF717
	.byte	0x1
	.2byte	0x268
	.4byte	.LFB15
	.4byte	.LFE15-.LFB15
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x54a
	.uleb128 0x17
	.4byte	.LBB5
	.4byte	.LBE5-.LBB5
	.uleb128 0x15
	.4byte	.LASF718
	.byte	0x1
	.2byte	0x270
	.4byte	0x1b5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.byte	0
	.uleb128 0x14
	.4byte	.LASF719
	.byte	0x1
	.2byte	0x298
	.4byte	.LFB16
	.4byte	.LFE16-.LFB16
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x570
	.uleb128 0x12
	.4byte	.LASF720
	.byte	0x1
	.2byte	0x298
	.4byte	0x1b0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x11
	.4byte	.LASF721
	.byte	0x1
	.2byte	0x2bf
	.4byte	0x1b5
	.4byte	.LFB17
	.4byte	.LFE17-.LFB17
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x5d0
	.uleb128 0x12
	.4byte	.LASF722
	.byte	0x1
	.2byte	0x2bf
	.4byte	0xde
	.uleb128 0x1
	.byte	0x53
	.uleb128 0x17
	.4byte	.LBB6
	.4byte	.LBE6-.LBB6
	.uleb128 0x15
	.4byte	.LASF723
	.byte	0x1
	.2byte	0x2d3
	.4byte	0x1b5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x15
	.4byte	.LASF724
	.byte	0x1
	.2byte	0x2ee
	.4byte	0x5d0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -14
	.uleb128 0x15
	.4byte	.LASF725
	.byte	0x1
	.2byte	0x2ef
	.4byte	0x5d0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.byte	0
	.uleb128 0xc
	.4byte	0x116
	.uleb128 0x13
	.4byte	.LASF726
	.byte	0x1
	.2byte	0x326
	.4byte	0x1b5
	.4byte	.LFB18
	.4byte	.LFE18-.LFB18
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x663
	.uleb128 0x12
	.4byte	.LASF727
	.byte	0x1
	.2byte	0x327
	.4byte	0x3e6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x12
	.4byte	.LASF728
	.byte	0x1
	.2byte	0x328
	.4byte	0x515
	.uleb128 0x2
	.byte	0x91
	.sleb128 -30
	.uleb128 0x15
	.4byte	.LASF729
	.byte	0x1
	.2byte	0x32a
	.4byte	0x1b5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x15
	.4byte	.LASF683
	.byte	0x1
	.2byte	0x32b
	.4byte	0x1b5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x15
	.4byte	.LASF730
	.byte	0x1
	.2byte	0x32c
	.4byte	0xde
	.uleb128 0x2
	.byte	0x91
	.sleb128 -14
	.uleb128 0x17
	.4byte	.LBB7
	.4byte	.LBE7-.LBB7
	.uleb128 0x15
	.4byte	.LASF731
	.byte	0x1
	.2byte	0x366
	.4byte	0x1b5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x15
	.4byte	.LASF732
	.byte	0x1
	.2byte	0x369
	.4byte	0xde
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.byte	0
	.uleb128 0x14
	.4byte	.LASF733
	.byte	0x1
	.2byte	0x38c
	.4byte	.LFB19
	.4byte	.LFE19-.LFB19
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x6b6
	.uleb128 0x12
	.4byte	.LASF734
	.byte	0x1
	.2byte	0x38c
	.4byte	0x1b0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x18
	.ascii	"src\000"
	.byte	0x1
	.2byte	0x38c
	.4byte	0x1b0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x15
	.4byte	.LASF735
	.byte	0x1
	.2byte	0x38e
	.4byte	0x515
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x15
	.4byte	.LASF736
	.byte	0x1
	.2byte	0x38f
	.4byte	0xde
	.uleb128 0x2
	.byte	0x91
	.sleb128 -10
	.byte	0
	.uleb128 0x19
	.4byte	.LASF738
	.byte	0x1
	.2byte	0x39c
	.4byte	0xb1
	.4byte	.LFB20
	.4byte	.LFE20-.LFB20
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x6fe
	.uleb128 0x12
	.4byte	.LASF739
	.byte	0x1
	.2byte	0x39c
	.4byte	0x515
	.uleb128 0x2
	.byte	0x91
	.sleb128 -18
	.uleb128 0x15
	.4byte	.LASF728
	.byte	0x1
	.2byte	0x39f
	.4byte	0xde
	.uleb128 0x2
	.byte	0x91
	.sleb128 -14
	.uleb128 0x1a
	.ascii	"tmp\000"
	.byte	0x1
	.2byte	0x3a2
	.4byte	0x1b5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x19
	.4byte	.LASF740
	.byte	0x1
	.2byte	0x3b8
	.4byte	0xb1
	.4byte	.LFB21
	.4byte	.LFE21-.LFB21
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x755
	.uleb128 0x12
	.4byte	.LASF739
	.byte	0x1
	.2byte	0x3b8
	.4byte	0x515
	.uleb128 0x2
	.byte	0x91
	.sleb128 -26
	.uleb128 0x1a
	.ascii	"tmp\000"
	.byte	0x1
	.2byte	0x3ba
	.4byte	0x755
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x15
	.4byte	.LASF741
	.byte	0x1
	.2byte	0x3bb
	.4byte	0x755
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1a
	.ascii	"cnt\000"
	.byte	0x1
	.2byte	0x3bc
	.4byte	0xde
	.uleb128 0x2
	.byte	0x91
	.sleb128 -10
	.byte	0
	.uleb128 0xd
	.byte	0x4
	.4byte	0x10b
	.uleb128 0x19
	.4byte	.LASF742
	.byte	0x1
	.2byte	0x3c5
	.4byte	0xb1
	.4byte	.LFB22
	.4byte	.LFE22-.LFB22
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x7e4
	.uleb128 0x12
	.4byte	.LASF743
	.byte	0x1
	.2byte	0x3c5
	.4byte	0x7e4
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x12
	.4byte	.LASF739
	.byte	0x1
	.2byte	0x3c5
	.4byte	0x515
	.uleb128 0x2
	.byte	0x91
	.sleb128 -30
	.uleb128 0x17
	.4byte	.LBB8
	.4byte	.LBE8-.LBB8
	.uleb128 0x15
	.4byte	.LASF728
	.byte	0x1
	.2byte	0x3ce
	.4byte	0xde
	.uleb128 0x2
	.byte	0x91
	.sleb128 -14
	.uleb128 0x1a
	.ascii	"tmp\000"
	.byte	0x1
	.2byte	0x3d3
	.4byte	0x1b5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x15
	.4byte	.LASF744
	.byte	0x1
	.2byte	0x3d4
	.4byte	0x1b5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x17
	.4byte	.LBB9
	.4byte	.LBE9-.LBB9
	.uleb128 0x15
	.4byte	.LASF741
	.byte	0x1
	.2byte	0x3e7
	.4byte	0x1b5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xc
	.4byte	0xb1
	.uleb128 0x1b
	.4byte	.LASF746
	.byte	0x1
	.2byte	0x3f2
	.4byte	.LFB23
	.4byte	.LFE23-.LFB23
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x81e
	.uleb128 0x12
	.4byte	.LASF745
	.byte	0x1
	.2byte	0x3f2
	.4byte	0x7e4
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1a
	.ascii	"tmp\000"
	.byte	0x1
	.2byte	0x3f7
	.4byte	0x1b0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x1b
	.4byte	.LASF747
	.byte	0x1
	.2byte	0x402
	.4byte	.LFB24
	.4byte	.LFE24-.LFB24
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x844
	.uleb128 0x12
	.4byte	.LASF748
	.byte	0x1
	.2byte	0x402
	.4byte	0x1b5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x19
	.4byte	.LASF749
	.byte	0x1
	.2byte	0x413
	.4byte	0xd2
	.4byte	.LFB25
	.4byte	.LFE25-.LFB25
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x8b9
	.uleb128 0x12
	.4byte	.LASF750
	.byte	0x1
	.2byte	0x414
	.4byte	0x515
	.uleb128 0x2
	.byte	0x91
	.sleb128 -26
	.uleb128 0x12
	.4byte	.LASF751
	.byte	0x1
	.2byte	0x415
	.4byte	0x8b9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -27
	.uleb128 0x12
	.4byte	.LASF752
	.byte	0x1
	.2byte	0x416
	.4byte	0x8be
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x15
	.4byte	.LASF753
	.byte	0x1
	.2byte	0x418
	.4byte	0x1b5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x15
	.4byte	.LASF754
	.byte	0x1
	.2byte	0x419
	.4byte	0x1b5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x15
	.4byte	.LASF755
	.byte	0x1
	.2byte	0x41a
	.4byte	0x90
	.uleb128 0x2
	.byte	0x91
	.sleb128 -13
	.byte	0
	.uleb128 0xc
	.4byte	0x90
	.uleb128 0xc
	.4byte	0x8c3
	.uleb128 0xd
	.byte	0x4
	.4byte	0xf5
	.uleb128 0x1c
	.4byte	.LASF756
	.byte	0x1
	.2byte	0x445
	.4byte	0xd2
	.4byte	.LFB26
	.4byte	.LFE26-.LFB26
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x8f3
	.uleb128 0x12
	.4byte	.LASF752
	.byte	0x1
	.2byte	0x445
	.4byte	0x8f3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.byte	0
	.uleb128 0xc
	.4byte	0xf5
	.uleb128 0x19
	.4byte	.LASF757
	.byte	0x1
	.2byte	0x44b
	.4byte	0xd2
	.4byte	.LFB27
	.4byte	.LFE27-.LFB27
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x940
	.uleb128 0x12
	.4byte	.LASF758
	.byte	0x1
	.2byte	0x44b
	.4byte	0x940
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x12
	.4byte	.LASF752
	.byte	0x1
	.2byte	0x44b
	.4byte	0x8f3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -21
	.uleb128 0x15
	.4byte	.LASF693
	.byte	0x1
	.2byte	0x44d
	.4byte	0x1b5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0xd
	.byte	0x4
	.4byte	0xb1
	.uleb128 0x19
	.4byte	.LASF759
	.byte	0x1
	.2byte	0x460
	.4byte	0xd2
	.4byte	.LFB28
	.4byte	.LFE28-.LFB28
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x98e
	.uleb128 0x12
	.4byte	.LASF758
	.byte	0x1
	.2byte	0x460
	.4byte	0xb1
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x12
	.4byte	.LASF752
	.byte	0x1
	.2byte	0x460
	.4byte	0x8f3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -29
	.uleb128 0x15
	.4byte	.LASF693
	.byte	0x1
	.2byte	0x465
	.4byte	0x1b5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0xf
	.4byte	.LASF760
	.byte	0x1
	.byte	0xf
	.4byte	0x1b0
	.uleb128 0x5
	.byte	0x3
	.4byte	memoryHEAPBASE
	.uleb128 0xf
	.4byte	.LASF761
	.byte	0x1
	.byte	0x13
	.4byte	0x5d0
	.uleb128 0x5
	.byte	0x3
	.4byte	failMemIndex
	.uleb128 0xf
	.4byte	.LASF762
	.byte	0x1
	.byte	0x1c
	.4byte	0x1b5
	.uleb128 0x5
	.byte	0x3
	.4byte	freeMemLst
	.uleb128 0xf
	.4byte	.LASF763
	.byte	0x1
	.byte	0x26
	.4byte	0x1b5
	.uleb128 0x5
	.byte	0x3
	.4byte	objCache
	.uleb128 0xf
	.4byte	.LASF764
	.byte	0x1
	.byte	0x2f
	.4byte	0x1b5
	.uleb128 0x5
	.byte	0x3
	.4byte	objCacheEnd
	.uleb128 0xf
	.4byte	.LASF765
	.byte	0x1
	.byte	0x3e
	.4byte	0x90
	.uleb128 0x5
	.byte	0x3
	.4byte	buddyOffset
	.uleb128 0xf
	.4byte	.LASF766
	.byte	0x1
	.byte	0x47
	.4byte	0x90
	.uleb128 0x5
	.byte	0x3
	.4byte	cacheSize
	.uleb128 0xf
	.4byte	.LASF767
	.byte	0x1
	.byte	0x49
	.4byte	0xa16
	.uleb128 0x5
	.byte	0x3
	.4byte	memPoolsInUse
	.uleb128 0x1d
	.4byte	0xa6
	.uleb128 0x1e
	.4byte	0x1b5
	.4byte	0xa2b
	.uleb128 0x1f
	.4byte	0xb3
	.byte	0x6
	.byte	0
	.uleb128 0xf
	.4byte	.LASF768
	.byte	0x1
	.byte	0x4a
	.4byte	0xa1b
	.uleb128 0x5
	.byte	0x3
	.4byte	memPools
	.uleb128 0x20
	.4byte	.LASF769
	.byte	0x1
	.byte	0xc
	.4byte	0xa47
	.uleb128 0xc
	.4byte	0x15e
	.uleb128 0x20
	.4byte	.LASF770
	.byte	0x1
	.byte	0xd
	.4byte	0xa47
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
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x6
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
	.uleb128 0x7
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
	.uleb128 0x8
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
	.uleb128 0x9
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xa
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
	.uleb128 0xb
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
	.uleb128 0xc
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
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
	.uleb128 0xf
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
	.uleb128 0x10
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
	.uleb128 0x11
	.uleb128 0x2e
	.byte	0x1
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
	.uleb128 0x12
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
	.uleb128 0x13
	.uleb128 0x2e
	.byte	0x1
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
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0x19
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
	.uleb128 0x15
	.uleb128 0x34
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
	.uleb128 0x16
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
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
	.uleb128 0x19
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
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
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
	.uleb128 0x1b
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
	.uleb128 0x1c
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
	.uleb128 0x1d
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x20
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
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0xfc
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
	.4byte	.LFB11
	.4byte	.LFE11-.LFB11
	.4byte	.LFB12
	.4byte	.LFE12-.LFB12
	.4byte	.LFB13
	.4byte	.LFE13-.LFB13
	.4byte	.LFB14
	.4byte	.LFE14-.LFB14
	.4byte	.LFB15
	.4byte	.LFE15-.LFB15
	.4byte	.LFB16
	.4byte	.LFE16-.LFB16
	.4byte	.LFB17
	.4byte	.LFE17-.LFB17
	.4byte	.LFB18
	.4byte	.LFE18-.LFB18
	.4byte	.LFB19
	.4byte	.LFE19-.LFB19
	.4byte	.LFB20
	.4byte	.LFE20-.LFB20
	.4byte	.LFB21
	.4byte	.LFE21-.LFB21
	.4byte	.LFB22
	.4byte	.LFE22-.LFB22
	.4byte	.LFB23
	.4byte	.LFE23-.LFB23
	.4byte	.LFB24
	.4byte	.LFE24-.LFB24
	.4byte	.LFB25
	.4byte	.LFE25-.LFB25
	.4byte	.LFB26
	.4byte	.LFE26-.LFB26
	.4byte	.LFB27
	.4byte	.LFE27-.LFB27
	.4byte	.LFB28
	.4byte	.LFE28-.LFB28
	.4byte	0
	.4byte	0
	.section	.debug_ranges,"",%progbits
.Ldebug_ranges0:
	.4byte	.LBB2
	.4byte	.LBE2
	.4byte	.LBB3
	.4byte	.LBE3
	.4byte	0
	.4byte	0
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
	.4byte	.LFB11
	.4byte	.LFE11
	.4byte	.LFB12
	.4byte	.LFE12
	.4byte	.LFB13
	.4byte	.LFE13
	.4byte	.LFB14
	.4byte	.LFE14
	.4byte	.LFB15
	.4byte	.LFE15
	.4byte	.LFB16
	.4byte	.LFE16
	.4byte	.LFB17
	.4byte	.LFE17
	.4byte	.LFB18
	.4byte	.LFE18
	.4byte	.LFB19
	.4byte	.LFE19
	.4byte	.LFB20
	.4byte	.LFE20
	.4byte	.LFB21
	.4byte	.LFE21
	.4byte	.LFB22
	.4byte	.LFE22
	.4byte	.LFB23
	.4byte	.LFE23
	.4byte	.LFB24
	.4byte	.LFE24
	.4byte	.LFB25
	.4byte	.LFE25
	.4byte	.LFB26
	.4byte	.LFE26
	.4byte	.LFB27
	.4byte	.LFE27
	.4byte	.LFB28
	.4byte	.LFE28
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
	.uleb128 0x9
	.uleb128 0x5
	.byte	0x5
	.uleb128 0xe
	.4byte	.LASF341
	.byte	0x3
	.uleb128 0xf
	.uleb128 0x4
	.byte	0x5
	.uleb128 0xa
	.4byte	.LASF342
	.file 6 "c:\\freescale\\kds_3.0.0\\toolchain\\lib\\gcc\\arm-none-eabi\\4.8.4\\include\\stdint.h"
	.byte	0x3
	.uleb128 0x12
	.uleb128 0x6
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
	.file 7 "c:\\freescale\\kds_3.0.0\\toolchain\\arm-none-eabi\\include\\sys\\features.h"
	.byte	0x3
	.uleb128 0x8
	.uleb128 0x7
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
	.byte	0x7
	.4byte	.Ldebug_macro5
	.byte	0x4
	.file 8 "../include/R_RTOS_BitMagic.h"
	.byte	0x3
	.uleb128 0xa
	.uleb128 0x8
	.byte	0x7
	.4byte	.Ldebug_macro6
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
	.section	.debug_macro,"G",%progbits,wm4.R_RTOS_inc.h.33.36e72bb3967740da7c636d11072010d8,comdat
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
	.uleb128 0x36
	.4byte	.LASF438
	.byte	0x5
	.uleb128 0x3b
	.4byte	.LASF439
	.byte	0x5
	.uleb128 0x42
	.4byte	.LASF440
	.byte	0x5
	.uleb128 0x46
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
	.uleb128 0x5d
	.4byte	.LASF445
	.byte	0x5
	.uleb128 0x62
	.4byte	.LASF446
	.byte	0x5
	.uleb128 0x66
	.4byte	.LASF447
	.byte	0x5
	.uleb128 0x6b
	.4byte	.LASF448
	.byte	0x5
	.uleb128 0x6f
	.4byte	.LASF449
	.byte	0x5
	.uleb128 0x77
	.4byte	.LASF450
	.byte	0x5
	.uleb128 0x7f
	.4byte	.LASF451
	.byte	0x5
	.uleb128 0x86
	.4byte	.LASF452
	.byte	0x5
	.uleb128 0x90
	.4byte	.LASF453
	.byte	0x5
	.uleb128 0x94
	.4byte	.LASF454
	.byte	0x5
	.uleb128 0xa2
	.4byte	.LASF455
	.byte	0x5
	.uleb128 0xa9
	.4byte	.LASF456
	.byte	0x5
	.uleb128 0xb1
	.4byte	.LASF457
	.byte	0x5
	.uleb128 0xba
	.4byte	.LASF458
	.byte	0x5
	.uleb128 0xc0
	.4byte	.LASF459
	.byte	0x5
	.uleb128 0xd5
	.4byte	.LASF460
	.byte	0x5
	.uleb128 0xdd
	.4byte	.LASF461
	.byte	0x5
	.uleb128 0xe2
	.4byte	.LASF462
	.byte	0x5
	.uleb128 0xe7
	.4byte	.LASF463
	.byte	0x5
	.uleb128 0xeb
	.4byte	.LASF464
	.byte	0x5
	.uleb128 0xf8
	.4byte	.LASF465
	.byte	0x5
	.uleb128 0x103
	.4byte	.LASF466
	.byte	0x5
	.uleb128 0x108
	.4byte	.LASF467
	.byte	0x5
	.uleb128 0x10d
	.4byte	.LASF468
	.byte	0x5
	.uleb128 0x112
	.4byte	.LASF469
	.byte	0x5
	.uleb128 0x116
	.4byte	.LASF470
	.byte	0x5
	.uleb128 0x11a
	.4byte	.LASF471
	.byte	0x5
	.uleb128 0x120
	.4byte	.LASF472
	.byte	0x5
	.uleb128 0x125
	.4byte	.LASF473
	.byte	0x5
	.uleb128 0x129
	.4byte	.LASF474
	.byte	0x5
	.uleb128 0x12d
	.4byte	.LASF475
	.byte	0x5
	.uleb128 0x131
	.4byte	.LASF476
	.byte	0x5
	.uleb128 0x135
	.4byte	.LASF477
	.byte	0x5
	.uleb128 0x139
	.4byte	.LASF478
	.byte	0x5
	.uleb128 0x13d
	.4byte	.LASF479
	.byte	0x5
	.uleb128 0x144
	.4byte	.LASF480
	.byte	0x5
	.uleb128 0x148
	.4byte	.LASF481
	.byte	0x5
	.uleb128 0x14c
	.4byte	.LASF482
	.byte	0x5
	.uleb128 0x150
	.4byte	.LASF483
	.byte	0x5
	.uleb128 0x469
	.4byte	.LASF484
	.byte	0x5
	.uleb128 0x587
	.4byte	.LASF485
	.byte	0x5
	.uleb128 0x595
	.4byte	.LASF486
	.byte	0x5
	.uleb128 0x59a
	.4byte	.LASF487
	.byte	0x5
	.uleb128 0x5a3
	.4byte	.LASF488
	.byte	0x5
	.uleb128 0x5a7
	.4byte	.LASF489
	.byte	0x5
	.uleb128 0x5ab
	.4byte	.LASF490
	.byte	0x5
	.uleb128 0x5af
	.4byte	.LASF491
	.byte	0x5
	.uleb128 0x5b3
	.4byte	.LASF492
	.byte	0x5
	.uleb128 0x5b7
	.4byte	.LASF493
	.byte	0x5
	.uleb128 0x5bb
	.4byte	.LASF494
	.byte	0x5
	.uleb128 0x5bf
	.4byte	.LASF495
	.byte	0x5
	.uleb128 0x5c3
	.4byte	.LASF496
	.byte	0x5
	.uleb128 0x5c7
	.4byte	.LASF497
	.byte	0x5
	.uleb128 0x5cb
	.4byte	.LASF498
	.byte	0x5
	.uleb128 0x5cf
	.4byte	.LASF499
	.byte	0x5
	.uleb128 0x5d3
	.4byte	.LASF500
	.byte	0x5
	.uleb128 0x5d7
	.4byte	.LASF501
	.byte	0x5
	.uleb128 0x5db
	.4byte	.LASF502
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.R_RTOS_memMngr.h.20.3fa02398393232138c63718be3aa1b6e,comdat
.Ldebug_macro5:
	.2byte	0x4
	.byte	0
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
	.section	.debug_macro,"G",%progbits,wm4.R_RTOS_BitMagic.h.10.5eef9f1775bd73a198e75c05d1ef6bb9,comdat
.Ldebug_macro6:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0xa
	.4byte	.LASF636
	.byte	0x5
	.uleb128 0x11
	.4byte	.LASF637
	.byte	0x5
	.uleb128 0x14
	.4byte	.LASF638
	.byte	0x5
	.uleb128 0x17
	.4byte	.LASF639
	.byte	0x5
	.uleb128 0x1a
	.4byte	.LASF640
	.byte	0x5
	.uleb128 0x1d
	.4byte	.LASF641
	.byte	0x5
	.uleb128 0x20
	.4byte	.LASF642
	.byte	0x5
	.uleb128 0x23
	.4byte	.LASF643
	.byte	0x5
	.uleb128 0x26
	.4byte	.LASF644
	.byte	0x5
	.uleb128 0x29
	.4byte	.LASF645
	.byte	0x5
	.uleb128 0x2c
	.4byte	.LASF646
	.byte	0x5
	.uleb128 0x2f
	.4byte	.LASF647
	.byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF655:
	.ascii	"__uint32_t\000"
.LASF447:
	.ascii	"MSGQ_SYS_ID_POS (uint8_t)0x1u\000"
.LASF154:
	.ascii	"__DECIMAL_DIG__ 17\000"
.LASF291:
	.ascii	"__UHA_FBIT__ 8\000"
.LASF109:
	.ascii	"__INT_FAST32_MAX__ 2147483647\000"
.LASF308:
	.ascii	"__GCC_ATOMIC_WCHAR_T_LOCK_FREE 1\000"
.LASF290:
	.ascii	"__TA_IBIT__ 64\000"
.LASF582:
	.ascii	"MEM_FLGS_ISBLCKLAST_SHFT ((MemFlags)0x1u)\000"
.LASF492:
	.ascii	"RET_TSK_TOO_MANY ((RetCode)0x2Fu)\000"
.LASF70:
	.ascii	"__LONG_LONG_MAX__ 9223372036854775807LL\000"
.LASF78:
	.ascii	"__INTMAX_C(c) c ## LL\000"
.LASF633:
	.ascii	"MEM_FLG_SET_CACHED(pMemMngrHead) MEM_FLG_SET_BIT_MS"
	.ascii	"K(pMemMngrHead, MEM_FLGS_CACHED_MSK, additionalFlag"
	.ascii	"s)\000"
.LASF255:
	.ascii	"__LLACCUM_MIN__ (-0X1P31LLK-0X1P31LLK)\000"
.LASF275:
	.ascii	"__UHQ_FBIT__ 16\000"
.LASF247:
	.ascii	"__LACCUM_EPSILON__ 0x1P-31LK\000"
.LASF395:
	.ascii	"INT64_MAX __INT64_MAX__\000"
.LASF575:
	.ascii	"MEM_FLG_GET_MEMSIZE(memFlgs) (MemSize)(memFlgs & ME"
	.ascii	"M_FLGS_SIZE_MSK)\000"
.LASF379:
	.ascii	"INT_LEAST8_MIN (-__INT_LEAST8_MAX__ - 1)\000"
.LASF584:
	.ascii	"MEM_FLGS_PRV_SPLT_4_SHFT MEM_FLGS_SPLT_4_SHFT\000"
.LASF630:
	.ascii	"MEM_FLG_SET_BGGRMRGD(pMemMngrHead) MEM_FLG_SET_BIT_"
	.ascii	"MSK(pMemMngrHead, MEM_FLGS_BGGRMRGD_MSK, additional"
	.ascii	"Flags)\000"
.LASF272:
	.ascii	"__TQ_IBIT__ 0\000"
.LASF485:
	.ascii	"NR_OF_MEMPOOLS (uint8_t)0x7u\000"
.LASF620:
	.ascii	"MEM_FLG_CLR_NXT_SPLT(pMemMngrHead) MEM_FLG_CLR_BIT_"
	.ascii	"MSK(pMemMngrHead, MEM_FLGS_NXT_SPLT_MSK, additional"
	.ascii	"Flags)\000"
.LASF423:
	.ascii	"WINT_MIN __WINT_MIN__\000"
.LASF513:
	.ascii	"CACHE_SIZE ((uint8_t)0x10u)\000"
.LASF12:
	.ascii	"__ATOMIC_CONSUME 1\000"
.LASF248:
	.ascii	"__ULACCUM_FBIT__ 32\000"
.LASF648:
	.ascii	"signed char\000"
.LASF572:
	.ascii	"MEM_FLG_SET_MERGED(pMemMngrHead) MEM_FLG_SET_BIT_MS"
	.ascii	"K(pMemMngrHead, MEM_FLGS_MERGED_MSK, flagsForMemBlo"
	.ascii	"ck)\000"
.LASF16:
	.ascii	"__SIZEOF_LONG_LONG__ 8\000"
.LASF139:
	.ascii	"__DBL_MAX_10_EXP__ 308\000"
.LASF602:
	.ascii	"MEM_FLGS_PRV_MERGE2048_SHFT MEM_FLGS_MERGE2048_SHFT"
	.ascii	"\000"
.LASF563:
	.ascii	"MEM_FLG_SET_NXTTAKEN(pMemMngrHead) MEM_FLG_SET_BIT_"
	.ascii	"MSK(pMemMngrHead, MEM_FLGS_NXTTAKEN_MSK, flagsForMe"
	.ascii	"mBlock)\000"
.LASF261:
	.ascii	"__ULLACCUM_MAX__ 0XFFFFFFFFFFFFFFFFP-32ULLK\000"
.LASF589:
	.ascii	"MEM_FLGS_PRV_SPLT_16_MSK MEM_FLGS_SPLT_16_MSK\000"
.LASF231:
	.ascii	"__USACCUM_MAX__ 0XFFFFP-8UHK\000"
.LASF183:
	.ascii	"__SFRACT_FBIT__ 7\000"
.LASF333:
	.ascii	"__ARM_NEON_FP 4\000"
.LASF268:
	.ascii	"__SQ_IBIT__ 0\000"
.LASF26:
	.ascii	"__ORDER_PDP_ENDIAN__ 3412\000"
.LASF209:
	.ascii	"__ULFRACT_IBIT__ 0\000"
.LASF171:
	.ascii	"__DEC64_MAX_EXP__ 385\000"
.LASF762:
	.ascii	"freeMemLst\000"
.LASF131:
	.ascii	"__FLT_HAS_DENORM__ 1\000"
.LASF39:
	.ascii	"__INT8_TYPE__ signed char\000"
.LASF322:
	.ascii	"__ARM_ARCH_PROFILE 77\000"
.LASF230:
	.ascii	"__USACCUM_MIN__ 0.0UHK\000"
.LASF559:
	.ascii	"MEM_FLG_PREVTAKEN(memFlgs) MEM_FLG_PARSE(memFlgs,ME"
	.ascii	"M_FLGS_PREVTAKEN_SHFT)\000"
.LASF150:
	.ascii	"__LDBL_MIN_EXP__ (-1021)\000"
.LASF148:
	.ascii	"__LDBL_MANT_DIG__ 53\000"
.LASF494:
	.ascii	"RET_TSK_CONFLICTING_IDLE_TSK ((RetCode)0x21u)\000"
.LASF100:
	.ascii	"__UINT8_C(c) c\000"
.LASF40:
	.ascii	"__INT16_TYPE__ short int\000"
.LASF682:
	.ascii	"blckToSetSizeOfPrvBlck\000"
.LASF715:
	.ascii	"basis\000"
.LASF597:
	.ascii	"MEM_FLGS_PRV_BGGSTBLCK_MSK MEM_FLGS_BGGSTBLCK_MSK\000"
.LASF547:
	.ascii	"MEM_FLGS_SPLT_SHFT ((MemFlags)0xCu)\000"
.LASF410:
	.ascii	"INT_FAST64_MAX __INT_FAST64_MAX__\000"
.LASF325:
	.ascii	"__APCS_32__ 1\000"
.LASF714:
	.ascii	"mergeUnevenBlocks\000"
.LASF341:
	.ascii	"HEADERS_R_RTOS_MEMMNGR_H_ \000"
.LASF673:
	.ascii	"flagsForMemBlock\000"
.LASF2:
	.ascii	"__STDC_HOSTED__ 1\000"
.LASF218:
	.ascii	"__ULLFRACT_FBIT__ 64\000"
.LASF353:
	.ascii	"___int_least8_t_defined 1\000"
.LASF536:
	.ascii	"MEM_FLGS_SPLT_64_MSK ((MemFlags)0x40u)\000"
.LASF482:
	.ascii	"TSK_STATE_IS_UNINIT_FAILED(pTsk) (TskState)(TSK_GET"
	.ascii	"STATE(pTsk) == TSK_STATE_UNINIT_FAILED)\000"
.LASF58:
	.ascii	"__INT_FAST64_TYPE__ long long int\000"
.LASF548:
	.ascii	"MEM_FLGS_SPLT_MSK ((MemFlags)0x1000u)\000"
.LASF678:
	.ascii	"blckToSetSizeOf\000"
.LASF348:
	.ascii	"__EXP(x) __ ##x ##__\000"
.LASF90:
	.ascii	"__UINT64_MAX__ 18446744073709551615ULL\000"
.LASF593:
	.ascii	"MEM_FLGS_PRV_SPLT_64_MSK MEM_FLGS_SPLT_64_MSK\000"
.LASF191:
	.ascii	"__USFRACT_MAX__ 0XFFP-8UHR\000"
.LASF687:
	.ascii	"getAdjacentPrevBlck\000"
.LASF390:
	.ascii	"UINT32_MAX __UINT32_MAX__\000"
.LASF537:
	.ascii	"MEM_FLGS_SPLT_128_SHFT ((MemFlags)0x7u)\000"
.LASF618:
	.ascii	"MEM_FLG_NXT_SPLT(memFlgs) MEM_FLG_PARSE(memFlgs,MEM"
	.ascii	"_FLGS_NXT_SPLT_SHFT)\000"
.LASF11:
	.ascii	"__ATOMIC_ACQ_REL 4\000"
.LASF208:
	.ascii	"__ULFRACT_FBIT__ 32\000"
.LASF371:
	.ascii	"__int_fast32_t_defined 1\000"
.LASF1:
	.ascii	"__STDC_VERSION__ 199901L\000"
.LASF398:
	.ascii	"INT_LEAST64_MAX __INT_LEAST64_MAX__\000"
.LASF736:
	.ascii	"cntr\000"
.LASF187:
	.ascii	"__SFRACT_EPSILON__ 0x1P-7HR\000"
.LASF96:
	.ascii	"__INT32_C(c) c ## L\000"
.LASF277:
	.ascii	"__USQ_FBIT__ 32\000"
.LASF25:
	.ascii	"__ORDER_BIG_ENDIAN__ 4321\000"
.LASF267:
	.ascii	"__SQ_FBIT__ 31\000"
.LASF457:
	.ascii	"TSK_PRIO_LEVELS_NR (TskPrioLvl)0xFu\000"
.LASF302:
	.ascii	"__NO_INLINE__ 1\000"
.LASF376:
	.ascii	"INT8_MIN (-__INT8_MAX__ - 1)\000"
.LASF134:
	.ascii	"__DBL_MANT_DIG__ 53\000"
.LASF712:
	.ascii	"origBlckSize\000"
.LASF554:
	.ascii	"MEM_FLGS_NXTTAKEN_MSK ((MemFlags)0x8000u)\000"
.LASF524:
	.ascii	"MEM_FLGS_TAKEN_MSK ((MemFlags)0x1u)\000"
.LASF647:
	.ascii	"BITM_RMB_ISOLT_ON(x) (((uint32_t)x)&(-((uint32_t)x)"
	.ascii	"))\000"
.LASF539:
	.ascii	"MEM_FLGS_BGGSTBLCK_SHFT ((MemFlags)0x8u)\000"
.LASF66:
	.ascii	"__SCHAR_MAX__ 127\000"
.LASF543:
	.ascii	"MEM_FLGS_MERGE1024_SHFT ((MemFlags)0xAu)\000"
.LASF167:
	.ascii	"__DEC32_EPSILON__ 1E-6DF\000"
.LASF435:
	.ascii	"NULL\000"
.LASF244:
	.ascii	"__LACCUM_IBIT__ 32\000"
.LASF651:
	.ascii	"__uint8_t\000"
.LASF84:
	.ascii	"__INT16_MAX__ 32767\000"
.LASF771:
	.ascii	"GNU C 4.8.4 20140725 (release) [ARM/embedded-4_8-br"
	.ascii	"anch revision 213147] -fpreprocessed -mcpu=cortex-m"
	.ascii	"0plus -mthumb -g3 -std=c99 -fmessage-length=0 -fsig"
	.ascii	"ned-char -ffunction-sections -fdata-sections -fstac"
	.ascii	"k-usage\000"
.LASF331:
	.ascii	"__VFP_FP__ 1\000"
.LASF215:
	.ascii	"__LLFRACT_MIN__ (-0.5LLR-0.5LLR)\000"
.LASF77:
	.ascii	"__INTMAX_MAX__ 9223372036854775807LL\000"
.LASF703:
	.ascii	"nxtBlck\000"
.LASF483:
	.ascii	"TSK_STATE_IS_UNINIT_ENDED(pTsk) (TskState)(TSK_GETS"
	.ascii	"TATE(pTsk) == TSK_STATE_UNINIT_ENDED)\000"
.LASF397:
	.ascii	"INT_LEAST64_MIN (-__INT_LEAST64_MAX__ - 1)\000"
.LASF718:
	.ascii	"prvEndNode\000"
.LASF764:
	.ascii	"objCacheEnd\000"
.LASF346:
	.ascii	"__GNUC_PREREQ(maj,min) ((__GNUC__ << 16) + __GNUC_M"
	.ascii	"INOR__ >= ((maj) << 16) + (min))\000"
.LASF200:
	.ascii	"__UFRACT_MIN__ 0.0UR\000"
.LASF161:
	.ascii	"__LDBL_HAS_QUIET_NAN__ 1\000"
.LASF460:
	.ascii	"OFFSETOF(type,field) ((uint8_t) &(((type *) 0)->fie"
	.ascii	"ld))\000"
.LASF420:
	.ascii	"WCHAR_MAX __WCHAR_MAX__\000"
.LASF488:
	.ascii	"RET_NOK ((RetCode)0x0u)\000"
.LASF406:
	.ascii	"INT_FAST32_MIN (-__INT_FAST32_MAX__ - 1)\000"
.LASF321:
	.ascii	"__ARM_SIZEOF_WCHAR_T 32\000"
.LASF565:
	.ascii	"MEM_FLG_ISSPLIT(memFlgs) MEM_FLG_PARSE(memFlgs,MEM_"
	.ascii	"FLGS_SPLT_SHFT)\000"
.LASF737:
	.ascii	"initMEM\000"
.LASF51:
	.ascii	"__UINT_LEAST8_TYPE__ unsigned char\000"
.LASF233:
	.ascii	"__ACCUM_FBIT__ 15\000"
.LASF592:
	.ascii	"MEM_FLGS_PRV_SPLT_64_SHFT MEM_FLGS_SPLT_64_SHFT\000"
.LASF239:
	.ascii	"__UACCUM_IBIT__ 16\000"
.LASF654:
	.ascii	"long int\000"
.LASF114:
	.ascii	"__UINT_FAST64_MAX__ 18446744073709551615ULL\000"
.LASF415:
	.ascii	"SIZE_MAX __SIZE_MAX__\000"
.LASF617:
	.ascii	"MEM_FLG_CLR_BLCKLAST(pMemMngrHead) MEM_FLG_CLR_BIT_"
	.ascii	"MSK(pMemMngrHead, MEM_FLGS_ISBLCKLAST_MSK, addition"
	.ascii	"alFlags)\000"
.LASF142:
	.ascii	"__DBL_MIN__ ((double)2.2250738585072014e-308L)\000"
.LASF354:
	.ascii	"___int_least16_t_defined 1\000"
.LASF71:
	.ascii	"__WCHAR_MAX__ 4294967295U\000"
.LASF177:
	.ascii	"__DEC128_MIN_EXP__ (-6142)\000"
.LASF635:
	.ascii	"MEM_FLG_TAKENORCACHED(pMemMngrHead) (MemFlags)(MEM_"
	.ascii	"FLG_ISTAKEN(pMemMngrHead->flagsForMemBlock) | MEM_F"
	.ascii	"LG_ISCACHED(pMemMngrHead->additionalFlags))\000"
.LASF55:
	.ascii	"__INT_FAST8_TYPE__ int\000"
.LASF295:
	.ascii	"__UDA_FBIT__ 32\000"
.LASF469:
	.ascii	"TSK_STATE_IS_ACTIVE_RUNNING(pTsk) (TskState)(TSK_GE"
	.ascii	"TSTATE(pTsk) == TSK_STATE_ACTIVE_RUNNING )\000"
.LASF80:
	.ascii	"__UINTMAX_C(c) c ## ULL\000"
.LASF29:
	.ascii	"__SIZEOF_POINTER__ 4\000"
.LASF47:
	.ascii	"__INT_LEAST8_TYPE__ signed char\000"
.LASF691:
	.ascii	"getBuddyBlck\000"
.LASF304:
	.ascii	"__GCC_ATOMIC_BOOL_LOCK_FREE 1\000"
.LASF108:
	.ascii	"__INT_FAST16_MAX__ 2147483647\000"
.LASF381:
	.ascii	"UINT_LEAST8_MAX __UINT_LEAST8_MAX__\000"
.LASF289:
	.ascii	"__TA_FBIT__ 63\000"
.LASF334:
	.ascii	"__THUMB_INTERWORK__ 1\000"
.LASF221:
	.ascii	"__ULLFRACT_MAX__ 0XFFFFFFFFFFFFFFFFP-64ULLR\000"
.LASF83:
	.ascii	"__INT8_MAX__ 127\000"
.LASF402:
	.ascii	"UINT_FAST8_MAX __UINT_FAST8_MAX__\000"
.LASF378:
	.ascii	"UINT8_MAX __UINT8_MAX__\000"
.LASF37:
	.ascii	"__CHAR32_TYPE__ long unsigned int\000"
.LASF124:
	.ascii	"__FLT_MAX_EXP__ 128\000"
.LASF15:
	.ascii	"__SIZEOF_LONG__ 4\000"
.LASF19:
	.ascii	"__SIZEOF_DOUBLE__ 8\000"
.LASF646:
	.ascii	"BITM_RMB_EXTRCT_LEAD_ON(x) ((~((uint32_t)x))|(((uin"
	.ascii	"t32_t)x)+(uint32_t)1u))\000"
.LASF767:
	.ascii	"memPoolsInUse\000"
.LASF720:
	.ascii	"blckToAdd\000"
.LASF643:
	.ascii	"BITM_RMB_EXTRCT_TRAIL_OFF(x) (~(((uint32_t)x)|(-((u"
	.ascii	"int32_t)x))))\000"
.LASF496:
	.ascii	"RET_TSK_IS_ABOUT_TO_RUN ((RetCode)0x25u)\000"
.LASF173:
	.ascii	"__DEC64_MAX__ 9.999999999999999E384DD\000"
.LASF297:
	.ascii	"__UTA_FBIT__ 64\000"
.LASF126:
	.ascii	"__FLT_DECIMAL_DIG__ 9\000"
.LASF693:
	.ascii	"memBlck\000"
.LASF46:
	.ascii	"__UINT64_TYPE__ long long unsigned int\000"
.LASF467:
	.ascii	"TSK_STATE_IS_ERROR(pTsk) (TskState)(TSK_GETSTATE(pT"
	.ascii	"sk) == TSK_STATE_ERROR)\000"
.LASF660:
	.ascii	"uint8_t\000"
.LASF413:
	.ascii	"INTMAX_MIN (-INTMAX_MAX - 1)\000"
.LASF638:
	.ascii	"BITM_RMB_TURN_BIT_ON(x) (((uint32_t)x)|(((uint32_t)"
	.ascii	"x)+(uint32_t)1u))\000"
.LASF301:
	.ascii	"__GNUC_STDC_INLINE__ 1\000"
.LASF98:
	.ascii	"__INT64_C(c) c ## LL\000"
.LASF193:
	.ascii	"__FRACT_FBIT__ 15\000"
.LASF257:
	.ascii	"__LLACCUM_EPSILON__ 0x1P-31LLK\000"
.LASF307:
	.ascii	"__GCC_ATOMIC_CHAR32_T_LOCK_FREE 1\000"
.LASF710:
	.ascii	"blckToUnMerge\000"
.LASF5:
	.ascii	"__GNUC_PATCHLEVEL__ 4\000"
.LASF489:
	.ascii	"RET_OK ((RetCode)0x1u)\000"
.LASF144:
	.ascii	"__DBL_DENORM_MIN__ ((double)4.9406564584124654e-324"
	.ascii	"L)\000"
.LASF106:
	.ascii	"__UINT64_C(c) c ## ULL\000"
.LASF375:
	.ascii	"UINTPTR_MAX __UINTPTR_MAX__\000"
.LASF366:
	.ascii	"__int_least32_t_defined 1\000"
.LASF564:
	.ascii	"MEM_FLG_CLR_NXTTAKEN(pMemMngrHead) MEM_FLG_CLR_BIT_"
	.ascii	"MSK(pMemMngrHead, MEM_FLGS_NXTTAKEN_MSK, flagsForMe"
	.ascii	"mBlock)\000"
.LASF645:
	.ascii	"BITM_RMB_TURN_LEAD_OFF(x) (((uint32_t)x)|(-((uint32"
	.ascii	"_t)x)))\000"
.LASF61:
	.ascii	"__UINT_FAST32_TYPE__ unsigned int\000"
.LASF649:
	.ascii	"unsigned char\000"
.LASF18:
	.ascii	"__SIZEOF_FLOAT__ 4\000"
.LASF305:
	.ascii	"__GCC_ATOMIC_CHAR_LOCK_FREE 1\000"
.LASF125:
	.ascii	"__FLT_MAX_10_EXP__ 38\000"
.LASF180:
	.ascii	"__DEC128_MAX__ 9.999999999999999999999999999999999E"
	.ascii	"6144DL\000"
.LASF196:
	.ascii	"__FRACT_MAX__ 0X7FFFP-15R\000"
.LASF591:
	.ascii	"MEM_FLGS_PRV_SPLT_32_MSK MEM_FLGS_SPLT_32_MSK\000"
.LASF392:
	.ascii	"INT_LEAST32_MAX __INT_LEAST32_MAX__\000"
.LASF8:
	.ascii	"__ATOMIC_SEQ_CST 5\000"
.LASF621:
	.ascii	"MEM_FLG_PREV_SPLT(memFlgs) MEM_FLG_PARSE(memFlgs,ME"
	.ascii	"M_FLGS_PREV_SPLT_SHFT)\000"
.LASF708:
	.ascii	"splitUpperHead\000"
.LASF138:
	.ascii	"__DBL_MAX_EXP__ 1024\000"
.LASF111:
	.ascii	"__UINT_FAST8_MAX__ 4294967295U\000"
.LASF156:
	.ascii	"__LDBL_MIN__ 2.2250738585072014e-308L\000"
.LASF271:
	.ascii	"__TQ_FBIT__ 127\000"
.LASF88:
	.ascii	"__UINT16_MAX__ 65535\000"
.LASF372:
	.ascii	"__int_fast64_t_defined 1\000"
.LASF632:
	.ascii	"MEM_FLG_ISCACHED(memFlgs) MEM_FLG_PARSE(memFlgs,MEM"
	.ascii	"_FLGS_CACHED_SHFT)\000"
.LASF17:
	.ascii	"__SIZEOF_SHORT__ 2\000"
.LASF258:
	.ascii	"__ULLACCUM_FBIT__ 32\000"
.LASF444:
	.ascii	"STACK_BLOCK_SIZE ((uint8_t)0x4u)\000"
.LASF454:
	.ascii	"SYSTCK_AR_RES_MSK (uint8_t)(SYSTCK_AR_RES - (uint8_"
	.ascii	"t)0x1u)\000"
.LASF303:
	.ascii	"__STRICT_ANSI__ 1\000"
.LASF345:
	.ascii	"_SYS_FEATURES_H \000"
.LASF560:
	.ascii	"MEM_FLG_SET_PREVTAKEN(pMemMngrHead) MEM_FLG_SET_BIT"
	.ascii	"_MSK(pMemMngrHead, MEM_FLGS_PREVTAKEN_MSK, flagsFor"
	.ascii	"MemBlock)\000"
.LASF568:
	.ascii	"MEM_FLG_ISLOWER(memFlgs) MEM_FLG_PARSE(memFlgs,MEM_"
	.ascii	"FLGS_ISLOWER_SHFT)\000"
.LASF20:
	.ascii	"__SIZEOF_LONG_DOUBLE__ 8\000"
.LASF316:
	.ascii	"__PRAGMA_REDEFINE_EXTNAME 1\000"
.LASF32:
	.ascii	"__WCHAR_TYPE__ unsigned int\000"
.LASF689:
	.ascii	"getAdjacentNxtBlck\000"
.LASF294:
	.ascii	"__USA_IBIT__ 16\000"
.LASF432:
	.ascii	"INTMAX_C(x) __INTMAX_C(x)\000"
.LASF419:
	.ascii	"PTRDIFF_MIN (-PTRDIFF_MAX - 1)\000"
.LASF750:
	.ascii	"sizeOfElements\000"
.LASF65:
	.ascii	"__GXX_ABI_VERSION 1002\000"
.LASF62:
	.ascii	"__UINT_FAST64_TYPE__ long long unsigned int\000"
.LASF450:
	.ascii	"AMOUNT_OF_SEMS (uint8_t)0x2u\000"
.LASF128:
	.ascii	"__FLT_MIN__ 1.1754943508222875e-38F\000"
.LASF283:
	.ascii	"__HA_FBIT__ 7\000"
.LASF675:
	.ascii	"nxtMemBlck\000"
.LASF312:
	.ascii	"__GCC_ATOMIC_LLONG_LOCK_FREE 1\000"
.LASF462:
	.ascii	"MAKE_SYS_ID(id) (uint16_t)((uint16_t)((uint8_t)id &"
	.ascii	" (uint8_t)0xFFu) << (uint8_t)0x8u)\000"
.LASF506:
	.ascii	"free rFree\000"
.LASF458:
	.ascii	"AMOUNT_SYS_FKT (uint8_t)0x8u\000"
.LASF434:
	.ascii	"_GCC_WRAP_STDINT_H \000"
.LASF652:
	.ascii	"__uint16_t\000"
.LASF601:
	.ascii	"MEM_FLGS_PRV_MERGE1024_MSK MEM_FLGS_MERGE1024_MSK\000"
.LASF719:
	.ascii	"addBlckToCache\000"
.LASF190:
	.ascii	"__USFRACT_MIN__ 0.0UHR\000"
.LASF350:
	.ascii	"___int16_t_defined 1\000"
.LASF152:
	.ascii	"__LDBL_MAX_EXP__ 1024\000"
.LASF361:
	.ascii	"__int8_t_defined 1\000"
.LASF625:
	.ascii	"MEM_FLG_SET_PREV_MEMSIZE(pMemMngrHead,newSize) do {"
	.ascii	" (pMemMngrHead)->additionalFlags = (MemFlags)((pMem"
	.ascii	"MngrHead)->additionalFlags & (MemFlags)(~MEM_FLGS_S"
	.ascii	"IZE_MSK)); (pMemMngrHead)->additionalFlags = (MemFl"
	.ascii	"ags)((pMemMngrHead)->additionalFlags | (MemFlags)(("
	.ascii	"MemFlags)(newSize) & MEM_FLGS_SIZE_MSK)); }while((u"
	.ascii	"int8_t)0x0u)\000"
.LASF763:
	.ascii	"objCache\000"
.LASF567:
	.ascii	"MEM_FLG_CLR_SPLIT(pMemMngrHead) MEM_FLG_CLR_BIT_MSK"
	.ascii	"(pMemMngrHead, MEM_FLGS_SPLT_MSK, flagsForMemBlock)"
	.ascii	"\000"
.LASF287:
	.ascii	"__DA_FBIT__ 31\000"
.LASF342:
	.ascii	"HEADERS_R_RTOS_INC_H_ \000"
.LASF130:
	.ascii	"__FLT_DENORM_MIN__ 1.4012984643248171e-45F\000"
.LASF155:
	.ascii	"__LDBL_MAX__ 1.7976931348623157e+308L\000"
.LASF466:
	.ascii	"TSK_GETSTATE(pTsk) (TskState)(pTsk->tskState)\000"
.LASF93:
	.ascii	"__INT_LEAST16_MAX__ 32767\000"
.LASF262:
	.ascii	"__ULLACCUM_EPSILON__ 0x1P-32ULLK\000"
.LASF558:
	.ascii	"MEM_FLG_CLR_TAKEN(pMemMngrHead) MEM_FLG_CLR_BIT_MSK"
	.ascii	"(pMemMngrHead, MEM_FLGS_TAKEN_MSK, flagsForMemBlock"
	.ascii	")\000"
.LASF380:
	.ascii	"INT_LEAST8_MAX __INT_LEAST8_MAX__\000"
.LASF104:
	.ascii	"__UINT32_C(c) c ## UL\000"
.LASF86:
	.ascii	"__INT64_MAX__ 9223372036854775807LL\000"
.LASF569:
	.ascii	"MEM_FLG_SET_ISLOWER(pMemMngrHead) MEM_FLG_SET_BIT_M"
	.ascii	"SK(pMemMngrHead, MEM_FLGS_ISLOWER_MSK, flagsForMemB"
	.ascii	"lock)\000"
.LASF129:
	.ascii	"__FLT_EPSILON__ 1.1920928955078125e-7F\000"
.LASF577:
	.ascii	"MEM_FLG_ISCOMBO(memFlgs) (MemSize)((MEM_FLG_GET_MEM"
	.ascii	"SIZE(memFlgs) & (MemSize)(MEM_FLG_GET_MEMSIZE(memFl"
	.ascii	"gs)-(MemSize)1u)) ? 1u : 0u)\000"
.LASF309:
	.ascii	"__GCC_ATOMIC_SHORT_LOCK_FREE 1\000"
.LASF631:
	.ascii	"MEM_FLG_CLR_BGGRMRGD(pMemMngrHead) MEM_FLG_CLR_BIT_"
	.ascii	"MSK(pMemMngrHead, MEM_FLGS_BGGRMRGD_MSK, additional"
	.ascii	"Flags)\000"
.LASF623:
	.ascii	"MEM_FLG_CLR_PREV_SPLT(pMemMngrHead) MEM_FLG_CLR_BIT"
	.ascii	"_MSK(pMemMngrHead, MEM_FLGS_PREV_SPLT_MSK, addition"
	.ascii	"alFlags)\000"
.LASF242:
	.ascii	"__UACCUM_EPSILON__ 0x1P-16UK\000"
.LASF475:
	.ascii	"TSK_STATE_IS_WAITING_MSGRCV(pTsk) (TskState)(TSK_GE"
	.ascii	"TSTATE(pTsk) == TSK_STATE_WAITING_MSGRCV)\000"
.LASF43:
	.ascii	"__UINT8_TYPE__ unsigned char\000"
.LASF391:
	.ascii	"INT_LEAST32_MIN (-__INT_LEAST32_MAX__ - 1)\000"
.LASF570:
	.ascii	"MEM_FLG_CLR_ISLOWER(pMemMngrHead) MEM_FLG_CLR_BIT_M"
	.ascii	"SK(pMemMngrHead, MEM_FLGS_ISLOWER_MSK, flagsForMemB"
	.ascii	"lock)\000"
.LASF574:
	.ascii	"MEM_FL_WASLOWER(memFlgs) MEM_FLG_PARSE(memFlgs,MEM_"
	.ascii	"FLGS_WASLOWER_SHFT)\000"
.LASF228:
	.ascii	"__USACCUM_FBIT__ 8\000"
.LASF313:
	.ascii	"__GCC_ATOMIC_TEST_AND_SET_TRUEVAL 1\000"
.LASF461:
	.ascii	"DATATYPE_IS_PTR(dataType) (uint8_t)( dataType & (ui"
	.ascii	"nt8_t)0x4u)\000"
.LASF243:
	.ascii	"__LACCUM_FBIT__ 31\000"
.LASF471:
	.ascii	"TSK_STATE_IS_ACTIVE_READY(pTsk) (TskState)(TSK_GETS"
	.ascii	"TATE(pTsk) == TSK_STATE_ACTIVE_READY )\000"
.LASF160:
	.ascii	"__LDBL_HAS_INFINITY__ 1\000"
.LASF166:
	.ascii	"__DEC32_MAX__ 9.999999E96DF\000"
.LASF384:
	.ascii	"UINT16_MAX __UINT16_MAX__\000"
.LASF373:
	.ascii	"INTPTR_MIN (-__INTPTR_MAX__ - 1)\000"
.LASF336:
	.ascii	"__ARM_PCS 1\000"
.LASF729:
	.ascii	"bestFitMemBlck\000"
.LASF755:
	.ascii	"elementCntr\000"
.LASF670:
	.ascii	"MemFlags\000"
.LASF414:
	.ascii	"UINTMAX_MAX __UINTMAX_MAX__\000"
.LASF82:
	.ascii	"__SIG_ATOMIC_MIN__ (-__SIG_ATOMIC_MAX__ - 1)\000"
.LASF405:
	.ascii	"UINT_FAST16_MAX __UINT_FAST16_MAX__\000"
.LASF240:
	.ascii	"__UACCUM_MIN__ 0.0UK\000"
.LASF580:
	.ascii	"MEM_FLGS_ISBLCKBEG_SHFT ((MemFlags)0x0u)\000"
.LASF550:
	.ascii	"MEM_FLGS_MERGED_MSK ((MemFlags)0x2000u)\000"
.LASF383:
	.ascii	"INT16_MAX __INT16_MAX__\000"
.LASF441:
	.ascii	"MIN_STACK_SIZE ((StackSize)0x40u)\000"
.LASF416:
	.ascii	"SIG_ATOMIC_MIN (-__STDINT_EXP(INT_MAX) - 1)\000"
.LASF641:
	.ascii	"BITM_RMB_EXTRCT_SNGL_OFF(x) ((~((uint32_t)x))&(((ui"
	.ascii	"nt32_t)x)+(uint32_t)1u))\000"
.LASF538:
	.ascii	"MEM_FLGS_SPLT_128_MSK ((MemFlags)0x80u)\000"
.LASF368:
	.ascii	"__int_least64_t_defined 1\000"
.LASF175:
	.ascii	"__DEC64_SUBNORMAL_MIN__ 0.000000000000001E-383DD\000"
.LASF192:
	.ascii	"__USFRACT_EPSILON__ 0x1P-8UHR\000"
.LASF110:
	.ascii	"__INT_FAST64_MAX__ 9223372036854775807LL\000"
.LASF355:
	.ascii	"___int_least32_t_defined 1\000"
.LASF256:
	.ascii	"__LLACCUM_MAX__ 0X7FFFFFFFFFFFFFFFP-31LLK\000"
.LASF727:
	.ascii	"strtToLookFor\000"
.LASF532:
	.ascii	"MEM_FLGS_SPLT_16_MSK ((MemFlags)0x10u)\000"
.LASF571:
	.ascii	"MEM_FLG_ISMERGED(memFlgs) MEM_FLG_PARSE(memFlgs,MEM"
	.ascii	"_FLGS_MERGED_SHFT)\000"
.LASF300:
	.ascii	"__USER_LABEL_PREFIX__ \000"
.LASF465:
	.ascii	"CREATE_EVT_MSK(evtNr) (EVTQSlots)((EVTQSlots)0x1u <"
	.ascii	"< evtNr)\000"
.LASF401:
	.ascii	"INT_FAST8_MAX __INT_FAST8_MAX__\000"
.LASF430:
	.ascii	"INT64_C(x) __INT64_C(x)\000"
.LASF686:
	.ascii	"blckToDelete\000"
.LASF403:
	.ascii	"INT_FAST16_MIN (-__INT_FAST16_MAX__ - 1)\000"
.LASF739:
	.ascii	"desiredSize\000"
.LASF676:
	.ascii	"prvMemBlck\000"
.LASF388:
	.ascii	"INT32_MIN (-__INT32_MAX__ - 1)\000"
.LASF685:
	.ascii	"curBlck\000"
.LASF699:
	.ascii	"mergeMemBlck\000"
.LASF499:
	.ascii	"RET_STCK_ERR_INDEX_OVERFLOW ((RetCode)0x31u)\000"
.LASF473:
	.ascii	"TSK_STATE_IS_WAITING(pTsk) (TskState)(TSK_GETSTATE("
	.ascii	"pTsk) & TSK_STATE_WAITING)\000"
.LASF143:
	.ascii	"__DBL_EPSILON__ ((double)2.2204460492503131e-16L)\000"
.LASF502:
	.ascii	"RET_STCK_NO_STCKPTR ((RetCode)0x34u)\000"
.LASF205:
	.ascii	"__LFRACT_MIN__ (-0.5LR-0.5LR)\000"
.LASF663:
	.ascii	"sizetype\000"
.LASF611:
	.ascii	"MEM_FLGS_CACHED_MSK ((MemFlags)0x8000u)\000"
.LASF132:
	.ascii	"__FLT_HAS_INFINITY__ 1\000"
.LASF236:
	.ascii	"__ACCUM_MAX__ 0X7FFFFFFFP-15K\000"
.LASF151:
	.ascii	"__LDBL_MIN_10_EXP__ (-307)\000"
.LASF700:
	.ascii	"blckToMerge\000"
.LASF518:
	.ascii	"MEM_FLG_GET_STRUC_PFIELD(struc,field) ((struc)->fie"
	.ascii	"ld)\000"
.LASF315:
	.ascii	"__GCC_HAVE_DWARF2_CFI_ASM 1\000"
.LASF349:
	.ascii	"___int8_t_defined 1\000"
.LASF185:
	.ascii	"__SFRACT_MIN__ (-0.5HR-0.5HR)\000"
.LASF493:
	.ascii	"RET_TSK_NO_IDLE_TSK ((RetCode)0x20u)\000"
.LASF286:
	.ascii	"__SA_IBIT__ 16\000"
.LASF726:
	.ascii	"findBestFitFree\000"
.LASF3:
	.ascii	"__GNUC__ 4\000"
.LASF44:
	.ascii	"__UINT16_TYPE__ short unsigned int\000"
.LASF757:
	.ascii	"memMngr_MemPoolMalloc\000"
.LASF330:
	.ascii	"__SOFTFP__ 1\000"
.LASF586:
	.ascii	"MEM_FLGS_PRV_SPLT_8_SHFT MEM_FLGS_SPLT_8_SHFT\000"
.LASF365:
	.ascii	"__int32_t_defined 1\000"
.LASF164:
	.ascii	"__DEC32_MAX_EXP__ 97\000"
.LASF437:
	.ascii	"ABS(x) (((x)<0) ? (-1*(x)) : (x))\000"
.LASF605:
	.ascii	"MEM_FLGS_NXT_SPLT_MSK ((MemFlags)0x1000u)\000"
.LASF59:
	.ascii	"__UINT_FAST8_TYPE__ unsigned int\000"
.LASF254:
	.ascii	"__LLACCUM_IBIT__ 32\000"
.LASF197:
	.ascii	"__FRACT_EPSILON__ 0x1P-15R\000"
.LASF594:
	.ascii	"MEM_FLGS_PRV_SPLT_128_SHFT MEM_FLGS_SPLT_128_SHFT\000"
.LASF579:
	.ascii	"MEM_FLG_SMALLER_COMBO(memFlgs) (MemSize)(MEM_FLG_GE"
	.ascii	"T_MEMSIZE(memFlgs) & (MemSize)(-MEM_FLG_GET_MEMSIZE"
	.ascii	"(memFlgs)))\000"
.LASF664:
	.ascii	"TskPrioLvl\000"
.LASF424:
	.ascii	"INT8_C(x) __INT8_C(x)\000"
.LASF145:
	.ascii	"__DBL_HAS_DENORM__ 1\000"
.LASF38:
	.ascii	"__SIG_ATOMIC_TYPE__ int\000"
.LASF756:
	.ascii	"memMngr_DeleteMemPool\000"
.LASF438:
	.ascii	"TIME_SLICE_AMOUNT (uint16_t)500u\000"
.LASF672:
	.ascii	"MemIndex\000"
.LASF759:
	.ascii	"memMngr_MemPoolFree\000"
.LASF690:
	.ascii	"adjNxtBlck\000"
.LASF68:
	.ascii	"__INT_MAX__ 2147483647\000"
.LASF451:
	.ascii	"AMOUNT_OF_EVTS (uint8_t)0x6u\000"
.LASF606:
	.ascii	"MEM_FLGS_PREV_SPLT_SHFT ((MemFlags)0xDu)\000"
.LASF54:
	.ascii	"__UINT_LEAST64_TYPE__ long long unsigned int\000"
.LASF181:
	.ascii	"__DEC128_EPSILON__ 1E-33DL\000"
.LASF188:
	.ascii	"__USFRACT_FBIT__ 8\000"
.LASF157:
	.ascii	"__LDBL_EPSILON__ 2.2204460492503131e-16L\000"
.LASF73:
	.ascii	"__WINT_MAX__ 4294967295U\000"
.LASF306:
	.ascii	"__GCC_ATOMIC_CHAR16_T_LOCK_FREE 1\000"
.LASF10:
	.ascii	"__ATOMIC_RELEASE 3\000"
.LASF120:
	.ascii	"__FLT_MANT_DIG__ 24\000"
.LASF280:
	.ascii	"__UDQ_IBIT__ 0\000"
.LASF668:
	.ascii	"BlckSize\000"
.LASF640:
	.ascii	"BITM_RMB_TURN_TRAIL_ON(x) (((uint32_t)x)|(((uint32_"
	.ascii	"t)x)-(uint32_t)1u))\000"
.LASF604:
	.ascii	"MEM_FLGS_NXT_SPLT_SHFT ((MemFlags)0xCu)\000"
.LASF448:
	.ascii	"SYS_ID_MSK (uint16_t)0xFF00u\000"
.LASF498:
	.ascii	"RET_STCK_ERR_EMPTY ((RetCode)0x30u)\000"
.LASF245:
	.ascii	"__LACCUM_MIN__ (-0X1P31LK-0X1P31LK)\000"
.LASF158:
	.ascii	"__LDBL_DENORM_MIN__ 4.9406564584124654e-324L\000"
.LASF363:
	.ascii	"__int16_t_defined 1\000"
.LASF219:
	.ascii	"__ULLFRACT_IBIT__ 0\000"
.LASF731:
	.ascii	"additionalBlck\000"
.LASF754:
	.ascii	"nxtMemBlock\000"
.LASF590:
	.ascii	"MEM_FLGS_PRV_SPLT_32_SHFT MEM_FLGS_SPLT_32_SHFT\000"
.LASF127:
	.ascii	"__FLT_MAX__ 3.4028234663852886e+38F\000"
.LASF389:
	.ascii	"INT32_MAX __INT32_MAX__\000"
.LASF238:
	.ascii	"__UACCUM_FBIT__ 16\000"
.LASF588:
	.ascii	"MEM_FLGS_PRV_SPLT_16_SHFT MEM_FLGS_SPLT_16_SHFT\000"
.LASF202:
	.ascii	"__UFRACT_EPSILON__ 0x1P-16UR\000"
.LASF72:
	.ascii	"__WCHAR_MIN__ 0U\000"
.LASF89:
	.ascii	"__UINT32_MAX__ 4294967295UL\000"
.LASF274:
	.ascii	"__UQQ_IBIT__ 0\000"
.LASF603:
	.ascii	"MEM_FLGS_PRV_MERGE2048_MSK MEM_FLGS_MERGE2048_MSK\000"
.LASF311:
	.ascii	"__GCC_ATOMIC_LONG_LOCK_FREE 1\000"
.LASF698:
	.ascii	"prvIndex\000"
.LASF250:
	.ascii	"__ULACCUM_MIN__ 0.0ULK\000"
.LASF557:
	.ascii	"MEM_FLG_SET_TAKEN(pMemMngrHead) MEM_FLG_SET_BIT_MSK"
	.ascii	"(pMemMngrHead, MEM_FLGS_TAKEN_MSK, flagsForMemBlock"
	.ascii	")\000"
.LASF562:
	.ascii	"MEM_FLG_NXTTAKEN(memFlgs) MEM_FLG_PARSE(memFlgs,MEM"
	.ascii	"_FLGS_NXTTAKEN_SHFT)\000"
.LASF324:
	.ascii	"__ARM_ARCH 6\000"
.LASF644:
	.ascii	"BITM_RMB_EXTRCT_TRAIL_ON(x) ((~((uint32_t)x))|(((ui"
	.ascii	"nt32_t)x)+(uint32_t)1u))\000"
.LASF119:
	.ascii	"__FLT_RADIX__ 2\000"
.LASF657:
	.ascii	"long long int\000"
.LASF507:
	.ascii	"BLCK_LIMIT ((BlckSize)0x800u)\000"
.LASF436:
	.ascii	"NULL ((void *)0x0u)\000"
.LASF103:
	.ascii	"__UINT_LEAST32_MAX__ 4294967295UL\000"
.LASF474:
	.ascii	"TSK_STATE_IS_WAITING_TMR(pTsk) (TskState)(TSK_GETST"
	.ascii	"ATE(pTsk) == TSK_STATE_WAITING_TMR)\000"
.LASF476:
	.ascii	"TSK_STATE_IS_WAITING_MSGSND(pTsk) (TskState)(TSK_GE"
	.ascii	"TSTATE(pTsk) == TSK_STATE_WAITING_MSGSND)\000"
.LASF505:
	.ascii	"realloc rRealloc\000"
.LASF57:
	.ascii	"__INT_FAST32_TYPE__ int\000"
.LASF525:
	.ascii	"MEM_FLGS_ISLOWER_SHFT ((MemFlags)0x1u)\000"
.LASF284:
	.ascii	"__HA_IBIT__ 8\000"
.LASF626:
	.ascii	"MEM_FLG_PREV_ISCOMBO(memFlgs) (MemSize)((MEM_FLG_GE"
	.ascii	"T_PREV_MEMSIZE(memFlgs) & (MemSize)(MEM_FLG_GET_PRE"
	.ascii	"V_MEMSIZE(memFlgs)-(MemSize)1u)) ? 1u : 0u)\000"
.LASF422:
	.ascii	"WINT_MAX __WINT_MAX__\000"
.LASF412:
	.ascii	"INTMAX_MAX __INTMAX_MAX__\000"
.LASF613:
	.ascii	"MEM_FLG_SET_BLCKBEG(pMemMngrHead) MEM_FLG_SET_BIT_M"
	.ascii	"SK(pMemMngrHead, MEM_FLGS_ISBLCKBEG_MSK, additional"
	.ascii	"Flags)\000"
.LASF351:
	.ascii	"___int32_t_defined 1\000"
.LASF721:
	.ascii	"findBestFitInCache\000"
.LASF42:
	.ascii	"__INT64_TYPE__ long long int\000"
.LASF545:
	.ascii	"MEM_FLGS_MERGE2048_SHFT ((MemFlags)0xBu)\000"
.LASF22:
	.ascii	"__CHAR_BIT__ 8\000"
.LASF317:
	.ascii	"__SIZEOF_WCHAR_T__ 4\000"
.LASF566:
	.ascii	"MEM_FLG_SET_SPLIT(pMemMngrHead) MEM_FLG_SET_BIT_MSK"
	.ascii	"(pMemMngrHead, MEM_FLGS_SPLT_MSK, flagsForMemBlock)"
	.ascii	"\000"
.LASF775:
	.ascii	"BREAK\000"
.LASF385:
	.ascii	"INT_LEAST16_MIN (-__INT_LEAST16_MAX__ - 1)\000"
.LASF445:
	.ascii	"AMOUNT_OF_MSGQ (QID)(0x3u)\000"
.LASF201:
	.ascii	"__UFRACT_MAX__ 0XFFFFP-16UR\000"
.LASF356:
	.ascii	"___int_least64_t_defined 1\000"
.LASF456:
	.ascii	"TSK_ID_NO_TSK TSK_ID_IDLE\000"
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
.LASF358:
	.ascii	"__STDINT_EXP(x) __ ##x ##__\000"
.LASF511:
	.ascii	"SMALLER_BLCK_MSK ((BlckSize)(SMALLEST_BLCK - (BlckS"
	.ascii	"ize)1u))\000"
.LASF27:
	.ascii	"__BYTE_ORDER__ __ORDER_LITTLE_ENDIAN__\000"
.LASF510:
	.ascii	"SMALLEST_BLCK ((BlckSize)0x8u)\000"
.LASF411:
	.ascii	"UINT_FAST64_MAX __UINT_FAST64_MAX__\000"
.LASF534:
	.ascii	"MEM_FLGS_SPLT_32_MSK ((MemFlags)0x20u)\000"
.LASF490:
	.ascii	"RET_MEM_ALLOC_FAIL_TCB ((RetCode)0x1Au)\000"
.LASF491:
	.ascii	"RET_MEM_ALLOC_FAIL_STACK ((RetCode)0x1Cu)\000"
.LASF629:
	.ascii	"MEM_FLG_BGGRMRGD(memFlgs) MEM_FLG_PARSE(memFlgs,MEM"
	.ascii	"_FLGS_BGGRMRGD_SHFT)\000"
.LASF279:
	.ascii	"__UDQ_FBIT__ 64\000"
.LASF370:
	.ascii	"__int_fast16_t_defined 1\000"
.LASF153:
	.ascii	"__LDBL_MAX_10_EXP__ 308\000"
.LASF440:
	.ascii	"MAX_TASKS NR_OF_TSKS\000"
.LASF541:
	.ascii	"MEM_FLGS_MERGE512_SHFT ((MemFlags)0x9u)\000"
.LASF531:
	.ascii	"MEM_FLGS_SPLT_16_SHFT ((MemFlags)0x4u)\000"
.LASF765:
	.ascii	"buddyOffset\000"
.LASF659:
	.ascii	"unsigned int\000"
.LASF598:
	.ascii	"MEM_FLGS_PRV_MERGE512_SHFT MEM_FLGS_MERGE512_SHFT\000"
.LASF495:
	.ascii	"RET_TSK_STILL_RUNNING ((RetCode)0x24u)\000"
.LASF122:
	.ascii	"__FLT_MIN_EXP__ (-125)\000"
.LASF118:
	.ascii	"__DEC_EVAL_METHOD__ 2\000"
.LASF429:
	.ascii	"UINT32_C(x) __UINT32_C(x)\000"
.LASF229:
	.ascii	"__USACCUM_IBIT__ 8\000"
.LASF400:
	.ascii	"INT_FAST8_MIN (-__INT_FAST8_MAX__ - 1)\000"
.LASF6:
	.ascii	"__VERSION__ \"4.8.4 20140725 (release) [ARM/embedde"
	.ascii	"d-4_8-branch revision 213147]\"\000"
.LASF116:
	.ascii	"__UINTPTR_MAX__ 4294967295U\000"
.LASF121:
	.ascii	"__FLT_DIG__ 6\000"
.LASF716:
	.ascii	"added\000"
.LASF459:
	.ascii	"SYSFKT_INVALID_SYSFKT_ID (SysFktID)0xFFu\000"
.LASF732:
	.ascii	"addedNeededSize\000"
.LASF117:
	.ascii	"__FLT_EVAL_METHOD__ 0\000"
.LASF665:
	.ascii	"tskStateT\000"
.LASF501:
	.ascii	"RET_STCK_NO_STCKELEM_PTR ((RetCode)0x33u)\000"
.LASF273:
	.ascii	"__UQQ_FBIT__ 8\000"
.LASF33:
	.ascii	"__WINT_TYPE__ unsigned int\000"
.LASF170:
	.ascii	"__DEC64_MIN_EXP__ (-382)\000"
.LASF241:
	.ascii	"__UACCUM_MAX__ 0XFFFFFFFFP-16UK\000"
.LASF470:
	.ascii	"TSK_STATE_IS_ACTIVE_SUSPENDED(pTsk) (TskState)(TSK_"
	.ascii	"GETSTATE(pTsk) == TSK_STATE_ACTIVE_SUSPENDED )\000"
.LASF666:
	.ascii	"RetCode\000"
.LASF386:
	.ascii	"INT_LEAST16_MAX __INT_LEAST16_MAX__\000"
.LASF206:
	.ascii	"__LFRACT_MAX__ 0X7FFFFFFFP-31LR\000"
.LASF319:
	.ascii	"__SIZEOF_PTRDIFF_T__ 4\000"
.LASF0:
	.ascii	"__STDC__ 1\000"
.LASF520:
	.ascii	"MEM_FLG_CLR_BIT(pMemMngrHead,bit,whichFlags) MEM_FL"
	.ascii	"G_GET_STRUC_PFIELD(pMemMngrHead, whichFlags) &= ((M"
	.ascii	"emFlags)(~MEM_FLG_GET_BIT_MSK(bit)))\000"
.LASF573:
	.ascii	"MEM_FLG_CLR_MERGED(pMemMngrHead) MEM_FLG_CLR_BIT_MS"
	.ascii	"K(pMemMngrHead, MEM_FLGS_MERGED_MSK, flagsForMemBlo"
	.ascii	"ck)\000"
.LASF28:
	.ascii	"__FLOAT_WORD_ORDER__ __ORDER_LITTLE_ENDIAN__\000"
.LASF464:
	.ascii	"MQ_IS_TSK_ID(id) (uint8_t)((uint16_t)id & (uint16_t"
	.ascii	")0xFFu)\000"
.LASF749:
	.ascii	"memMngr_CreateMemPool\000"
.LASF369:
	.ascii	"__int_fast8_t_defined 1\000"
.LASF396:
	.ascii	"UINT64_MAX __UINT64_MAX__\000"
.LASF733:
	.ascii	"cpyMemBlock\000"
.LASF176:
	.ascii	"__DEC128_MANT_DIG__ 34\000"
.LASF81:
	.ascii	"__SIG_ATOMIC_MAX__ 2147483647\000"
.LASF293:
	.ascii	"__USA_FBIT__ 16\000"
.LASF133:
	.ascii	"__FLT_HAS_QUIET_NAN__ 1\000"
.LASF610:
	.ascii	"MEM_FLGS_CACHED_SHFT ((MemFlags)0xFu)\000"
.LASF207:
	.ascii	"__LFRACT_EPSILON__ 0x1P-31LR\000"
.LASF724:
	.ascii	"prvBlockIndex\000"
.LASF479:
	.ascii	"TSK_STATE_IS_WAITING_MNTR(pTsk) (TskState)(TSK_GETS"
	.ascii	"TATE(pTsk) == TSK_STATE_WAITING_MNTR)\000"
.LASF535:
	.ascii	"MEM_FLGS_SPLT_64_SHFT ((MemFlags)0x6u)\000"
.LASF320:
	.ascii	"__ARM_SIZEOF_MINIMAL_ENUM 1\000"
.LASF91:
	.ascii	"__INT_LEAST8_MAX__ 127\000"
.LASF744:
	.ascii	"tmpNxt\000"
.LASF323:
	.ascii	"__arm__ 1\000"
.LASF382:
	.ascii	"INT16_MIN (-__INT16_MAX__ - 1)\000"
.LASF377:
	.ascii	"INT8_MAX __INT8_MAX__\000"
.LASF162:
	.ascii	"__DEC32_MANT_DIG__ 7\000"
.LASF409:
	.ascii	"INT_FAST64_MIN (-__INT_FAST64_MAX__ - 1)\000"
.LASF344:
	.ascii	"_MACHINE__DEFAULT_TYPES_H \000"
.LASF23:
	.ascii	"__BIGGEST_ALIGNMENT__ 8\000"
.LASF612:
	.ascii	"MEM_FLG_ISBLCKBEG(memFlgs) MEM_FLG_PARSE(memFlgs,ME"
	.ascii	"M_FLGS_ISBLCKBEG_SHFT)\000"
.LASF669:
	.ascii	"MemPoolID\000"
.LASF742:
	.ascii	"rRealloc\000"
.LASF112:
	.ascii	"__UINT_FAST16_MAX__ 4294967295U\000"
.LASF224:
	.ascii	"__SACCUM_IBIT__ 8\000"
.LASF587:
	.ascii	"MEM_FLGS_PRV_SPLT_8_MSK MEM_FLGS_SPLT_8_MSK\000"
.LASF743:
	.ascii	"ptrToExistingMem\000"
.LASF327:
	.ascii	"__ARM_ARCH_ISA_THUMB 1\000"
.LASF512:
	.ascii	"SMALLER_BLCK_DIVISOR (MemIndex)(0x3u)\000"
.LASF105:
	.ascii	"__UINT_LEAST64_MAX__ 18446744073709551615ULL\000"
.LASF421:
	.ascii	"WCHAR_MIN __WCHAR_MIN__\000"
.LASF741:
	.ascii	"tmp2\000"
.LASF107:
	.ascii	"__INT_FAST8_MAX__ 2147483647\000"
.LASF671:
	.ascii	"stdPtr\000"
.LASF711:
	.ascii	"mrgdBlck\000"
.LASF199:
	.ascii	"__UFRACT_IBIT__ 0\000"
.LASF748:
	.ascii	"blckToFullyFree\000"
.LASF486:
	.ascii	"OS_FULL_DISPATCH ((OsCode)0x2u)\000"
.LASF92:
	.ascii	"__INT8_C(c) c\000"
.LASF204:
	.ascii	"__LFRACT_IBIT__ 0\000"
.LASF14:
	.ascii	"__SIZEOF_INT__ 4\000"
.LASF314:
	.ascii	"__GCC_ATOMIC_POINTER_LOCK_FREE 1\000"
.LASF136:
	.ascii	"__DBL_MIN_EXP__ (-1021)\000"
.LASF517:
	.ascii	"MEM_FLG_GET_BIT_MSK(bit) ((MemFlags)((MemFlags)0x1u"
	.ascii	" << (MemFlags)bit))\000"
.LASF677:
	.ascii	"MemMngrHead\000"
.LASF85:
	.ascii	"__INT32_MAX__ 2147483647L\000"
.LASF364:
	.ascii	"__int_least16_t_defined 1\000"
.LASF172:
	.ascii	"__DEC64_MIN__ 1E-383DD\000"
.LASF624:
	.ascii	"MEM_FLG_GET_PREV_MEMSIZE(memFlgs) (BlckSize)(memFlg"
	.ascii	"s & MEM_FLGS_SIZE_MSK)\000"
.LASF514:
	.ascii	"MEM_MNGR_GET_MEMMNGRHEAD(pointer) ((MemMngrHead *)("
	.ascii	" (uint32_t) pointer - (uint32_t) sizeof(MemBlckHead"
	.ascii	")))\000"
.LASF433:
	.ascii	"UINTMAX_C(x) __UINTMAX_C(x)\000"
.LASF357:
	.ascii	"__EXP\000"
.LASF352:
	.ascii	"___int64_t_defined 1\000"
.LASF159:
	.ascii	"__LDBL_HAS_DENORM__ 1\000"
.LASF235:
	.ascii	"__ACCUM_MIN__ (-0X1P15K-0X1P15K)\000"
.LASF468:
	.ascii	"TSK_STATE_IS_ACTIVE(pTsk) (TskState)(TSK_GETSTATE(p"
	.ascii	"Tsk) & TSK_STATE_ACTIVE)\000"
.LASF408:
	.ascii	"UINT_FAST32_MAX __UINT_FAST32_MAX__\000"
.LASF49:
	.ascii	"__INT_LEAST32_TYPE__ long int\000"
.LASF596:
	.ascii	"MEM_FLGS_PRV_BGGSTBLCK_SHFT MEM_FLGS_BGGSTBLCK_SHFT"
	.ascii	"\000"
.LASF508:
	.ascii	"BIGGEST_BLCK ((BlckSize)0x100u)\000"
.LASF194:
	.ascii	"__FRACT_IBIT__ 0\000"
.LASF9:
	.ascii	"__ATOMIC_ACQUIRE 2\000"
.LASF622:
	.ascii	"MEM_FLG_SET_PREV_SPLT(pMemMngrHead) MEM_FLG_SET_BIT"
	.ascii	"_MSK(pMemMngrHead, MEM_FLGS_PREV_SPLT_MSK, addition"
	.ascii	"alFlags)\000"
.LASF24:
	.ascii	"__ORDER_LITTLE_ENDIAN__ 1234\000"
.LASF519:
	.ascii	"MEM_FLG_SET_BIT(pMemMngrHead,bit,whichFlags) MEM_FL"
	.ascii	"G_GET_STRUC_PFIELD(pMemMngrHead, whichFlags) |= MEM"
	.ascii	"_FLG_GET_BIT_MSK(bit)\000"
.LASF540:
	.ascii	"MEM_FLGS_BGGSTBLCK_MSK ((MemFlags)0x100u)\000"
.LASF169:
	.ascii	"__DEC64_MANT_DIG__ 16\000"
.LASF658:
	.ascii	"long long unsigned int\000"
.LASF123:
	.ascii	"__FLT_MIN_10_EXP__ (-37)\000"
.LASF249:
	.ascii	"__ULACCUM_IBIT__ 32\000"
.LASF600:
	.ascii	"MEM_FLGS_PRV_MERGE1024_SHFT MEM_FLGS_MERGE1024_SHFT"
	.ascii	"\000"
.LASF581:
	.ascii	"MEM_FLGS_ISBLCKBEG_MSK ((MemFlags)0x1u)\000"
.LASF31:
	.ascii	"__PTRDIFF_TYPE__ int\000"
.LASF667:
	.ascii	"MemSize\000"
.LASF417:
	.ascii	"SIG_ATOMIC_MAX __STDINT_EXP(INT_MAX)\000"
.LASF269:
	.ascii	"__DQ_FBIT__ 63\000"
.LASF661:
	.ascii	"uint16_t\000"
.LASF276:
	.ascii	"__UHQ_IBIT__ 0\000"
.LASF761:
	.ascii	"failMemIndex\000"
.LASF656:
	.ascii	"long unsigned int\000"
.LASF56:
	.ascii	"__INT_FAST16_TYPE__ int\000"
.LASF225:
	.ascii	"__SACCUM_MIN__ (-0X1P7HK-0X1P7HK)\000"
.LASF527:
	.ascii	"MEM_FLGS_SPLT_4_SHFT ((MemFlags)0x2u)\000"
.LASF52:
	.ascii	"__UINT_LEAST16_TYPE__ short unsigned int\000"
.LASF246:
	.ascii	"__LACCUM_MAX__ 0X7FFFFFFFFFFFFFFFP-31LK\000"
.LASF36:
	.ascii	"__CHAR16_TYPE__ short unsigned int\000"
.LASF504:
	.ascii	"calloc rCalloc\000"
.LASF752:
	.ascii	"memPoolID\000"
.LASF634:
	.ascii	"MEM_FLG_CLR_CACHED(pMemMngrHead) MEM_FLG_CLR_BIT_MS"
	.ascii	"K(pMemMngrHead, MEM_FLGS_CACHED_MSK, additionalFlag"
	.ascii	"s)\000"
.LASF101:
	.ascii	"__UINT_LEAST16_MAX__ 65535\000"
.LASF281:
	.ascii	"__UTQ_FBIT__ 128\000"
.LASF615:
	.ascii	"MEM_FLG_ISBLCKLAST(memFlgs) MEM_FLG_PARSE(memFlgs,M"
	.ascii	"EM_FLGS_ISBLCKLAST_SHFT)\000"
.LASF13:
	.ascii	"__FINITE_MATH_ONLY__ 0\000"
.LASF359:
	.ascii	"__have_longlong64 1\000"
.LASF455:
	.ascii	"TSK_ID_IDLE ((TskID)0x0u)\000"
.LASF747:
	.ascii	"rFullyFree\000"
.LASF607:
	.ascii	"MEM_FLGS_PREV_SPLT_MSK ((MemFlags)0x2000u)\000"
.LASF418:
	.ascii	"PTRDIFF_MAX __PTRDIFF_MAX__\000"
.LASF446:
	.ascii	"MSGQ_TSK_ID_POS (uint8_t)0x0u\000"
.LASF251:
	.ascii	"__ULACCUM_MAX__ 0XFFFFFFFFFFFFFFFFP-32ULK\000"
.LASF627:
	.ascii	"MEM_FLG_PREV_BIGGER_COMBO(memFlgs) (MemSize)(MEM_FL"
	.ascii	"G_GET_PREV_MEMSIZE(memFlgs) & (MemSize)(MEM_FLG_GET"
	.ascii	"_PREV_MEMSIZE(memFlgs)-(MemSize)1u))\000"
.LASF637:
	.ascii	"BITM_RMB_TURN_BIT_OFF(x) (((uint32_t)x)&(((uint32_t"
	.ascii	")x)-(uint32_t)1u))\000"
.LASF210:
	.ascii	"__ULFRACT_MIN__ 0.0ULR\000"
.LASF270:
	.ascii	"__DQ_IBIT__ 0\000"
.LASF168:
	.ascii	"__DEC32_SUBNORMAL_MIN__ 0.000001E-95DF\000"
.LASF41:
	.ascii	"__INT32_TYPE__ long int\000"
.LASF549:
	.ascii	"MEM_FLGS_MERGED_SHFT ((MemFlags)0xDu)\000"
.LASF769:
	.ascii	"__HeapBase\000"
.LASF195:
	.ascii	"__FRACT_MIN__ (-0.5R-0.5R)\000"
.LASF774:
	.ascii	"memMngrHead\000"
.LASF97:
	.ascii	"__INT_LEAST64_MAX__ 9223372036854775807LL\000"
.LASF387:
	.ascii	"UINT_LEAST16_MAX __UINT_LEAST16_MAX__\000"
.LASF704:
	.ascii	"prevBlck\000"
.LASF332:
	.ascii	"__ARM_FP 12\000"
.LASF740:
	.ascii	"rCalloc\000"
.LASF76:
	.ascii	"__SIZE_MAX__ 4294967295U\000"
.LASF599:
	.ascii	"MEM_FLGS_PRV_MERGE512_MSK MEM_FLGS_MERGE512_MSK\000"
.LASF583:
	.ascii	"MEM_FLGS_ISBLCKLAST_MSK ((MemFlags)0x2u)\000"
.LASF282:
	.ascii	"__UTQ_IBIT__ 0\000"
.LASF407:
	.ascii	"INT_FAST32_MAX __INT_FAST32_MAX__\000"
.LASF285:
	.ascii	"__SA_FBIT__ 15\000"
.LASF477:
	.ascii	"TSK_STATE_IS_WAITING_EVT(pTsk) (TskState)(TSK_GETST"
	.ascii	"ATE(pTsk) == TSK_STATE_WAITING_EVT)\000"
.LASF509:
	.ascii	"BIGGEST_BLCK_MSK ((BlckSize)(BIGGEST_BLCK - (BlckSi"
	.ascii	"ze)1u))\000"
.LASF339:
	.ascii	"__ELF__ 1\000"
.LASF329:
	.ascii	"__THUMBEL__ 1\000"
.LASF734:
	.ascii	"dest\000"
.LASF679:
	.ascii	"newSize\000"
.LASF614:
	.ascii	"MEM_FLG_CLR_BLCKBEG(pMemMngrHead) MEM_FLG_CLR_BIT_M"
	.ascii	"SK(pMemMngrHead, MEM_FLGS_ISBLCKBEG_MSK, additional"
	.ascii	"Flags)\000"
.LASF725:
	.ascii	"nxtBlockIndex\000"
.LASF264:
	.ascii	"__QQ_IBIT__ 0\000"
.LASF683:
	.ascii	"memLstTempElem\000"
.LASF561:
	.ascii	"MEM_FLG_CLR_PREVTAKEN(pMemMngrHead) MEM_FLG_CLR_BIT"
	.ascii	"_MSK(pMemMngrHead, MEM_FLGS_PREVTAKEN_MSK, flagsFor"
	.ascii	"MemBlock)\000"
.LASF431:
	.ascii	"UINT64_C(x) __UINT64_C(x)\000"
.LASF253:
	.ascii	"__LLACCUM_FBIT__ 31\000"
.LASF79:
	.ascii	"__UINTMAX_MAX__ 18446744073709551615ULL\000"
.LASF35:
	.ascii	"__UINTMAX_TYPE__ long long unsigned int\000"
.LASF278:
	.ascii	"__USQ_IBIT__ 0\000"
.LASF522:
	.ascii	"MEM_FLG_CLR_BIT_MSK(pMemMngrHead,msk,whichFlags) ME"
	.ascii	"M_FLG_GET_STRUC_PFIELD(pMemMngrHead, whichFlags) &="
	.ascii	" ((MemFlags)(~((MemFlags)msk)))\000"
.LASF53:
	.ascii	"__UINT_LEAST32_TYPE__ long unsigned int\000"
.LASF4:
	.ascii	"__GNUC_MINOR__ 8\000"
.LASF713:
	.ascii	"smllrBlckSize\000"
.LASF34:
	.ascii	"__INTMAX_TYPE__ long long int\000"
.LASF310:
	.ascii	"__GCC_ATOMIC_INT_LOCK_FREE 1\000"
.LASF95:
	.ascii	"__INT_LEAST32_MAX__ 2147483647L\000"
.LASF546:
	.ascii	"MEM_FLGS_MERGE2048_MSK ((MemFlags)0x800u)\000"
.LASF551:
	.ascii	"MEM_FLGS_PREVTAKEN_SHFT ((MemFlags)0xEu)\000"
.LASF232:
	.ascii	"__USACCUM_EPSILON__ 0x1P-8UHK\000"
.LASF147:
	.ascii	"__DBL_HAS_QUIET_NAN__ 1\000"
.LASF428:
	.ascii	"INT32_C(x) __INT32_C(x)\000"
.LASF216:
	.ascii	"__LLFRACT_MAX__ 0X7FFFFFFFFFFFFFFFP-63LLR\000"
.LASF178:
	.ascii	"__DEC128_MAX_EXP__ 6145\000"
.LASF694:
	.ascii	"delMemBlck\000"
.LASF75:
	.ascii	"__PTRDIFF_MAX__ 2147483647\000"
.LASF226:
	.ascii	"__SACCUM_MAX__ 0X7FFFP-7HK\000"
.LASF63:
	.ascii	"__INTPTR_TYPE__ int\000"
.LASF64:
	.ascii	"__UINTPTR_TYPE__ unsigned int\000"
.LASF299:
	.ascii	"__REGISTER_PREFIX__ \000"
.LASF182:
	.ascii	"__DEC128_SUBNORMAL_MIN__ 0.000000000000000000000000"
	.ascii	"000000001E-6143DL\000"
.LASF135:
	.ascii	"__DBL_DIG__ 15\000"
.LASF212:
	.ascii	"__ULFRACT_EPSILON__ 0x1P-32ULR\000"
.LASF335:
	.ascii	"__ARM_ARCH_6M__ 1\000"
.LASF449:
	.ascii	"TSK_ID_MSK (uint16_t)0x00FFu\000"
.LASF21:
	.ascii	"__SIZEOF_SIZE_T__ 4\000"
.LASF179:
	.ascii	"__DEC128_MIN__ 1E-6143DL\000"
.LASF481:
	.ascii	"TSK_STATE_IS_UNINIT_UNINIT(pTsk) (TskState)(TSK_GET"
	.ascii	"STATE(pTsk) == TSK_STATE_UNINIT_UNINIT)\000"
.LASF523:
	.ascii	"MEM_FLGS_TAKEN_SHFT ((MemFlags)0x0u)\000"
.LASF234:
	.ascii	"__ACCUM_IBIT__ 16\000"
.LASF480:
	.ascii	"TSK_STATE_IS_UNINIT(pTsk) (TskState)(TSK_GETSTATE(p"
	.ascii	"Tsk) & TSK_STATE_UNINIT)\000"
.LASF642:
	.ascii	"BITM_RMB_EXTRCT_SNGL_ON(x) ((~((uint32_t)x))|(((uin"
	.ascii	"t32_t)x)-(uint32_t)1u))\000"
.LASF500:
	.ascii	"RET_STCK_ERR_INDEX_UNDERFLOW ((RetCode)0x32u)\000"
.LASF650:
	.ascii	"short int\000"
.LASF198:
	.ascii	"__UFRACT_FBIT__ 16\000"
.LASF102:
	.ascii	"__UINT16_C(c) c\000"
.LASF296:
	.ascii	"__UDA_IBIT__ 32\000"
.LASF484:
	.ascii	"SEM_NR_OF_TSK_REF_BYTES (uint8_t)((NR_OF_TSKS >> 3)"
	.ascii	" + 1)\000"
.LASF684:
	.ascii	"prvBlck\000"
.LASF394:
	.ascii	"INT64_MIN (-__INT64_MAX__ - 1)\000"
.LASF463:
	.ascii	"MAKE_TSK_ID(id) (uint16_t)(uint16_t)((uint8_t)id & "
	.ascii	"(uint8_t)0xFFu)\000"
.LASF7:
	.ascii	"__ATOMIC_RELAXED 0\000"
.LASF753:
	.ascii	"curMemBlock\000"
.LASF552:
	.ascii	"MEM_FLGS_PREVTAKEN_MSK ((MemFlags)0x4000u)\000"
.LASF146:
	.ascii	"__DBL_HAS_INFINITY__ 1\000"
.LASF399:
	.ascii	"UINT_LEAST64_MAX __UINT_LEAST64_MAX__\000"
.LASF393:
	.ascii	"UINT_LEAST32_MAX __UINT_LEAST32_MAX__\000"
.LASF340:
	.ascii	"__USES_INITFINI__ 1\000"
.LASF751:
	.ascii	"elements\000"
.LASF425:
	.ascii	"UINT8_C(x) __UINT8_C(x)\000"
.LASF67:
	.ascii	"__SHRT_MAX__ 32767\000"
.LASF211:
	.ascii	"__ULFRACT_MAX__ 0XFFFFFFFFP-32ULR\000"
.LASF140:
	.ascii	"__DBL_DECIMAL_DIG__ 17\000"
.LASF360:
	.ascii	"__have_long32 1\000"
.LASF745:
	.ascii	"pToBeFreed\000"
.LASF758:
	.ascii	"ptrToMem\000"
.LASF367:
	.ascii	"__int64_t_defined 1\000"
.LASF709:
	.ascii	"unMergeUnevenBlcks\000"
.LASF69:
	.ascii	"__LONG_MAX__ 2147483647L\000"
.LASF263:
	.ascii	"__QQ_FBIT__ 7\000"
.LASF616:
	.ascii	"MEM_FLG_SET_BLCKLAST(pMemMngrHead) MEM_FLG_SET_BIT_"
	.ascii	"MSK(pMemMngrHead, MEM_FLGS_ISBLCKLAST_MSK, addition"
	.ascii	"alFlags)\000"
.LASF222:
	.ascii	"__ULLFRACT_EPSILON__ 0x1P-64ULLR\000"
.LASF347:
	.ascii	"__GNUC_PREREQ__(ma,mi) __GNUC_PREREQ(ma, mi)\000"
.LASF298:
	.ascii	"__UTA_IBIT__ 64\000"
.LASF259:
	.ascii	"__ULLACCUM_IBIT__ 32\000"
.LASF165:
	.ascii	"__DEC32_MIN__ 1E-95DF\000"
.LASF203:
	.ascii	"__LFRACT_FBIT__ 31\000"
.LASF528:
	.ascii	"MEM_FLGS_SPLT_4_MSK ((MemFlags)0x4u)\000"
.LASF553:
	.ascii	"MEM_FLGS_NXTTAKEN_SHFT ((MemFlags)0xFu)\000"
.LASF50:
	.ascii	"__INT_LEAST64_TYPE__ long long int\000"
.LASF318:
	.ascii	"__SIZEOF_WINT_T__ 4\000"
.LASF338:
	.ascii	"__GXX_TYPEINFO_EQUALITY_INLINE 0\000"
.LASF472:
	.ascii	"TSK_STATE_IS_ACTIVE_CRITSEC(pTsk) (TskState)(TSK_GE"
	.ascii	"TSTATE(pTsk) == TSK_STATE_ACTIVE_CRITSEC )\000"
.LASF674:
	.ascii	"additionalFlags\000"
.LASF609:
	.ascii	"MEM_FLGS_BGGRMRGD_MSK ((MemFlags)0x4000u)\000"
.LASF738:
	.ascii	"rMalloc\000"
.LASF163:
	.ascii	"__DEC32_MIN_EXP__ (-94)\000"
.LASF260:
	.ascii	"__ULLACCUM_MIN__ 0.0ULLK\000"
.LASF544:
	.ascii	"MEM_FLGS_MERGE1024_MSK ((MemFlags)0x400u)\000"
.LASF578:
	.ascii	"MEM_FLG_BIGGER_COMBO(memFlgs) (MemSize)(MEM_FLG_GET"
	.ascii	"_MEMSIZE(memFlgs) & (MemSize)(MEM_FLG_GET_MEMSIZE(m"
	.ascii	"emFlgs)-(MemSize)1u))\000"
.LASF639:
	.ascii	"BITM_RMB_TURN_TRAIL_OFF(x) (((uint32_t)x)&(((uint32"
	.ascii	"_t)x)+(uint32_t)1u))\000"
.LASF487:
	.ascii	"OS_DISPATCH_NEEDED ((OsCode)0x1u)\000"
.LASF45:
	.ascii	"__UINT32_TYPE__ long unsigned int\000"
.LASF374:
	.ascii	"INTPTR_MAX __INTPTR_MAX__\000"
.LASF636:
	.ascii	"HEADERS_R_RTOS_BITMAGIC_H_ \000"
.LASF688:
	.ascii	"adjPrvBlck\000"
.LASF706:
	.ascii	"splitMemBlck\000"
.LASF533:
	.ascii	"MEM_FLGS_SPLT_32_SHFT ((MemFlags)0x5u)\000"
.LASF220:
	.ascii	"__ULLFRACT_MIN__ 0.0ULLR\000"
.LASF452:
	.ascii	"EVT_QUEUE_SIZE (uint8_t)0x4u\000"
.LASF722:
	.ascii	"requestedSlabSize\000"
.LASF695:
	.ascii	"fitBlckBackIntoFreeLst\000"
.LASF595:
	.ascii	"MEM_FLGS_PRV_SPLT_128_MSK MEM_FLGS_SPLT_128_MSK\000"
.LASF214:
	.ascii	"__LLFRACT_IBIT__ 0\000"
.LASF427:
	.ascii	"UINT16_C(x) __UINT16_C(x)\000"
.LASF707:
	.ascii	"blckToSplit\000"
.LASF662:
	.ascii	"uint32_t\000"
.LASF730:
	.ascii	"curBestFitSize\000"
.LASF619:
	.ascii	"MEM_FLG_SET_NXT_SPLT(pMemMngrHead) MEM_FLG_SET_BIT_"
	.ascii	"MSK(pMemMngrHead, MEM_FLGS_NXT_SPLT_MSK, additional"
	.ascii	"Flags)\000"
.LASF529:
	.ascii	"MEM_FLGS_SPLT_8_SHFT ((MemFlags)0x3u)\000"
.LASF227:
	.ascii	"__SACCUM_EPSILON__ 0x1P-7HK\000"
.LASF773:
	.ascii	"C:\\\\LabWrk\\\\WorkSpace\\\\R_RTOS_BUILD\\\\build\000"
.LASF503:
	.ascii	"malloc rMalloc\000"
.LASF555:
	.ascii	"MEM_FLGS_SIZE_MSK ((MemFlags)0xFFCu)\000"
.LASF772:
	.ascii	"../source/R_RTOS/R_RTOS_memMngr.c\000"
.LASF60:
	.ascii	"__UINT_FAST16_TYPE__ unsigned int\000"
.LASF292:
	.ascii	"__UHA_IBIT__ 8\000"
.LASF705:
	.ascii	"reMergeMemBlck\000"
.LASF760:
	.ascii	"memoryHEAPBASE\000"
.LASF237:
	.ascii	"__ACCUM_EPSILON__ 0x1P-15K\000"
.LASF252:
	.ascii	"__ULACCUM_EPSILON__ 0x1P-32ULK\000"
.LASF701:
	.ascii	"split\000"
.LASF149:
	.ascii	"__LDBL_DIG__ 15\000"
.LASF74:
	.ascii	"__WINT_MIN__ 0U\000"
.LASF585:
	.ascii	"MEM_FLGS_PRV_SPLT_4_MSK MEM_FLGS_SPLT_4_MSK\000"
.LASF174:
	.ascii	"__DEC64_EPSILON__ 1E-15DD\000"
.LASF766:
	.ascii	"cacheSize\000"
.LASF746:
	.ascii	"rFree\000"
.LASF48:
	.ascii	"__INT_LEAST16_TYPE__ short int\000"
.LASF521:
	.ascii	"MEM_FLG_SET_BIT_MSK(pMemMngrHead,msk,whichFlags) ME"
	.ascii	"M_FLG_GET_STRUC_PFIELD(pMemMngrHead, whichFlags) |="
	.ascii	" (MemFlags)msk\000"
.LASF141:
	.ascii	"__DBL_MAX__ ((double)1.7976931348623157e+308L)\000"
.LASF653:
	.ascii	"short unsigned int\000"
.LASF213:
	.ascii	"__LLFRACT_FBIT__ 63\000"
.LASF326:
	.ascii	"__thumb__ 1\000"
.LASF696:
	.ascii	"curIndex\000"
.LASF404:
	.ascii	"INT_FAST16_MAX __INT_FAST16_MAX__\000"
.LASF328:
	.ascii	"__ARMEL__ 1\000"
.LASF265:
	.ascii	"__HQ_FBIT__ 15\000"
.LASF717:
	.ascii	"shrinkCacheFIFO\000"
.LASF453:
	.ascii	"SYSTCK_AR_RES (uint8_t)0x8u\000"
.LASF542:
	.ascii	"MEM_FLGS_MERGE512_MSK ((MemFlags)0x200u)\000"
.LASF115:
	.ascii	"__INTPTR_MAX__ 2147483647\000"
.LASF184:
	.ascii	"__SFRACT_IBIT__ 0\000"
.LASF556:
	.ascii	"MEM_FLG_ISTAKEN(memFlgs) MEM_FLG_PARSE(memFlgs,MEM_"
	.ascii	"FLGS_TAKEN_SHFT)\000"
.LASF362:
	.ascii	"__int_least8_t_defined 1\000"
.LASF343:
	.ascii	"_STDINT_H \000"
.LASF608:
	.ascii	"MEM_FLGS_BGGRMRGD_SHFT ((MemFlags)0xEu)\000"
.LASF30:
	.ascii	"__SIZE_TYPE__ unsigned int\000"
.LASF426:
	.ascii	"INT16_C(x) __INT16_C(x)\000"
.LASF217:
	.ascii	"__LLFRACT_EPSILON__ 0x1P-63LLR\000"
.LASF768:
	.ascii	"memPools\000"
.LASF186:
	.ascii	"__SFRACT_MAX__ 0X7FP-7HR\000"
.LASF697:
	.ascii	"nxtIndex\000"
.LASF443:
	.ascii	"IDLE_TSK_STACK_SIZE ((StackSize)0x60u)\000"
.LASF497:
	.ascii	"RET_STCK_ERR_FULL ((RetCode)0x3Fu)\000"
.LASF94:
	.ascii	"__INT16_C(c) c\000"
.LASF530:
	.ascii	"MEM_FLGS_SPLT_8_MSK ((MemFlags)0x8u)\000"
.LASF288:
	.ascii	"__DA_IBIT__ 32\000"
.LASF189:
	.ascii	"__USFRACT_IBIT__ 0\000"
.LASF728:
	.ascii	"neededSize\000"
.LASF681:
	.ascii	"setPRVBlckMemSize\000"
.LASF266:
	.ascii	"__HQ_IBIT__ 0\000"
.LASF770:
	.ascii	"__HeapLimit\000"
.LASF137:
	.ascii	"__DBL_MIN_10_EXP__ (-307)\000"
.LASF692:
	.ascii	"getIndex\000"
.LASF735:
	.ascii	"sizeToCpy\000"
.LASF87:
	.ascii	"__UINT8_MAX__ 255\000"
.LASF702:
	.ascii	"tmpBlck\000"
.LASF113:
	.ascii	"__UINT_FAST32_MAX__ 4294967295U\000"
.LASF99:
	.ascii	"__UINT_LEAST8_MAX__ 255\000"
.LASF526:
	.ascii	"MEM_FLGS_ISLOWER_MSK ((MemFlags)0x2u)\000"
.LASF516:
	.ascii	"MEM_FLG_PARSE(memFlgs,shft) ((MemFlags)((MemFlags)("
	.ascii	"memFlgs >> (MemFlags)shft) & (MemFlags)0x1u))\000"
.LASF478:
	.ascii	"TSK_STATE_IS_WAITING_SEM(pTsk) (TskState)(TSK_GETST"
	.ascii	"ATE(pTsk) == TSK_STATE_WAITING_SEM)\000"
.LASF680:
	.ascii	"setBlckMemSize\000"
.LASF515:
	.ascii	"MEM_MNGR_GET_PTRTOMEM(memMngrPtr) ((void *) ((uint3"
	.ascii	"2_t) memMngrPtr + (uint32_t) sizeof(MemBlckHead)))\000"
.LASF723:
	.ascii	"curBlckCche\000"
.LASF337:
	.ascii	"__ARM_EABI__ 1\000"
.LASF442:
	.ascii	"MY_STACK_SIZE ((StackSize)0x80u)\000"
.LASF223:
	.ascii	"__SACCUM_FBIT__ 7\000"
.LASF628:
	.ascii	"MEM_FLG_PREV_SMALLER_COMBO(memFlgs) (MemSize)(MEM_F"
	.ascii	"LG_GET_PREV_MEMSIZE(memFlgs) & (MemSize)(-MEM_FLG_G"
	.ascii	"ET_PREV_MEMSIZE(memFlgs)))\000"
.LASF439:
	.ascii	"NR_OF_TSKS ((uint8_t)0xBu)\000"
	.ident	"GCC: (GNU Tools for ARM Embedded Processors) 4.8.4 20140725 (release) [ARM/embedded-4_8-branch revision 213147]"
