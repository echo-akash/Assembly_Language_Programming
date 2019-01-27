.model small
.stack 100h
.data
var db '?'
.code
 main proc

	mov ax,@data
	mov ds,ax
	
	xor bx,bx
	mov ah,1
	int 21h
	mov var,4
while_:
	cmp al,0dh
	je end_while
	and al,0fh
	shl bx,1
	or bl,al
	int 21h
	jmp while_
end_while:

	
	mov cl,4
top:
	mov dl,bh
	shr dl,cl
	cmp dl,9
	jg letter
	add dl,48
	jmp next
letter:
	add dl,55
next:	
	
	mov ah,2
	int 21h
	rol bx,cl
	dec var
	cmp var,0
	jne top
	mov ah,4ch
	int 21h
 main endp
end main