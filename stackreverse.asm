.model small
.stack 100h
.data
msg db 0dh,0ah,'$'
.code
main proc
	mov ax,@data
	mov ds,ax

	mov ah,1
	int 21h
	mov cx,0
WHILE_:	cmp al,0dh
	je ENDWHILE_
	push ax
	inc cx
	int 21h
	jmp WHILE_

	

ENDWHILE_:
	mov ah,9
	lea dx,msg
	int 21h

	pop dx
	mov ah,2
	int 21h
	loop ENDWHILE_

mov ah,4ch
int 21h

main endp
end main