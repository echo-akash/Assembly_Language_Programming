.model small
.stack 100h
.data
oddmsg db 0dh,0ah,'odd$'
evenmsg db 0dh,0ah,'even$'
.code
main proc
	mov ax,@data
	mov ds,ax
	
	xor bx,bx
	mov ah,1
while_:	
	int 21h
	cmp al,0dh
	je end_
	sub al,48
	shl bl,1
	or bl,al
	jmp while_
end_:
	shr bl,1
	jc odd_
	lea dx,evenmsg
	mov ah,9
	int 21h
	jmp exit_
odd_:
	lea dx,oddmsg
	mov ah,9
	int 21h
exit_:	
mov ah,4ch
int 21h
main endp
end main	