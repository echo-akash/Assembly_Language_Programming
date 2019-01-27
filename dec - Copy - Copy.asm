.model small
.stack 100h
.data
.code

main proc

	mov bx,0

top:
	mov ah,1
	int 21h
	cmp al,0dh
	je end_top
	
	mov ah,0
	sub ax,0
	sub ax,48
	push ax
	mov ax,10
	mul bx
	pop bx
	add bx,ax
	jmp top

end_top:
	mov ah,4ch
	int 21h

main endp
end main
	
