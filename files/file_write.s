@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Writes a string to a file @
@=================@@@@@@@@@@@
@ Pre-condition   @
@ R0: File handle @
@ R1: String      @
@=================@
@ Post-condition  @
@ R0: --          @
@ R1: --          @
@@@@@@@@@@@@@@@@@@@
.global file_write
file_write:
@@@@@@@@@@@@@@@@@@
@ Register Alias @
file   .req R0   @
string .req R1   @
@@@@@@@@@@@@@@@@@@
	push	{R0-R2,R7,LR}

	push	{file}		@save file
	bl	string_length
	mov	R2,R0

	mov	R7,#4
	pop	{file}		@load file
	svc	0

	pop	{R0-R2,R7,LR}
	bx	LR
.end

