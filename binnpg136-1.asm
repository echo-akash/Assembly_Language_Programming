.model small
.stack 100h
.data
msg db 0dh,0ah,'$'
msg1 db 0dh,0ah,'no. of 1:$'
var db '?'
.code
main proc
	mov ax,@data
	mov ds,ax
	mov var,0
	mov ah,1
	int 21h
	mov bl,al
	
	lea dx,msg
	mov ah,9
	int 21h
	
	output:	
	mov cx,8
TOP:
	rol bl,1
	jc top1
	mov dl,'0'
	mov ah,2
	int 21h
	jmp level
top1:
	inc var
	mov dl,'1'
	mov ah,2
	int 21h
level:
	loop TOP
	lea dx,msg1
	mov ah,9
	int 21h
	mov dl,var
	add dl,48
	mov ah,2
	int 21h
	
	mov ah,4ch
	int 21h
	main endp
	end main