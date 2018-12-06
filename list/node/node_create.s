@@@@@@@@@@@@@@@@@@@@@@@@@
@ Allocates a node with @
@ space for data and a  @
@ pointer for a node    @
@================@@@@@@@@
@ Pre-condition  @
@ R1: --         @
@================@
@ Post-condition @
@ R1: Node       @
@@@@@@@@@@@@@@@@@@
.global node_create
node_create:
	push	{R0,LR}

	mov	R0,#2		@2 words
	bl	list_general_malloc
	mov	R1,R0		@R1 = node

	pop	{R0,LR}
	bx	LR
.end

