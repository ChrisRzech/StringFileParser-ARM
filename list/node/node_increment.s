@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Overwrites the given node @
@ with the next node        @
@================@@@@@@@@@@@@
@ Pre-condition  @
@ R1: Node       @
@================@
@ Post-condition @
@ R1: --         @
@@@@@@@@@@@@@@@@@@
.global node_increment
node_increment:
	push	{R0,LR}

	bl	node_getNext
	mov	R1,R0

	pop	{R0,LR}
	bx	LR
.end

