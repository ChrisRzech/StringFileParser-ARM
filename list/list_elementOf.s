@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Returns the data of a node @
@ given an index             @
@================@@@@@@@@@@@@@
@ Pre-condition  @
@ R0: --         @
@ R1: List       @
@ R2: Index      @
@================@
@ Post-condition @
@ R0: Data       @
@ R1: --         @
@ R2: --         @
@@@@@@@@@@@@@@@@@@
.global list_elementOf
list_elementOf:
@@@@@@@@@@@@@@@@@@
@ Register Alias @
data .req R0
list .req R1
index .req R2
@@@@@@@@@@@@@@@@@@
	push	{R1,R2,LR}

	cmp	list,#0
	beq	return		@if(list == nullptr) return

	bl	list_getSize

	cmp	index,R0
	bhs	return		@if(index >= list.size()) return

	bl	list_getHead
	mov	R1,R0		@R1 is the node that head points to

loop:
	bl	node_getData	@R0 = node->data

	bl	node_increment	@R1 = node++

	cmp	index,#0
	beq	return		@if(index == 0) return

	sub	index,#1
	b	loop

return:
	pop	{R1,R2,LR}
	bx	LR
.end

