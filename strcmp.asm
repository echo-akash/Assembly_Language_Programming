.model small
.stack 100h
.data
str1 db 'asd'
str2 db 'asd'
var db '?'
var1 db '?'
.code
 main proc
	mov ax,@data
	mov ds,ax
	mov es,ax
	mov cx,3
	lea si,str1
	lea di,str2
	cld
	repe cmpsb
	jl first
	jg last
	mov ax,0
	je exit
first:
	mov ax,1
	jmp exit
last:
	mov ax,2
exit:
	mov dx,ax
	add dx,48
	mov ah,2
	int 21h
	mov ah,4ch
	int 21h

 main endp
end main