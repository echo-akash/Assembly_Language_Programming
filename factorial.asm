.model small
.stack 100h
.data
msg db 0dh,0ah,'FACTORIAL:$'
var dw '?'
.code
main proc
	mov ax,@data
	mov ds,ax
	
	mov var,0
	mov ah,1
	int 21h
	
	
	call factorial

	lea dx,msg
	mov ah,9
	int 21h
	xor cx,cx
	mov ax,var
	mov bx,10
outt_:
	cwd
	div bx
	push dx
	inc cx
	cmp ax,0
	je end_
	jmp outt_
end_:
	pop dx
	add dl,48
	mov ah,2
	int 21h
	loop end_
mov ah,4ch
int 21h
main endp 

factorial proc
	
	mov cl,al
	mov ch,0
	mov ax,1
top:
	mul cx
	loop top
	mov var,ax
ret
factorial endp

end main	
	
	
	