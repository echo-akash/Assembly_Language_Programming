.model small
.stack 100h
.data
str1 db 10 dup (?)
str2 db 10 dup (?)
msg db 0dh,0ah,'$'
.code
main proc
	mov ax,@data
	mov ds,ax
	mov es,ax
	xor cx,cx
	lea di,str1
	cld
	mov ah,1
top:	int 21h
	cmp al,0dh
	je end_
	stosb
	inc cx
	jmp top
end_:
	mov bx,cx
	lea dx,msg
	mov ah,9
	int 21h
	
	lea si,str1
	lea di,str2
	cld
level:
	movsb
	loop level
	
	lea si,str2
	mov cx,bx
	cld
toop:	lodsb
	mov dl,al
	mov ah,2
	int 21h
	loop toop

mov ah,4ch
int 21h
main endp
end main