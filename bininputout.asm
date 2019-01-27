.model small
.stack 100h
.data
.code
	
main proc
	xor bx,bx
	mov ah,1
	int 21h
WHILE_:cmp al,0dh
	je ENDWHILE_
	and al,0fh
	shl bx,1
	or bl,al
	int 21h
	jmp WHILE_
ENDWHILE_:
	mov cx,16
TOP:
	rol bx,1
	jc TOP1
	jnc TOP0
	
TOP1:	mov ah,2
	mov dl,'1'
	int 21h
	jmp NEXT

TOP0:	mov ah,2
	mov dl,'0'
	int 21h
	jmp NEXT
NEXT:	loop TOP

mov ah,4ch
int 21h

main endp
end main

	