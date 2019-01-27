.model small
.stack 100h
.data
string dw 70 dup(?)
.code
 main proc
	mov ax,@data
	mov ds,ax
	mov es,ax

	lea di,string
	xor bx,bx
	cld
	mov ah,1
	int 21h
while_:
	cmp al,0dh
	je display_
	stosb
	add si,2
	inc bx
	int 21h
	jmp while_
display_:
	mov ah,2
	mov dl,0dh
	int 21h
	mov dl,0ah
	int 21h
	lea si,string
	mov cx,bx
	cld
top:
	lodsb
	mov dl,al
	mov ah,2
	int 21h
	loop top

	mov ah,4ch
	int 21h

 main endp
end main