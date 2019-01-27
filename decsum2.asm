.model	small
.stack	100h
.data
	msg	db 	0dh,0ah,'Enter the decimal degit until press Enter :   $'
	msg1	db 	0dh,0ah,'The equivalent Hexadecimal is :  $'

.code
main	proc
	
	mov	ax , @data
	mov	ds  , ax

	lea	dx,  msg
	mov	ah , 9
	int 	21h

	push	bx
	push	cx
	push	dx

	xor	bx , bx
	xor	cx , cx
	mov	ah , 1
	int	21h

repeat:
	and	ax , 000fh
	push	ax
	pop	bx
	add	bx , ax
	
	mov	ah , 1
	int	21h

	cmp	al , 0dh
	jne	repeat


	lea	dx , msg1
	mov	ah , 9
	int 	21h
	
;;;;;;;;;;;;;;;;printing the hexadecimal equivalent;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;printing 	first part
	mov	ch , bh
	

	shr	ch , 1
	shr	ch , 1
	shr	ch , 1
	shr	ch , 1

	add	ch , 48d

	cmp	ch , '9'
	jle	cont6
	add	ch , 7d

cont6:
	mov	ah , 2
	mov	dl , ch
	int	21h

;;;;;;;;;;printing second part;;;;;;;;;;;;;;;;;
	mov	ch , bh

	shl	ch , 1
	shl	ch , 1
	shl	ch , 1
	shl	ch , 1

	shr	ch , 1
	shr	ch , 1
	shr	ch , 1
	shr	ch , 1
	
	add	ch , 48d
	
	cmp	ch , '9'
	jle	cont7
	add	ch , 7d

cont7:
	mov	ah , 2
	mov	dl , ch
	int	21h

	mov	ah , 2
	mov	dl , ch
	int	21h

;;;;;;;;;;;;printing third part;;;;;;;;;;;;;;;;;;;
	mov	cl  , bl

	shr	cl , 1
	shr	cl , 1
	shr	cl , 1
	shr	cl , 1

	add	cl , 48d
	
	cmp	cl , '9'
	jle	cont8
	add	cl , 7d

cont8:
	mov	ah , 2
	mov	dl , cl
	int	21h

	mov	ah , 2
	mov	dl , cl
	int	21h

;;;;;;;;;;;;;;;printing 	last part;;;;;;;;;;;;;;;;;;;
	mov	cl  , bl
	
	shl	cl , 1
	shl	cl , 1
	shl	cl , 1
	shl	cl , 1

	shr	cl , 1
	shr	cl , 1
	shr	cl , 1
	shr	cl , 1
	
	add	cl , 48d

	cmp	cl , '9'
	jle	cont9
	add	cl , 7d

cont9:
	mov	ah , 2
	mov	dl , cl
	int	21h


	mov	ah , 2
	mov	dl , cl
	int	21h

	mov	ah , 4ch
	int	21h
	
main	endp
end 	main