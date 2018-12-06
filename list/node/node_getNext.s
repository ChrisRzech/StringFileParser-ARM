@@@@@@@@@@@@@@@@@@@@
@ Returns the next @
@ of a node        @
@================@@@
@ Pre-condition  @
@ R0: --         @
@ R1: Node       @
@================@
@ Post-condition @
@ R0: Next       @
@ R1: --         @
@@@@@@@@@@@@@@@@@@
.global node_getNext
node_getNext:
@@@@@@@@@@@@@@@@@@
@ Register Alias @
next .req R0     @
node .req R1     @
@@@@@@@@@@@@@@@@@@
	ldr	next,[node,#4]	@offset the node by a word
	bx	LR
.end

