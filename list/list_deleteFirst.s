@@@@@@@@@@@@@@@@@@@@@@@@@
@ Deletes the node at   @
@ the start of the list @
@================@@@@@@@@
@ Pre-condition  @
@ R1: List       @
@================@
@ Post-condition @
@ R1: --         @
@@@@@@@@@@@@@@@@@@
.global list_deleteFirst
list_deleteFirst:
@@@@@@@@@@@@@@@@@@
@ Register Alias @
list  .req R1    @
node  .req R2    @
@@@@@@@@@@@@@@@@@@
	push	{LR}

	cmp	list,#0
	beq	return		@if(list == nullptr) return

	bl	list_isEmpty
	cmp	R0,#1
	beq	return		@if(list.isEmpty()) return

	bl	list_getSize
	cmp	R0,#1
	beq	one_node	@if(list.size() == 1) one node in list
	bhi	multi_node	@if(list.size() != 1) multiple nodes in list

one_node:
	mov	R2,#0		@R2 = nullptr
	bl	list_setTail	@list = {1, head, nullptr}

	bl	list_getHead	@R0 = head's node
	bl	list_general_free

	bl	list_setHead	@list = {1, nullptr, nullptr}

	bl	list_decrSize	@list = {0, nullptr, nullptr}

	b	return

multi_node:


return:
	pop	{LR}
	bx	LR
.end
	
