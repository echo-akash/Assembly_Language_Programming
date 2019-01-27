.model small
.stack 100H
.data
	
.code
main proc		
	mov al,5
	mov bl,3
	
	call addition
	add dl,'0'
	mov ah,2
	int 21h	

	mov ah,4ch
	int 21h       ;dos exit
     main endp

  addition proc
	push ax
	push bx
	add al,bl
	mov dl,al
	pop ax
	pop bx
	ret
  addition endp
end main	