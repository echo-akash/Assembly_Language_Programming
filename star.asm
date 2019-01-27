.model small
.stack 100h
.data
	var db '?'
	msg db 'Enter a number:$'

.code

main proc

	mov ax,@data
	mov ds,ax

	lea dx,msg
	mov ah,9
	int 21h
	
	mov ah,1
	int 21h
	

	sub al,48
	mov cl,al
	mov ch,0

	
	mov ah,2	;newline
	mov dl,0dh
	int 21h
	mov dl,0ah
	int 21h

	mov var,1

top:
	mov bl,0
star:
	mov ah,2
	mov dl,'*'
	int 21h
	inc bl
	cmp bl,var

	jne star
	
	add var,1

	mov ah,2	;newline
	mov dl,0dh
	int 21h
	mov dl,0ah
	int 21h

	loop top

mov ah,4ch
int 21h

main endp
end main

	