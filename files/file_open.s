@@@@@@@@@@@@@@@@@@@@@@@@@
@ Opens a file and      @
@ returns a file handle @
@=================@@@@@@@
@ Pre-condition   @
@ R0: --          @
@ R1: File string @
@ R2: File flags  @
@=================@
@ Post-condition  @
@ R0: File handle @
@ R1: --          @
@ R2: --          @
@@@@@@@@@@@@@@@@@@@
.global file_open
file_open:
	push	{R1,R2,R7}

	mov	R0,R1		@R0 = file name
	mov	R1,R2		@R1 = how will the file be used
	mov	R2,#0666	@Allow access to all groups
	mov	R7,#5		@R5 = code to open file
	svc	0

	pop	{R1,R2,R7}
	bx	LR
.end

