.model small
.stack 100h
.data
newline db 0dh,0ah,'$'
str1 db 100 dup(?)
var db 0
.code
main proc
	mov ax,@data
	mov ds,ax
	mov es,ax
	xor bx,bx
	lea di,str1
	cld
	mov ah,1

while_:	int 21h
	cmp al,0dh
	je end_
	stosb
	inc bx
	jmp while_
end_: lea dx,newline
	mov ah,9
	int 21h

	mov ah,1
	int 21h
	lea di,str1
	cld
scan_:
	 scasb
	jne next
	inc var
next:
	dec bx
	cmp bx,0
	jne scan_
	
	lea dx,newline
	mov ah,9
	int 21h
	
	mov dl,var
	add dl,48
	mov ah,2
	int 21h
mov ah,4ch
int 21h
	main endp
end main