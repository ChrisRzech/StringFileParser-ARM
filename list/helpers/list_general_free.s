@@@@@@@@@@@@@@@@@@@@@@@
@ Frees a dynamically @
@ allocated address   @
@================@@@@@@
@ Pre-condition  @
@ R0: Address    @
@================@
@ Post-condition @
@ R0: --         @
@@@@@@@@@@@@@@@@@@
.extern free

.global list_general_free
list_general_free:
	push	{R1,R12,LR}

	bl	free

	pop	{R1,R12,LR}
	bx	LR
.end

