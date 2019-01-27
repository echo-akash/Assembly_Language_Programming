.model small
.stack 100h
.data
var dw 0
str1 db 20 dup(?)
str2 db 20 dup(?)
msg db 0dh,0ah,'$'
ymsg db 0dh,0ah,'palindrome$'
nmsg db 0dh,0ah,'not palindrome$'
.code
main proc
	mov ax,@data
	mov ds,ax
	mov es,ax
	xor cx,cx
	xor bx,bx
	lea di,str1
	cld
	mov ah,1
in_:	int 21h
	cmp al,0dh
	je end_
	stosb
	inc cx
	inc bx
	jmp in_
end_:
	lea di,str2
	lea si,str1
	add si,cx
	dec si
	std
top:
	movsb
	add di,2
	loop top

	lea dx,msg
	mov ah,9
	int 21h
	lea si,str1
	call output
	lea dx,msg
	mov ah,9
	int 21h
	lea si,str2
	call output

	mov cx,bx
	lea si,str1
	lea di,str2
toop:	cmpsb
	jl nmsg_
	jg nmsg_
	loop toop
ymsg_:
	lea dx,ymsg
	mov ah,9
	int 21h
	jmp exit_
nmsg_:
	lea dx,nmsg
	mov ah,9
	int 21h
exit_:
	mov ah,4ch
	int 21h
main endp
output proc
	mov var,bx
	cld
again:	lodsb
	mov dl,al
	mov ah,2
	int 21h
	dec var
	cmp var,0
	jne again
	ret
output endp
end main
	
		