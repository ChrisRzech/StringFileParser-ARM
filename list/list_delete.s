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
node  .req R2    @
index .req R3    @
@@@@@@@@@@@@@@@@@@
	push	{LR}

	cmp	list,#0
	beq	return

	bl	list_getSize	@R0 = list.size()

	cmp	index,R0
	bhs	return		@if(index >= list.size()) return

return:
	pop	{LR}
	bx	LR
.end

