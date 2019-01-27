.model small
.stack 100h
.data
var db '?'
str1 db 10 dup(?)
.code
main proc
	mov ax,@data
	mov ds,ax
	mov es,ax
	mov var,0
	lea di,str1
	call read_st
	mov si,di
	cld
	
	
level:
	mov cx,bx
	lodsb
	lea di,str1
level1:
	
	scasb
	jz TOOP
	loop level1
TOOP:
	inc var
	loop level1
exit_:
	mov dl,al
	mov ah,2
	int 21h
	mov dl,var
	add dl,48
	int 21h
	dec bx
	jne level
	
	mov ah,4ch
	int 21h
	main endp
	
read_st proc
	push ax
	push di
	cld
	xor bx,bx
	
	mov ah,1
	int 21h

while_:  cmp al,0dh
	je end_while

	cmp al,8h
	jne else_
	dec di
	dec bx
	jmp read

else_:  stosb
	inc bx

read:   int 21h
	jmp while_
		
end_while:
	pop di
	pop ax
	ret
read_st endp

	end main
	
	

