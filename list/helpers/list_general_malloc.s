@@@@@@@@@@@@@@@@@@@@@@@@@
@ Returns a dynamically @
@ allocated address     @
@================@@@@@@@@
@ Pre-condition  @
@ R0: --         @
@ R1: n words    @
@================@
@ Post-condition @
@ R0: Address    @
@ R1: --         @
@@@@@@@@@@@@@@@@@@
.extern malloc

.global list_general_malloc
list_general_malloc:
	push	{R1-R4,R12,LR}

	mov	R1,#4
	mul	R0,R1		@n words * 4 bytes = total bytes
	mov	R0,R4
	bl	malloc

	mov	R1,#0
	str	R1,[R0]		@store 0 into the

	pop	{R1-R4,R12,LR}
	bx	LR
.end

