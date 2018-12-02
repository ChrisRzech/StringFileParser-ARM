@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Creates a node at the start @
@ of the linked list          @
@=================@@@@@@@@@@@@@
@ Pre-condition   @
@ R1: Linked list @
@ R2: Data        @
@=================@
@ Post-condition  @
@ R1: --          @
@ R2: --          @
@@@@@@@@@@@@@@@@@@@
.global list_insertFirst
list_insertFirst:
@@@@@@@@@@@@@@@@@@
@ Register Alias @
list .req R1     @
node .req R2     @
@@@@@@@@@@@@@@@@@@
	push	{R0-R2,LR}

	cmp	list,#0
	beq	return		@if(list == nullptr) return

	push	{list}		@save list

	bl	node_create	@R1 = node
	bl	node_setData	@node = {data, nullptr}
	mov	node,R1

	pop	{list}		@load list

	bl	list_isEmpty
	bl	list_incrSize
	cmp	R0,#1
	beq	empty		@if(list.isEmpty) empty
	bne	not_empty	@if(!list.isEmpty) not empty

empty:
	bl	list_setHead	@list = {0, node, nullptr}
	bl	list_setTail	@list = {0, node, node}
	b	return

not_empty:
	push	{list}		@save list

	bl	list_getHead
	mov	R1,node		@R1 = node
	mov	R2,R0		@R2 = head
	bl	node_setNext	@node->next = head
	mov	R2,R1		@R2 = node

	pop	{list}		@load list

	bl	list_setHead	@head = node
	b	return

return:
	pop	{R0-R2,LR}
	bx	LR
.end

