.model small
.stack 100h
.data
msg db 0dh,0ah,'reverse:$'
.code
main proc
	mov ax,@data
	mov ds,ax
	mov cx,0
	mov ah,1
while_:	
	int 21h
	cmp al,0dh
	je end_
	push ax
	inc cx
	jmp while_
	
end_:
	lea dx,msg
	mov ah,9
	int 21h
top:	
	pop dx
	mov ah,2
	int 21h
	loop top
mov ah,4ch
int 21h
main endp 
end main	