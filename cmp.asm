.model small
.stack 100h
.data
str1 db 'hello$'
str2 db 'hello$'

.code
	
main proc
mov cx,5
	mov ax,@data
	mov ds,ax
	mov es,ax
	lea si,str1
	lea di,str2
	cld
	repe cmpsb
	jl first_str1
	jg first_str2
	mov ax,0
	mov dl,al
	add dl,48
	mov ah,2
	int 21h
	jmp exit_
first_str1: 
	mov ax,1
	mov dl,al
	add dl,48
	mov ah,2
	int 21h
	jmp exit_
first_str2: 
	mov ax,2
	mov dl,al
	add dl,48
	mov ah,2
	int 21h
exit_:
	mov ah,4ch
	int 21h
	main endp
	end main