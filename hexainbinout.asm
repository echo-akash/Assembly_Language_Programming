.model small
.stack 100h
.data
msg db 0dh,0ah,'$'
var db '?'
.code
main proc
	mov ax,@data
	mov ds,ax
	xor bx,bx
	mov cl,4
	mov ah,1
	int 21h
while_:
	cmp al,0dh
	je end_
	cmp al,'9'
	jg letter
	sub al,48
	jmp shift
letter:
	sub al,55
shift:
	shl bx,cl
	or bl,al
	int 21h
	jmp while_
	
	end_:
	mov ah,9
	lea dx,msg
	int 21h
output:	
	mov cx,16
TOP:
	rol bx,1
	jc top1
	jnc top0
top0:
	mov dl,'0'
	mov ah,2
	int 21h
	jmp level
top1:
	mov dl,'1'
	mov ah,2
	int 21h
level:
	loop TOP
	
	mov ah,4ch
	int 21h
	main endp
	end main