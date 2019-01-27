.model small
.stack 100h
.data
str1 db 10 dup(?)
str2 db 10 dup(?)
msg db 0dh,0ah,'$'
msg1 db 0dh,0ah,'first string comes first$'
msg2 db 0dh,0ah,'second string comes first$'
msg3 db 0dh,0ah,'both are equal$'
.code
main proc
	mov ax,@data
	mov ds,ax
	mov es,ax
	
	lea di,str1
	call read
	lea si,str1
	lea di,str2
	mov ah,9
	lea dx,msg
	int 21h
	call read
	cld
	mov cx,bx
	repe cmpsb
	jl strng1
	jg strng2
	mov ah,9
	lea dx,msg3
	int 21h
	jmp exit_
strng1:
	lea dx,msg1
	mov ah,9
	int 21h
	jmp exit_
strng2:
	lea dx,msg2
	mov ah,9
	int 21h
	
exit_:	
mov ah,4ch
int 21h
main endp
read proc
	push ax
	push di
	xor bx,bx
	cld
	mov ah,1
top:	
	int 21h
	cmp al,0dh
	je end_
	stosb
	inc bx
	jmp top
end_:
	pop di
	pop ax
	ret

read endp
end main	