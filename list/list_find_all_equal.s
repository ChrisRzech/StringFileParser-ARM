@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Returns a list of all elements  @
@ equal to the value passed in.   @
@ If the type of the data is      @
@ something other than numbers,   @
@ pass in a function for the type @
@ that returns a bool             @
@==================@@@@@@@@@@@@@@@@
@ Pre-condition    @
@ R0: --           @
@ R1: List         @
@ R2: Data to find @
@ R3: Function     @
@==================@
@ Post-condition   @
@ R0: Element list @
@ R1: --           @
@ R2: --           @
@@@@@@@@@@@@@@@@@@@@
.global list_find_all_equal
list_find_all_equal:
@@@@@@@@@@@@@@@@@@
@ Register Alias @
newList .req R0  @
list    .req R1  @
node    .req R1  @
data    .req R1  @
search  .req R2  @
func    .req R3  @
@@@@@@@@@@@@@@@@@@
	push	{R1-R4,LR}

	cmp	list,#0
	beq	return		@if(list == nullptr) return

	bl	list_getHead	@R0 = head's node
	mov	R4,R0		@Move the head's node into R4
	bl	list_create	@R1 = new list
	mov	newList,R1	@Move the new list into R0
	mov	node,R4		@Move R4 to R1

loop:
	cmp	node,#0
	beq	return		@if(node == nullptr)

	push	{newList,node}	@save the new list and node
	bl	node_getData	@R0 = data
	mov	data,R0		@Move the data into R1

	add	LR,PC,#0	@LR = PC + 2 instructions
				@#0 because for whatever reason, it works
	bx	func		@function must take R1 and R2 as parameter

	cmp	R0,#1
	pop	{newList}	@load the new list
	bne	next_node	@if(!func) this data isn't what we want

	push	{search}	@save the search term
	mov	R2,data		@insertLast takes a data in R2
	mov	R1,newList	@insertLast takes a list in R1
	bl	list_insertLast	@if(func) insert the data into a list
	pop	{search}	@load the search term

next_node:
	pop	{node}
	bl	node_increment
	b	loop

return:
	pop	{R1-R4,LR}
	bx	LR



@@@@@@@@@@@@@@@@@@@@@@@@@
@ Default function used @
@ for comparing numbers @
@@@@@@@@@@@@@@@@@@@@@@@@@
number_equals:
	push	{LR}

	cmp	R1,R2
	moveq	R0,#1
	movne	R0,#0

	pop	{LR}
	bx	LR
.end

