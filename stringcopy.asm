.model small
.stack 100h
.data

msg db 0dh,0ah,'$'
st1 db 20 dup(?)
st2 db 20 dup(?)

.code
 main proc
	mov ax,@data
	mov ds,ax
	mov es,ax
	xor bx,bx
	xor cx,cx
	lea di,st1
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
	mov bx,cx
	lea dx,msg
	mov ah,9
	int 21h
	lea si,st1
	lea di,st2
	rep movsb
	lea si,st2
	mov cx,bx
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