@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Reads a whole line from @
@ a file into a string.   @
@ Both windows and linux  @
@ file formats are        @
@ supported               @
@=================@@@@@@@@@
@ Pre-condition   @
@ R0: File handle @
@ R1: --          @
@=================@
@ Post-condition  @
@ R0: --          @
@ R1: String      @
@@@@@@@@@@@@@@@@@@@
.data
strBuf: .space 256

.text
.global file_readLine
file_readLine:
@@@@@@@@@@@@@@@@@@
@ Register Alias @
file     .req R0 @
char     .req R1 @
strBuf   .req R2 @
bufCount .req R3 @
@@@@@@@@@@@@@@@@@@
	push	{R1-R3,LR}

	ldr	strBuf,=strBuf

loop:
	push	{strBuf}		@save strBuf

	bl	file_readChar

	cmp	R2,#0
	beq	return			@if(!readChar) end of file reached

	pop	{strBuf}		@load strBuf

	cmp	char,#'\r'
	beq	return			@if(char == \r) line is finished

	cmp	char,#'\n'
	beq	return			@if(char == \n) line is finished

	cmp	bufCount,#255
	beq	return			@if(bufCount == 255) force finish

	strb	char,[strBuf],#1	@store char in buffer and offset ptr
	add	bufCount,#1

	b	loop

return:
	mov	R1,strBuf
	bl	string_copy
	mov	R1,R0

	pop	{R1-R3,LR}
	bx	LR
.end

