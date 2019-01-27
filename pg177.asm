.model small
.stack 100h
.data
var dw 0
var1 dw 0
msg db 0dh,0ah,'1st num:$'
msg1 db 0dh,0ah,'2nd num:$'
msg2 db 0dh,0ah,'.$'
.code
main proc
	mov ax,@data
	mov ds,ax
	lea dx,msg
	mov ah,9
	int 21h

	call input
	mov var,bx
	
	lea dx,msg1
	mov ah,9
	int 21h
	call input
	mov cx,bx
	lea dx,msg2
	mov ah,9
	int 21h

top:	mov ax,10
	mul var
	cwd
	div bx
	mov var1 ,dx
	mov dx,ax
	add dx,48
	mov ah,2
	int 21h
	mov dx,var1
	mov var,dx
	loop top
mov ah,4ch
int 21h
main endp

input proc
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
	ret

input endp
end main