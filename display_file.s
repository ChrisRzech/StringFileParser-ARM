@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Reads a file and outputs it @
@=================@@@@@@@@@@@@@
@ Pre-condition   @
@ R1: File string @
@=================@
@ Post-condition  @
@ R1: --          @
@@@@@@@@@@@@@@@@@@@
.global display_file
display_file:
	push	{R0-R2,LR}

	mov	R2,#00		@read only flag
	bl	file_open	@R0 = file handle

loop:
	bl	file_readLine

	cmp	R2,#1
	beq	return		@if(R2 == 1) reached EOF

	bl	string_print
	bl	v_endl
	bl	string_free	@free string after using it
	b	loop

return:
	bl	file_close
	pop	{R0-R2,LR}
	bx	LR
.end

