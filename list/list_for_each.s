@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Executes a function on   @
@ each element of the list @
@================@@@@@@@@@@@
@ Pre-condition  @
@ R1: List       @
@ R2: Function   @
@================@
@ Post-condition @
@ R1: --         @
@ R2: --         @
@@@@@@@@@@@@@@@@@@
.global list_for_each
list_for_each:
@@@@@@@@@@@@@@@@@@
@ Register Alias @
list .req R1     @
node .req R1     @
data .req R1     @
func .req R2     @
@@@@@@@@@@@@@@@@@@
	push	{R1,R2,LR}

	cmp	list,#0
	beq	return

	bl	list_getHead	@R0 = head's node
	mov	node,R0		@R1 = head's node

loop:
	cmp	node,#0
	beq	return		@if(node == nullptr)

	push	{node}		@save node

	bl	node_getData
	mov	data,R0		@R1 = data

	add	LR,PC,#0	@LR = current PC + 2 instructions (pop {node})
	bx	func		@function must take R1 as parameter

	pop	{node}		@load node

	bl	node_increment
	b	loop

return:
	pop	{R1,R2,LR}
	bx	LR
.end

