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
@ R2: Successful  @
@@@@@@@@@@@@@@@@@@@
.data
char: .space 2

.text
.global file_readChar
file_readChar:
	push	{R7}

	ldr	R1,=char	@place to store char
	mov	R2,#1		@how many bytes to read
	mov	R7,#3		@code to read file
	svc	0

	mov	R2,R0		@R2 = bytes read (1 or 0)

	ldrb	R1,[R1]		@load character from address
	
	pop	{R7}
	bx	LR
.end

