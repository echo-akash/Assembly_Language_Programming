.model small
.stack 100h
.data
.code
 main proc
	mov ah,1
	int 21h
	mov bh,0
	mov bl,al

	mov cx,16
top:
	rol bx,1
	jc out_1
	jnc out_0
	jmp end_if
out_1:
	mov dl,'1'
	mov ah,2
	int 21h
	jmp end_if
out_0:
	mov dl,'0'
	mov ah,2
	int 21h
end_if:
	loop top
	
	mov ah,4ch
	int 21h
	

 main endp
end main