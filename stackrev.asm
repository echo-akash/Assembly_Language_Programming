.model small
.stack 100h
.data
.code
main proc
	mov ax,@data
	mov ds,ax
	xor cx,cx
in_:	mov ah,1
	int 21h
	cmp al,0dh
	je end_
	mov ah,0
	push ax
	inc cx
	jmp in_
end_:
	pop dx
	mov ah,2
	int 21h
	loop end_
mov ah,4ch
int 21h
main endp
end main