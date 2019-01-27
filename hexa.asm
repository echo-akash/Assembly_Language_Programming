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
	cmp al,0dh
	je end_while
	cmp al,39h
	jg letter
	and al,0fh
	jmp shift
	
letter:
	sub al,37h

shift:
	shl bx,cl
	or bl,al
	
	int 21h
	jmp while_
	
end_while:

	mov ah,2
	mov cx,16
mouri:
	rol bx,1
	jnc zero
	jc one
zero:
	mov dl,'0'
	int 21h
	jmp repeat
one:
	mov dl,'1'
	int 21h
	jmp repeat
	
repeat:
	loop mouri
	

exit:
	mov ah,4ch
	int 21h
	
main endp
end main