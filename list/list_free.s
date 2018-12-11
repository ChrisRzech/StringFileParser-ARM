@@@@@@@@@@@@@@@@@@@@@@@
@ Deallocates all the @
@ nodes and the list  @
@================@@@@@@
@ Pre-condition  @
@ R1: List       @
@================@
@ Post-condition @
@ R1: --         @
@@@@@@@@@@@@@@@@@@
.global list_free
list_free:
	push	{LR}

	bl	list_clear
	bl	list_general_free

	pop	{LR}
	bx	LR
.end

