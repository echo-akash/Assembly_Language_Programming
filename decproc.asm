.model small
.stack 100h
.data

.code

main proc

	call indec
	push ax
	
	mov dl,0Ah
	mov ah,2
	int 21h       ;new line
	pop ax 

	call outdec
	mov ah,4ch
	int 21h

main endp

indec proc

	push cx
	push dx

	mov bx,0
	mov cx,0

top:
	mov ah,1
	int 21h
	cmp al,0dh
	je endtop
	
	mov ah,0
	sub ax,48
	;and ax,000fh
	push ax
	mov ax,10
	mul bx
	pop bx
	add bx,ax
	
	jmp top


	
endtop:
	
	pop dx
	pop cx

	ret
indec endp

outdec proc


	push ax
	push bx
	push cx
	push dx
	
	mov ax,bx
	mov cx,0
	mov bx,10d

repeat:
	xor dx,dx
	div bx
	push dx
	inc cx
	or ax,ax
	jne repeat

	mov ah,2

print_loop:
	pop dx
	;or dl,30h
	add dx,48
	int 21h
	loop print_loop
	
	pop dx
	pop cx
	pop bx
	pop ax
	
	ret
outdec endp
end main