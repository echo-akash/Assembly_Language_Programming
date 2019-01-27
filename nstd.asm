.model small
.stack 100h
.data
msg db 0dh,0ah,'$'
var db ?
var1 dw ?
.code
main proc
	mov ax,@data
	mov ds,ax
	mov var1,1
	mov cx,9
top:
	mov var,5
	mov ah,2
	mov dx,var1
	add dx,48
again:	
	int 21h
	dec var
	cmp var,0
	je next
	jmp again
next:
	lea dx,msg
	mov ah,9
	int 21h
	inc var1
	cmp cx,0
	je end_
	loop top
end_:	
mov ah,4ch
int 21h
main endp
end main	