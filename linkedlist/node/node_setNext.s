@@@@@@@@@@@@@@@@@@@@
@ Assigns the next @
@ of a node        @
@================@@@
@ Pre-condition  @
@ R1: Node       @
@ R2: Next       @
@================@
@ Post-condition @
@ R1: --         @
@ R2: --         @
@@@@@@@@@@@@@@@@@@
.global node_setNext
node_setNext:
@@@@@@@@@@@@@@@@@@
@ Register Alias @
node .req R1     @
next .req R2     @
@@@@@@@@@@@@@@@@@@
	str	next,[node,#4]	@offset the node by a word
	bx	LR
.end

