.model small
.stack 100h
.data
str1 db 100 dup (?)
msg db 0dh,0ah,'$'
var dw 0
.code
main proc
	mov ax,@data
	mov ds,ax
	mov es,ax
	
	lea di,str1
	cld
	xor bx,bx
	mov ah,1
top:	
	int 21h
	cmp al,0dh
	je end_
	stosb
	jmp top
end_:
	mov al,'$'
	stosb
	mov ah,9
	lea dx,msg
	int 21h
	
	lea di,str1
	cld
	call length_
	mov var,bx
	
	lea di,str1
	add di,var
	lea si,str1
	mov ax,bx
	mov bl,2
	div bl
	mov cl,al
	
move:
	xchg si,di
	dec di
	inc si
	loop move
	
	mov ah,9
	lea dx,msg
	int 21h
	
	lea si,str1
	cld
	mov cx,var
	mov ah,2
load:	
	lodsb
	mov dl,al
	int 21h
	loop load
	
	
mov ah,4ch
int 21h
main endp
length_ proc
	again:	
	scasb
	je output
	inc bx
	jmp again
output:
	mov dx,bx
	add dl,48
	mov ah,2
	int 21h
	
	ret
length_ endp



end main	