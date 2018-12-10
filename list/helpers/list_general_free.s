@@@@@@@@@@@@@@@@@@@@@@@
@ Frees a dynamically @
@ allocated address   @
@================@@@@@@
@ Pre-condition  @
@ R1: Address    @
@================@
@ Post-condition @
@ R1: --         @
@@@@@@@@@@@@@@@@@@
.extern free

.global list_general_free
list_general_free:
	push	{R0,R1,R12,LR}

	mov	R0,R1
	bl	free

	pop	{R0,R1,R12,LR}
	bx	LR
.end

