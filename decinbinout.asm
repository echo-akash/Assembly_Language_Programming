.model small
.stack 100h
.data
var db '?'
var1 db '?'
msg db 0dh,0ah,'$'
.code
main proc
	mov ax,@data
	mov ds,ax
	mov bx,0
TOP1:	mov ah,1
	int 21h
	cmp al,0dh
	je END_
	mov ah,0
	sub ax,48
	push ax
	mov ax,10
	mul bx
	pop bx
	add bx,ax
	jmp TOP1
END_:
	mov cx,16
TOP:
	rol bx,1
	jc TOP2
	jnc TOP0
	
TOP2:	mov ah,2
	mov dl,'1'
	int 21h
	jmp NEXT

TOP0:	mov ah,2
	mov dl,'0'
	int 21h
	jmp NEXT
NEXT:	loop TOP

mov ah,4ch
int 21h

main endp
end main

