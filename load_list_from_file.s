@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Loads a list from a file @
@=================@@@@@@@@@@
@ Pre-condition   @
@ R1: List        @
@ R2: File string @
@=================@
@ Post-condition  @
@ R1: --          @
@ R2: --          @
@@@@@@@@@@@@@@@@@@@
.global load_list_from_file
load_list_from_file:
	push	{R0-R2,LR}

	push	{R1}		@save list
	mov	R1,R2		@R1 = file to open
	mov	R2,#00		@read only flag
	bl	file_open	@R0 = file handle
	pop	{R1}		@load list

loop:
	push	{R1}		@save list
	bl	file_readLine

	cmp	R2,#1
	popeq	{R1}		@if(file.EOF) load list
	beq	loop_exit	@if(file.EOF) exit loop
	
	push	{R0}		@save file handle
	bl	string_copy	@R0 = string copy
	mov	R2,R0		@R2 = string copy
	pop	{R0}		@load file handle

	pop	{R1}		@load list
	bl	list_insertLast

	b	loop
loop_exit:

return:
	bl	file_close
	pop	{R0-R2,LR}
	bx	LR
.end

