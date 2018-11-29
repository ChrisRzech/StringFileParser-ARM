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

	mov	R0,#2			@R0 = number of words
	bl	linkedlist_malloc	@R0 = 2 words (data and next)

	pop	{R0,LR}
.end

