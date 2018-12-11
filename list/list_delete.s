@@@@@@@@@@@@@@@@@@@@@@@
@ Deletes the node of @
@ a list at a given   @
@ index               @
@=================@@@@@
@ Pre-condition   @
@ R1: List        @
@ R2: Index       @
@=================@
@ Post-condition  @
@ R1: --          @
@ R2: --          @
@@@@@@@@@@@@@@@@@@@
.global list_delete
list_delete:
@@@@@@@@@@@@@@@@@@
@ Register Alias @
list  .req R1    @
index .req R2    @
prev  .req R3    @
curr  .req R4    @
next  .req R5    @
@@@@@@@@@@@@@@@@@@
	push	{R0-R5,LR}

	cmp	list,#0
	beq	return

	bl	list_getSize		@R0 = list.size()

	cmp	R0,#0
	beq	return			@if(list.size() == 0) return

	cmp	index,R0
	bhs	return			@if(index >= list.size()) return

	cmp	R0,#1
	beq	delete_first		@if(list.size() == 1) delete first

	cmp	index,#0
	beq	delete_first		@if(index == 0) delete first
	
	sub	R0,#1
	cmp	index,R0
	beq	delete_last		@if(index  == list.size() - 1) delete last

	bl	list_decrSize		@decrease size by 1
	bl	list_getHead
	mov	prev,R0			@prev = head's node
	mov	R1,R0
	bl	node_getNext
	mov	curr,R0			@curr = head->next
	mov	R1,R0
	bl	node_getNext
	mov	next,R0			@next = head->next->next

loop:
	cmp	index,#1
	beq	found			@if(index == 1) node to delete found

	sub	index,#1

	mov	R1,prev
	bl	node_getNext
	mov	prev,R0			@prev = prev->next

	mov	R1,curr
	bl	node_getNext
	mov	curr,R0			@curr = curr->next

	mov	R1,next
	bl	node_getNext
	mov	next,R0			@next = next->next

	b	loop

found:
	mov	R1,prev
	mov	R2,next
	bl	node_setNext		@prev->next = next

	mov	R1,curr
	bl	list_general_free	@delete curr

	b	return

delete_first:
	bl	list_deleteFirst
	b	return

delete_last:
	bl	list_deleteLast
	b	return

return:
	pop	{R0-R5,LR}
	bx	LR
.end

