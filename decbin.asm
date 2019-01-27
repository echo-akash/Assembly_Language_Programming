.model small
.stack 100h
.data
msg db 0dh,0ah,'$'
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
	lea dx,msg
	mov ah,9
	int 21h

	mov cx,16
top:	shl bx,1
	jc top1
	mov dl,'0'
	jmp out_
top1:
	mov dl,'1'
out_:
	mov ah,2
	int 21h
	loop top
mov ah,4ch
int 21h
main endp
end main