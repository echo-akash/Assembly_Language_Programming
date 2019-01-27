.model small
.stack 100h
.data
var dw 3600
var1 dw 60
var2 dw 0
var3 dw 0
msg db 0dh,0ah,'$'
hmsg db ' hours$'
mmsg db ' minutes$' 
smsg db ' seconds$'
.code
main proc
	mov ax,@data
	mov ds,ax

	xor bx,bx
while_:
	mov ah,1
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

	mov ax,bx
	cwd
	div var
	mov bx,ax
	mov var2,dx
	call output
	lea dx,hmsg
	mov ah,9
	int 21h

	mov ax,var2
	cwd
	div var1
	mov bx,ax
	mov var3,dx
	call output
	lea dx,mmsg
	mov ah,9
	int 21h

	
	mov bx,var3
	call output
	lea dx,smsg
	mov ah,9
	int 21h
	

mov ah,4ch
int 21h
main endp

output proc
	mov ax,bx
	xor cx,cx
	mov bx,10
level:	cwd
	div bx
	push dx
	inc cx
	cmp ax,0
	je next
	jmp level
next:
	pop dx
	add dx,48
	mov ah,2
	int 21h
	loop next
	ret

output endp
end main
	