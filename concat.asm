.model small
.stack 100h
.data
msg1 db 'enter first string',0dh,0ah,'$'
msg2 db 0dh,0ah,'enter 2nd string',0dh,0ah,'$'
mainst db 80 dup (?)
subs db 80 dup (?)
len1 dw '?'
len2 dw '?'

.code
main proc
	mov ax,@data
	mov ds,ax
	mov es,ax
	mov len1,0
	mov len2,0
	mov ah,9
	lea dx,msg1
	int 21h		;msg print for subset
	lea di,mainst
	call read_st
	mov len1,bx
	lea si,mainst
	lea dx,msg2
	mov ah,9
	int 21h		;msg print for mainstr
	lea di,subs
	call read_st
	mov len2,bx
	xor ax,ax
	add ax,len1
	add ax,len2
	call concat
	lea si,mainst
	mov cx,ax
outt_:
	lodsb
	mov dl,al
	mov ah,2
	int 21h
	loop outt_
	mov ah,4ch
	int 21h
	
	
main endp
concat proc
	lea si,subs
	mov cx,len2
	;dec bx
	lea di,mainst
	add di,bx
	cld
move:
	rep movsb
ret
concat endp
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
	
	

