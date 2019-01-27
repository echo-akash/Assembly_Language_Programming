.model small
.stack 100h
.data
A db 1,9,6,4
.code
 main proc

	mov ax,@data
	mov ds,ax
	mov bl,0
	mov cx,4
	lea si,A
top:
	mov al,[si]
	cmp al,bl
	jg next
	jmp level
next:
	mov bl,al

level:
	inc si
	loop top

	mov ah,2
	
	add bl,48
	mov dl,bl
	int 21h
	mov ah,4ch
	int 21h	
 main endp
end main