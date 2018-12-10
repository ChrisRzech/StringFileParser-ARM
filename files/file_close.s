@@@@@@@@@@@@@@@@@@@
@ Closes a file   @
@ associated with @
@ a file handle   @
@=================@
@ Pre-condition   @
@ R0: File handle @
@=================@
@ Post-condition  @
@ R0: --          @
@@@@@@@@@@@@@@@@@@@
.global file_close
file_close:
	push	{R7}

	mov	R7,#6
	svc	0

	pop	{R7}
	bx	LR
.end

