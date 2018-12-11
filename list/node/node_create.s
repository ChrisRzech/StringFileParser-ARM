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
	push	{R0,R2,LR}

	mov	R0,#2		@2 words
	bl	list_general_malloc
	mov	R1,R0		@R1 = node

	mov	R2,#0
	bl	node_setData	@data = 0
	bl	node_setNext	@next = 0

	pop	{R0,R2,LR}
	bx	LR
.end

