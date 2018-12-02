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
	push	{R1-R3,R12,LR}

	mov	R1,#4
	mul	R0,R1		@n words * 4 bytes = total bytes
	bl	malloc

	pop	{R1-R3,R12,LR}
	bx	LR
.end

