@@@@@@@@@@@@@@@@@@@@@@@
@ Deletes the node at @
@ the end of the list @
@================@@@@@@
@ Pre-condition  @
@ R1: List       @
@================@
@ Post-condition @
@ R1: --         @
@@@@@@@@@@@@@@@@@@
.global list_deleteLast
list_deleteLast:
@@@@@@@@@@@@@@@@@@
@ Register Alias @
list  .req R1    @
prev  .req R3    @
curr  .req R4    @
@@@@@@@@@@@@@@@@@@
	push	{R0-R4,LR}

	cmp	list,#0
	beq	return			@if(list == nullptr) return

	bl	list_isEmpty
	cmp	R0,#1
	beq	return			@if(list.isEmpty()) return

	bl	list_getSize
	cmp	R0,#1
	beq	one_node		@if(list.size() == 1) one node in list
	bhi	multi_node		@if(list.size() != 1) multiple nodes in list

one_node:
	mov	R2,#0			@R2 = nullptr
	bl	list_setTail		@list = {1, head, nullptr}

	bl	list_getHead		@R0 = head's node
	bl	list_general_free

	bl	list_setHead		@list = {1, nullptr, nullptr}

	bl	list_decrSize		@list = {0, nullptr, nullptr}

	b	return

multi_node:
	bl	list_decrSize
	bl	list_getHead
	mov	prev,R0			@prev = head's node
	mov	R1,R0
	bl	node_getNext
	mov	curr,R0			@curr = head->next

loop:
	mov	R1,curr
	bl	node_getNext
	cmp	R0,#0
	beq	found			@if(curr->next == nullptr) found

	mov	R1,prev
	bl	node_getNext
	mov	prev,R0			@prev = prev->next

	mov	R1,curr
	bl	node_getNext
	mov	curr,R0			@curr = curr->next

	b	loop

found:
	mov	R2,#0
	mov	R1,prev
	bl	node_setNext	@prev->next = nullptr

	mov	R1,curr
	bl	list_general_free @delete curr

	b	return

return:
	pop	{R0-R4,LR}
	bx	LR
.end
	
