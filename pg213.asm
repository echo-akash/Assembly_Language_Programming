.model small
.stack 100h
.data
str1 db 80 dup(?)
msg db 0dh,0ah,'$'
.code
main proc
	mov ax,@data
	mov ds,ax
	mov es,ax
	lea di,str1
	cld
	mov ah,1
input:
	int 21h
	cmp al,0dh
	je output
	stosb
	jmp input
output:
	lea dx,msg
	mov ah,9
	int 21h
	mov cx,10
	lea si,str1
TOP:
	lodsb
	mov dl,al
	mov ah,2
	int 21h
	loop TOP
	
	mov ah,4ch
	int 21h
	main endp
	end main
	
	