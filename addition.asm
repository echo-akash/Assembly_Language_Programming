.model small
.stack 100h
.data
.code

main proc
	mov al,2
	mov bl,3
	call addition
	add dl,'0'
	mov ah,2
	int 21h
mov ah,4ch
int 21h


main endp


addition proc
	push ax
	push bx
	add al,bl
	mov dl,al
	pop ax
	pop bx
	RET
addition endp
end main	