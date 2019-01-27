.model small
.stack 100h
.data
var db '?'
msg db 0dh,0ah,'max:$'
.code
main proc
	mov ax,@data
	mov ds,ax
	mov var,0
	mov ah,1
	int 21h
	mov bl,al
	mov ah,1
	int 21h
	mov bl,al
	
	cmp bl,cl
	jg max
	mov var,cl
	
max:
	mov var,bl
	
	lea dx,msg
	mov ah,9
	int 21h
	mov dl,var
	;sub dl,48
	mov ah,2
	int 21h
	
	mov ah,4ch
	int 21h
	main endp
	end main
	