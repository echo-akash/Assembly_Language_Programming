.model small
.stack 100h
.data 
A db 6,4,9,8
var db '?'
.code
main proc
	mov ax,@data
	mov ds,ax
	mov bx,0
	mov cx,4
	lea si,A
top:	mov ax,[si]
	cmp ax,bx
	jg NEXT
	jmp LEVEL
NEXT:	mov bx,ax
LEVEL:	inc si
	loop top
exit:	add bx,48
	mov dx,bx
	mov ah,2
	int 21h
mov ah,4ch
int 21h

main endp
end main