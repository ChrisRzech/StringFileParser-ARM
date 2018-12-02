@@@@@@@@@@@@@@@@@@@@
@ Assigns the data @
@ of the node      @
@================@@@
@ Pre-condition  @
@ R1: Node       @
@ R2: Data       @
@================@
@ Post-condition @
@ R1: --         @
@ R2: --         @
@@@@@@@@@@@@@@@@@@
.global node_setData
node_setData:
@@@@@@@@@@@@@@@@@@
@ Register Alias @
node .req R1     @
data .req R2     @
@@@@@@@@@@@@@@@@@@
	str	data,[node]

	bx	LR
.end

