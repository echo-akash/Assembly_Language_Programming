.model small
.stack 100h
.data
var dw 0
ymsg db 0dh,0ah,'prime$'
nmsg db 0dh,0ah,'not prime$'
.code
main proc
	mov ax,@data
	mov ds,ax

	xor bx,bx
while_:	mov ah,1
	int 21h
	cmp al,0dh
	je end_
	mov ah,0
	sub ax,48
	push ax
	mov ax,10
	mul bx
	pop bx
	add bx,ax
	jmp while_
end_:
	mov var,bx
again:	mov ax,var
	dec bx
	cmp bx,1
	je ynext_
	cwd
	div bx
	cmp dx,0
	je next_
	jmp again
next_:
	lea dx,nmsg
	mov ah,9
	int 21h
	jmp exit_
ynext_:
	lea dx,ymsg
	mov ah,9
	int 21h
exit_:
	mov ah,4ch
	int 21h
main endp
end main	