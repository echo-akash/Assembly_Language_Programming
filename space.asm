.model small
.stack 100h
.data
msg db 0dh,0ah,'$'
str1 db 10 dup(?)
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
	cmp al,8h
	je toop
	stosb
	inc bx
	jmp top
toop:
	dec di
	dec bx
	jmp top
end_:lea dx,msg
	mov ah,9
	int 21h
	mov cx,bx
	lea si,str1
top1:	lodsb
	mov dl,al
	mov ah,2
	int 21h
	loop top1
	
		mov ah,4ch 
		int 21h
main endp 
end main

