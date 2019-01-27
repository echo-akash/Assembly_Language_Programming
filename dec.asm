.model small
.stack 100h
.data
var dw '?'
.code

main proc
	xor dx,dx
	xor cx,cx
	mov var,0
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
	mov 

exit:

	mov ah,4ch
	int 21h

main endp
end main
	
