.model small
.stack 100h
.data
str1 db 20 dup(?)
str2 db 20 dup(?)
msg db 0dh,0ah,'$'
.code
main proc
	mov ax,@data
	mov ds,ax
	mov es,ax
	xor cx,cx
	xor bx,bx
	lea di,str2
	cld
	mov ah,1
	int 21h
top:	inc cx
	cmp al,0dh
	je end_
	stosb

	int 21h
	jmp top
end_:mov bx,cx
	lea dx,msg
	mov ah,9
	int 21h
	lea si,str2
	lea di, str1
top1:rep	movsb
	
	lea si, str1
	mov cx,bx
top2:	lodsb
	mov dl,al
	mov ah,2
	int 21h
	loop top2
	
	
		mov ah,4ch 
		int 21h
main endp 
end main