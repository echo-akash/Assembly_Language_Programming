.model small
.stack 100h
.data

msg db 0dh,0ah,'$'
.code

main proc
	
	
	mov ax,@data
	mov ds,ax

	mov ah,1
	int 21h
	sub al,48
	mov cl,al
	mov ch,0
	mov bh,1
	
	cmp cl,0
	jle exit
	
star:	lea dx,msg
	mov ah,9
	int 21h	
	mov dl,'*'
	mov bl,bh
	mov ah,2

scnd:	int 21h
	dec bl
	cmp bl,0
	jne scnd
	inc bh
	loop star
	
exit:	mov ah,4ch
	int 21h

main endp
end main