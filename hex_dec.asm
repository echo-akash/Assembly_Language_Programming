.model small
.stack 100h
.data 
	msg1 db 0dh,0ah,'Enter some hexa-decimal charter : $'
	msg2 db 0dh,0ah,'The output of the characters in dec : $'
.code

main proc

	mov ax , @data
	mov ds , ax
	
	lea dx , msg1
	mov ah , 9
	int 21h
	
	mov bx , 0
	mov cl , 4
	mov dx , 0

input:
	mov ah , 1
	int 21h
		
	cmp al , 0dh
	je hex_dec
		
	cmp ax ,39h
	jg letter
		
	and ax , 0Fh
	jmp shift_

letter:
	sub ax , 37h
shift_:		
	shl bx , cl
	or bl , al

	jmp input

hex_dec:

	lea dx , msg2
	mov ah , 9
	int 21h
	 
	mov ah , 0
	mov bh,0
	mov ax,bx	
	mov cx,0
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
	
	mov ah,4ch
	int 21h

main endp
end main		
	