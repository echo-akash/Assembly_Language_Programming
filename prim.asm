.model small
.stack 100h
.data
	var db 0
	no db 'no$'
	yes db 'yes$'
.code
 main proc
	mov ax,@data
	mov ds,ax

	mov ah,1
	int 21h

top:
	and ax,000Fh
	push ax
	mov ax,10
	mul bx
	pop bx
	add bx,ax
	inc var
	mov ah,1
	int 21h
	cmp al,0dh
	jne top

	mov cx,bx
	dec cx
	mov ax,bx
prim_:	mov ax,bx
	cwd
	div cx
	cmp dx,0
	je no_
	dec cx
	cmp cx,1
	je yes_
	jmp prim_
no_:
	mov ah,9
	lea dx,no
	int 21h
	jmp exit
yes_:
	mov ah,9
	lea dx,yes
	int 21h
	
exit:
	mov ah,4ch
	int 21h
 main endp
end main