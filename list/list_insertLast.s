@@@@@@@@@@@@@@@@@@@@@@@
@ Creates a node at   @
@ the end of the list @
@================@@@@@@
@ Pre-condition  @
@ R1: List       @
@ R2: Data       @
@================@
@ Post-condition @
@ R1: --         @
@ R2: --         @
@@@@@@@@@@@@@@@@@@
.global list_insertLast
list_insertLast:
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

	bl	list_getTail
	mov	R1,R0
	bl	node_setNext	@tail->next = node

	pop	{list}		@load list
	bl	list_setTail	@tail = node
	b	return

return:
	pop	{R0-R2,LR}
	bx	LR
.end

