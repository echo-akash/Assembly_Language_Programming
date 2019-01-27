.model small
.stack 100h
.data
var dw 0
a dw 10 dup(0)
msg db 0dh,0ah,'$'
.code
main proc
	mov ax,@data
	mov ds,ax
	xor cx,cx
	mov si,0 

in_:	xor bx,bx
while_:	mov ah,1
	int 21h
	cmp al,0dh
	je end_
	cmp  al,' '
	je next_
	mov ah,0
	sub ax,48
	push ax
	mov ax,10
	mul bx
	pop bx
	add bx,ax
	jmp while_
next_:
	mov a[si],bx
	inc cx
	add si,2
	jmp in_
end_:
	mov a[si],bx
	inc cx

	lea dx,msg
	mov ah,9
	int 21h

	mov si,0
top:	mov ax,a[si]
	cmp ax,var
	jg next
level:	add si,2
	loop top
	jmp out_
next:
	mov var,ax
	jmp level
out_:
	mov ax,var
	mov bx,10
toop:	cwd
	div bx
	push dx
	inc cx
	cmp ax,0
	jne toop
again:
	pop dx
	add dx,48
	mov ah,2
	int 21h
	loop again
mov ah,4ch
int 21h
main endp
end main