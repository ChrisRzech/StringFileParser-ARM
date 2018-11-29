@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Allocates enough space @
@ for a given amount of  @
@ words                  @
@================@@@@@@@@@
@ Pre-condition  @
@ R0: n bytes    @
@================@
@ Post-condition @
@ R0: address    @
@@@@@@@@@@@@@@@@@@
.extern malloc

.global node_malloc
node_malloc:
	push	{R1-R3,R12,LR}

	mov	R1,#4		@R1 = bytes in a word
	mul	R0,R1		@R0 = 4 * n bytes
	bl	malloc

	pop	{R1-R3,R12,LR}
	bx	LR
.end

