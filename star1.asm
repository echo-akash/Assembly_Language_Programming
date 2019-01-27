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
	
	mov var,1
	

top:
	mov bl,0
star:
	mov dl,'*'
	mov ah,2
	int 21h
	inc bl
	cmp bl,var
	jne star

	inc var
	mov dl,0ah
	int 21h
	loop top

	mov ah,4ch
	int 21h
 main endp
end main