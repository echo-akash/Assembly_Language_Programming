.model small
.stack 100h
.data
var dw '?'
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
	mov var,0
	lea di,str2
	cld
	mov ah,1
top:	int 21h
	
	cmp al,0dh
	je end_
	stosb
	inc bx
	jmp top
end_:	;mov bx,cx
	;mov var,cx
	
	
	
	lea si,str2
	dec bx
	add si,bx
	inc bx
	lea di, str1
	std
	mov cx,bx
top1:	movsb
	add di,2
	loop top1
	
	lea dx,msg
	mov ah,9
	int 21h
	
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