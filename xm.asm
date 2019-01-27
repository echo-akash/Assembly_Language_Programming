.model small
.stack 100h
.data
var dw 0
var1 dw 0
msg db 0dh,0ah,'$'
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

abar:	mov var,bx
top:	mov ax,var
	cwd
	dec bx
	cmp bx,1
	je level
	div bx
	cmp dx,0
	je next
	jmp top
next:
	call output
	mov dl,','
	mov ah,2
	int 21h
	jmp abar
level:
	
	call output
mov ah,4ch
int 21h
main endp
output proc

	xor cx,cx
	mov var1,10
again:	cwd
	div var1
	push dx
	inc cx
	cmp ax,0
	jne again
out_:
	pop dx
	add dx,48
	mov ah,2
	int 21h
	loop out_
	ret

output endp

end main