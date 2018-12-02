@@@@@@@@@@@@@@@@@@@@@@@@
@ Creates a node after @
@ a given index of the @
@ linked list          @
@=================@@@@@@
@ Pre-condition   @
@ R1: Linked list @
@ R2: Data        @
@ R3: Index       @
@=================@
@ Post-condition  @
@ R1: --          @
@ R2: --          @
@ R3: --          @
@@@@@@@@@@@@@@@@@@@
.global linkedlist_insert
linkedlist_insert:
@@@@@@@@@@@@@@@@@@
@ Register Alias @

@@@@@@@@@@@@@@@@@@
	push	{LR}
	pop	{LR}
	bx	LR
.end

