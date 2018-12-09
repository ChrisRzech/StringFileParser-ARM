@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Reads a character from     @
@ a file given a file handle @
@=================@@@@@@@@@@@@
@ Pre-condition   @
@ R0: File handle @
@ R1: --          @
@ R2: --          @
@=================@
@ Post-condition  @
@ R0: --          @
@ R1: Character   @
@ R2: End of file @
@@@@@@@@@@@@@@@@@@@
.data
char: .space 1

.text
.global file_readChar
file_readChar:
	push	{R0,R7}

	ldr	R1,=char	@place to store char
	mov	R2,#1		@how many bytes to read
	mov	R7,#3		@code to read file
	svc	0

	cmp	R0,#0
	beq	end_of_file

	mov	R2,#0		@if(bytesRead != 0) not end of file

	ldrb	R1,[R1]		@load character from address
	b	return

end_of_file:
	mov	R1,#0		@make the character returned null
	mov	R2,#1		@return true for end of file
	b	return

return:
	pop	{R0,R7}
	bx	LR
.end

