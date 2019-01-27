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
	
	call read
	lea dx,msg
	mov ah,9
	int 21h
	lea si,str1
	lea di,str2
	cld
	xor cx,cx
	mov cx,bx
loop_:
	movsb
	loop loop_
	call outt
	
mov ah,4ch
int 21h
main endp
read proc
	lea di,str1
	push ax
	push di
	cld
	xor bx,bx
	mov ah,1
	int 21h
while_:
	cmp al,0dh
	je end_
	stosb
	inc bx
	int 21h
	jmp while_
end_:	
	pop di
	pop ax
	ret
read endp

outt proc

	lea si,str2
	push ax
	push si
	push dx
	push bx
	push cx
	mov cx,bx
	mov ah,2
top:	
	lodsb
	mov dl,al
	int 21h
	loop top
	
	pop cx
	pop bx
	pop dx
	pop si
	pop ax
	
	ret
outt endp	
	

end main	