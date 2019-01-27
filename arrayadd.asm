.model small
.stack 100h
.data
msg db '?'
msg1 db 0dh,0ah,'$'

.code
main proc
	mov ax,@data
	mov ds,ax
	mov si,0
	mov ah,1
top:	mov msg[si],al
	int 21h
	cmp al,0dh
	je toop
	inc si
	jmp top


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