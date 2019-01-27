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
	mov ah,9
	lea dx,msg
	int 21h
	mov var1,0
	mov var,0
	mov ax,bx
TOOP:
	cwd
	mov cx,10
	div cx
	push dx
	
	inc var
	cmp ax,0
	jne TOOP

TOP:	pop dx
	or dl,48
	dec var
	mov ah,2
	int 21h
	
	cmp var,0
	jne TOP

mov ah,4ch
int 21h

main endp
end main