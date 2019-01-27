.model small
.stack 100h
.data
msg1 db 'enter subst',0dh,0ah,'$'
msg2 db 0dh,0ah, 'enter mainst',0dh,0ah,'$'
mainst db 70 dup(0)
subst db 70 dup (0)
stop dw ?
start dw ?
sub_len dw ?
yesmsg db 0dh,0ah,'subset is a substriong of mainst$'
nomsg db 0dh,0ah,'not a substring$'
.code
 main proc
	mov ax,@data
	mov ds,ax
	mov es,ax

	mov ah,9
	lea dx,msg1
	int 21h
	
	lea di,subst
	call read_str
	mov sub_len,bx
	

	lea dx,msg2
	mov ah,9
	int 21h

	lea di,mainst
	call read_str

	or bx,bx
	je NO
	cmp sub_len,0
	je NO
	cmp sub_len,bx
	jg NO

	lea si,subst
	lea di,mainst
	cld

	mov stop,di
	add stop,bx
	mov cx,sub_len
	sub stop,cx

	mov start,di

repeat:
	
	;mov clen
	mov cx,sub_len
	mov di,start
	lea si,subst
	repe cmpsb
	je YES
	inc start

	mov ax,start
	cmp ax,stop
	jnle NO
	jmp repeat

YES:
	lea dx,yesmsg
	jmp DISPLAY_
NO:
	lea dx,nomsg
DISPLAY_:
	mov ah,9
	int 21h
	mov ah,4ch
	int 21h
	main endp
read_str proc
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
read_str endp
end main

