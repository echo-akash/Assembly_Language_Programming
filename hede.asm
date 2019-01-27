.model small
.stack 100h
.data
msg db 'enter a hexa digit:$'
msg1 db 0dh,0ah,'in decimal:$'
msg3 db 0dh,0ah,'wrong input$'
var db 0
.code
main proc
	mov ax,@data
	mov ds,ax
	lea dx,msg
	mov ah,9
	int 21h

	mov ah,1
	int 21h
	mov bl,al
	
	cmp bl,65
	jl wrong
	cmp bl,70
	jg wrong

	lea dx,msg1
	mov ah,9
	int 21h

	mov dl,'1'
	mov ah,2
	int 21h
	
	mov dl,bl
	sub dl,17
	mov ah,2
	int 21h
	jmp exit_
wrong:
	lea dx,msg3
	mov ah,9
	int 21h
	
exit_:	
mov ah,4ch
int 21h
main endp
end main