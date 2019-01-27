.model small
.stack 100h
.data

msg db 0dh,0ah,'$'
msg1 db 100 dup(0)
msg2 db 100 dup(0)

.code
main proc

	mov ax,@data
	mov ds,ax
	mov es,ax

	lea di,msg1
	cld
	xor bx,bx
	mov ah,1
	int 21h
input:
	cmp al,0dh
	je reverse
	cmp al,8h
	jne store
	dec di
	dec bx
	jmp again

store:
	stosb
	inc bx
again:
	int 21h
	jmp input
reverse:
	dec bx
	lea si,msg1
	add si,bx
	lea di,msg2
	std
	inc bx
	mov cx,bx
str_rev:
	movsb
	add di,2
	loop str_rev
output:
	lea si,msg2
	cld
	mov cx,bx
	mov ah,2
for:
	lodsb
	mov dl,al
	int 21h
	loop for
exit:
	mov ah,4ch
	int 21h
main endp
end main
	

main endp
end main