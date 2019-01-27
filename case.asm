.model small
.stack 100h
.data
msg db 'abcd$'
.code
main proc
	
	mov ax,@data
	mov ds,ax
	xor si,si
	mov cx,4
TOP:	cmp msg[si],' '
	je NEXT
	and msg[si],0dfh
NEXT:

	inc si
	loop TOP
	mov dx,si
	mov ah,9
	int 21h
mov ah,4ch
int 21h
main endp
end main