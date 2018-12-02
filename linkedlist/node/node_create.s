@@@@@@@@@@@@@@@@@@@@@@@@@
@ Allocates a node with @
@ space for data and a  @
@ pointer for a node    @
@================@@@@@@@@
@ Pre-condition  @
@ R0: --         @
@================@
@ Post-condition @
@ R0: Node       @
@@@@@@@@@@@@@@@@@@
.global node_create
node_create:
	push	{R0,LR}

	mov	R0,#8				@2 words
	bl	linkedlist_general_malloc

	pop	{R0,LR}
.end

