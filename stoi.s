@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Converts a string to an integer @
@===================@@@@@@@@@@@@@@@
@ Pre-Condition:    @
@ R1: Ptr to string @
@-------------------@
@ Post-Condition:   @
@ R0: Integer       @
@ R1: No Change     @
@-------------------@@@@@@@@@@@@
@ If value can't be converted, @
@ carry flag is set            @
@------------------------------@
@ If value is too big for 32   @
@ bits, overflow flag is set   @
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.global	stoi
stoi:
@@@@@@@@@@@@@@@@@@@
@ Register Alias: @
@=================@
int     .req R0   @
strPtr  .req R1   @
char    .req R2   @
negBool	.req R3   @
temp    .req R8   @
temp2   .req R9   @
@@@@@@@@@@@@@@@@@@@
	push	{R1-R12,LR}


@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ load in the first character @
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	mov	int,#0		@clear out the register
	ldr	char,[strPtr]	@load a char from the ptr
	and	char,#0xFF	@get first byte of string


@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ check to see if its a negative @
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	cmp	char,#45	@check if the first char is a '-'
	movne	negBool,#0	@if it isn't, it's positive
	bne	convertchar

	mov	negBool,#1	@if it is, it's a negative
	add	strPtr,#1	@and move the ptr 1 byte over
	ldr	char,[strPtr]	@load another character since the
				@other one was a '-'
	and	char,#0xFF	



convertchar:
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ check for null terminator '\0' and '\n' @
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	cmp	char,#0
	beq	goodexit
	cmp	char,#0xA
	beq	goodexit


@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ make space for new digit @
@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	mov	temp,#0		@temp is count
	mov	temp2,int	@temp2 is how much to add each time
mul10:	adds	int,temp2	@int * 2
	bvs	regoverflow
	add	temp,#1
	cmp	temp,#9
	blt	mul10


@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ check if char is a valid number @
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	subs	char,#48	@ASCII(0)=48
	blt	invalidchar
	cmp	char,#9		@0-9 are valid 
	bgt	invalidchar


@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ If it made it here:                   @
@ 1) a valid number is stored in 'char' @
@ 2) there is room in the register      @
@ 3) 'strPtr' is now at the next char   @
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	cmp	negBool,#0	@check if we need to add or subtract
				@the valid number into the accumulator
	bne	sub		@if(negBool != 0)
	adds	int,char	@    adds(int,char);
	b	cont		@else if(negBool == 0)
sub:				@    subs(int,char);
	subs	int,char	@
cont:				@
	bvs	regoverflow	@bvs(regoverflow);


@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ loads a char into a register @
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	ldr	char,[strPtr,#1]!@*(++strPtr)
	and	char,#0xFF	@mask off all bytes except first
	b	convertchar


goodexit:
@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ if no errors were found @
@ we clear all the flags  @
@@@@@@@@@@@@@@@@@@@@@@@@@@@
	mov	temp,#2
	cmp	temp,#0		@Unset Flags: V
	asrs	temp,#1		@Unset Flags: C
	b	exit
	

invalidchar:
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ if an character is not a number          @
@ we set the carry flag to tell the caller @
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	mov	temp,#0x80000001
	lsls	temp,#1		@Flags Set: C

	mov	int,#0
	b	exit


regoverflow:
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ if there is no more room to store the number @
@ we set the overflow flag to tell the caller  @
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	mov	temp,#0x80000000
	subs	temp,#1		@Flags Set: C V
	mov	temp,#2
	asrs	temp,#1		@Flags Set: V

	mov	int,#0
	b	exit


exit:
@@@@@@@@@@@@@@@@@@@@
@ Register Unalias @
@==================@
.unreq int         @
.unreq strPtr      @
.unreq char	   @
.unreq negBool     @
.unreq temp        @
@@@@@@@@@@@@@@@@@@@@
	pop	{R1-R12,LR}
	bx	LR
.end

