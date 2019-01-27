.model small
.stack 100h
.data
str1 db 80 dup(?)
str2 db 80 dup(?)
len1 dw 0
len2 dw 0
msg db 0dh,0ah,'$'
msg1 db 0dh,0ah,'string1 perceeds str2$'
msg2 db 0dh,0ah,'string2 perceeds str1$'
msg3 db 0dh,0ah,'identical$'
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
	cmp len1,cx
	jl next
	mov cx,len1
next:
	lea si,str1
	lea di,str2
	cld
toop:	cmpsb
	jl fst_
	jg scd_
	loop toop
	lea dx,msg3
	mov ah,9
	int 21h
	jmp exit_
fst_:
	lea dx,msg1
	mov ah,9
	int 21h
	jmp exit_
scd_:
	
	lea dx,msg2
	mov ah,9
	int 21h	
exit_:	
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