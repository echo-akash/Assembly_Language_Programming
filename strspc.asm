.model small
.stack 100h
.data
msg db 0dh,0ah,'$'
str1 db 20 dup(?)
.code
main proc
	mov ax,@data
	mov ds,ax
	mov es,ax
	xor bx,bx
	lea di,str1
	cld
input:	mov ah,1
	int 21h
	cmp al,0dh
	je end_
	cmp al,8h
	je next
	stosb
	inc bx
	jmp input
next:
	dec di
	dec bx
	jmp input
end_:
	mov dx,bx
	add dx,48
	mov ah,2
	int 21h
mov ah,4ch
int 21h
main endp
end main