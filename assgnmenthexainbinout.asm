.model small
.stack 100h
.data
msg db 0dh,0ah,'$'
.code
main proc
	MOV ax,@data
	mov ds,ax

	xor bx,bx
	mov cl,4
	mov ah,1
	int 21h
	
WHILE_:	cmp al,0dh
	je ENDWHILE_
	cmp al,'9'
	JG LETTER
	and al,0fh
	jmp SHIFT
LETTER:	sub al,55
SHIFT:	shl bx,cl	
	or bl,al
	int 21h
	jmp WHILE_
ENDWHILE_:
	mov ah,9
	lea dx,msg
	int 21h

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