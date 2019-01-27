.model small
.stack 100h
.data
str1 db 10 dup(?)
str2 db 10 dup(?)
msg db 0dh,0ah,'$'
.code
main proc
	mov ax,@data
	mov ds,ax
	mov es,ax
	
	lea di,str1
	cld
	xor bx,bx
	mov ah,1
top:	
	int 21h
	cmp al,0dh
	je end_
	stosb
	inc bx
	jmp top
end_:
	lea dx,msg
	mov ah,9
	int 21h
	mov cx,bx
	lea si,str1
	dec bx
	add si,bx
	inc bx
	lea di,str2
	std
level:
	movsb
	add di,2
	loop level
	
	lea si,str2
	cld
	mov cx,bx
	mov ah,2
load:	
	lodsb
	mov dl,al
	int 21h
	loop load
	
mov ah,4ch
int 21h
main endp
end main	