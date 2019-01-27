.model small
.stack 100h
.data
	msg db 'input:$'
.code

fact proc
top:	
	mul bx
	dec bx
	loop top
ret
fact endp

main proc
	mov ax,@data
	mov ds,ax
	
	lea dx,msg
	mov ah,9
	int 21h

	mov ah,1	;input
	int 21h
	
	
	sub al,48
	mov ah,0
		
	mov cl,al
	mov ch,0
	mov bx,ax

	mov ah,2	;newline
	mov dl,0dh
	int 21h
	mov dl,0ah
	int 21h

	mov ax,1
	
	call fact
	
		
	push ax
	push bx
	push cx
	push dx	

	mov bx,10d

repeat:
	mov dx,0
	div bx
	push dx
	inc cx
	or ax,ax
	jne repeat
	
	
	

output:
	

	pop dx
	add dx,48
	mov ah,2
	int 21h
	loop output
exit:	
	pop dx
	pop cx
	pop bx
	pop ax




	mov ah,4ch
	int 21h

main endp
end main 