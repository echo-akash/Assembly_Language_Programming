.model small
.stack 100h
.data
str1 db 50 dup(?)
msg db 0dh,0ah,'$'
var dw 0
.code
main proc
	mov ax,@data
	mov ds,ax
	mov es,ax
	xor bx,bx

frst:	xor cx,cx
	lea di,str1
	add di,bx
	cld
	mov ah,1
in_:	int 21h
	stosb
	inc bx
	inc cx
	
	cmp al,0dh
	je end_
	cmp al,' '
	je next
	
	jmp in_
next:
	
	call reverse
	JMP frst
end_:
	call reverse

	lea dx,msg
	mov ah,9
	int 21h

	lea si,str1
	cld
again:	lodsb
	mov dl,al
	mov ah,2
	int 21h
	dec bx
	cmp bx,0
	jne again

mov ah,4ch
int 21h
main endp
reverse proc
	mov var,bx
	sub var,cx
	
	dec cx
	shr cx,1
	sub di,2
	lea si,str1
	add si,var
	cld
top:	lodsb
	
	xchg al,[di]
	dec si
	mov [si],al
	inc si
	dec di
	loop top
	ret
reverse endp
end main

