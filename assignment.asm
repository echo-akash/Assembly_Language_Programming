.model small
.stack 100h
.data
.code
 main proc

	xor bx,bx
	mov cl,4
	mov ah,1
	int 21h
while_:
	cmp al,0DH
	je end_while

	cmp al,39h
	jg letter

	sub al,48
	jmp shift
letter:
	sub al,55

shift: shl bx,cl

	or bl,al

	int 21h
	jmp while_

	mov cx,16
	mov ah,2
end_while:
top:
	rol bx,1
	cmp cf,1
	jmp output_0
	mov dl,'1'
	int 21h
output_0:
	mov dl,'0'
	int 21h
	jmp next
next:
	loop top
	
	mov ah,4ch
	int 21h

 main endp
end main