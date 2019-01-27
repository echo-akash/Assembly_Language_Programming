.model small
.stack 100h
.data
msg db 0dh,0ah,'$'
str1 db 20 dup(?)
str2 db 20 dup(?)
len1 dw 0
len2 dw 0
var dw 0
.code
main proc
	mov ax,@data
	mov ds,ax
	mov es,ax

	lea di,str1
	call input
	mov len1,cx

	lea dx,msg
	mov ah,9
	int 21h

	lea di,str2
	call input
	mov len2,cx

	lea dx,msg
	mov ah,9
	int 21h
	lea di,str1
	add di,len1
	lea si,str2
	cld
top:	movsb
	loop top
	
	mov cx,len2
	add cx,len1

	lea si,str1
	cld
toop:	lodsb
	mov dl,al	
	mov ah,2
	int 21h
	loop toop
mov ah,4ch
int 21h
main endp

input proc
	xor cx,cx
	cld
	mov ah,1
in_:	int 21h
	cmp al,0dh
	je end_
	stosb
	inc cx
	jmp in_
end_:
	ret
input endp
end main