@@@@@@@@@@@@@@@@@@@@@@@
@ Frees a dynamically @
@ allocated string    @
@================@@@@@@
@ Pre-condition  @
@ R1: String     @
@================@
@ Post-condition @
@ R1: --         @
@@@@@@@@@@@@@@@@@@
.extern free

.global string_free
string_free:
	push	{R0,R12,LR}

	mov	R0,R1
	bl	free

	pop	{R0,R12,LR}
	bx	LR
.end

