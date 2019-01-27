.model small
.stack 100h
.data 

	var db 10
	var1 db	?	
.code 
main proc

	mov bx,0
	mov cx,0
top:
	mov ah,1
	int 21h
	cmp al,0dh
	je endtop
	
	mov ah,0
	sub ax,48
	push ax
	mov ax,10
	mul bx
	pop bx
	add bx,ax
	jmp top

endtop:
	mov dl,0Ah
	mov ah,2
	int 21h       ;new line 
	
	mov ax,bx

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
	