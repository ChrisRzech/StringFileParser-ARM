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
@ R2: --          @
@=================@
@ Post-condition  @
@ R0: --          @
@ R1: String      @
@ R2: End of file @
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
strBuf   .req R3 @
bufCount .req R4 @
null     .req R5 @
@@@@@@@@@@@@@@@@@@
	push	{R0,R3-R5,LR}

	ldr	strBuf,=strBuf
	mov	null,#0			@contant null

loop:
	push	{strBuf}		@save strBuf

	bl	file_readChar

	cmp	R2,#1
	beq	end_of_file		@if(readChar.eof()) end of file reached

	pop	{strBuf}		@load strBuf

	cmp	char,#'\r'
	beq	carriage_found		@if(char == \r) line is finished

	cmp	char,#'\n'
	beq	end_line_found		@if(char == \n) line is finished

	cmp	bufCount,#255
	beq	end_line_found		@if(bufCount == 255) force finish

	strb	char,[strBuf],#1	@store char in buffer and offset ptr
	add	bufCount,#1

	b	loop


carriage_found:
	bl	file_readChar		@\r is always followed by a \n
	b	end_line_found

end_line_found:
	strb	null,[strBuf]		@store a null terminator to end string
	b	make_string

make_string:
	ldr	strBuf,=strBuf
	mov	R1,strBuf
	bl	string_copy		@create deep copy of string
	mov	R1,R0			@return it in R1
	b	return

end_of_file:
	pop	{strBuf}
	b	return

return:
	pop	{R0,R3-R5,LR}
	bx	LR
.end

