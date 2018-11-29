@@@@@@@@@@@@@@@@@@@@
@ Returns the data @
@ of a node        @
@================@@@
@ Pre-condition  @
@ R0: --         @
@ R1: Node       @
@================@
@ Post-condition @
@ R0: Data       @
@ R1: --         @
@@@@@@@@@@@@@@@@@@
.global linkedlist_getData
linkedlist_getData:
@@@@@@@@@@@@@@@@@@
@ Register Alias @
data .req R0     @
node .req R1     @
@@@@@@@@@@@@@@@@@@
	ldr	data,[node]

	bx	LR
.end

