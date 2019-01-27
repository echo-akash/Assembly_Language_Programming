.model small
.stack 100h
.data
var db '?'
.code
 main proc
	mov ax,@data
	mov ds,ax

	mov ah,1
	int 21h
	sub al,48
	mov ch,0
	mov cl,al
	mov bl,al
	

top:
	mov var,1
star:
	mov ah,2
	mov dl,'*'
	int 21h
	inc var
	cmp var,bl
	jle star

	dec bl
	mov dl,0ah
	int 21h
	loop top

	mov ah,4ch
	int 21h

 main endp
end main