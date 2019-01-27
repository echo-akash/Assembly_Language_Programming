.model small
.stack 100h
.data
msg db '?'
msg1 db 0dh,0ah,'$'
msg2 db 'input:$'
.code
main proc
	mov ax,@data
	mov ds,ax
	mov si,0
	lea dx,msg2
	mov ah,9
	int 21h

	mov ah,1
top:	mov msg[si],al
	int 21h
	cmp al,0dh
	je top1
	inc si
	jmp top
top1:	
	lea dx,msg1
	mov ah,9
	int 21h
	
toop:	mov dl,msg[si]
	mov ah,2
	int 21h
	dec si
	cmp si,0
	je exit
	jmp toop
exit:	mov ah,4ch
	int 21h
main endp
end main