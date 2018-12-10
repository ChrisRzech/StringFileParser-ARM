@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Checks if a substring  @
@ exists within a string @
@================@@@@@@@@@
@ Pre-condition  @
@ R0: --         @
@ R1: String     @
@ R2: Substring  @
@================@
@ Post-condition @
@ R0: Boolean    @
@ R1: --         @
@ R2: --         @
@@@@@@@@@@@@@@@@@@
.global substring_exists
substring_exists:
	push	{LR}

	bl	string_indexOf_3

	cmp	R0,#-1
	moveq	R0,#0
	movne	R0,#1

	pop	{LR}
	bx	LR
.end

