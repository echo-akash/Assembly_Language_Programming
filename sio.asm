.model small
.stack 100h
.data


str2 db 20 dup(?)
msg db 0dh,0ah,'$'
.code
 main proc
	mov ax, @data
	mov ds,ax
	mov es,ax
	xor cx,cx
	lea di,str2
	cld
	mov ah,1
	int 21h
top:
	
	cmp al,0dh
	je end_
	inc cx
	stosb
	int 21h
	jmp top
end_:
	lea dx,msg
	mov ah,9
	int 21h
	mov dx,cx
	add dx,48
	mov ah,2
	int 21h
	lea si,str2
	
top1:
	lodsb
	mov dl,al
	mov ah,2
	int 21h
	loop top1
	
	mov ah,4ch
	int 21h

 main endp
end main