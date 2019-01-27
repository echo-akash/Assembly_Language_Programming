.model small
.stack 100h
.data
msg1 db 'enter subset',0dh,0ah,'$'
msg2 db 0dh,0ah,'enter mainstr',0dh,0ah,'$'
mainst db 80 dup (?)
subs db 80 dup (?)
stop dw '?'
start dw '?'
sublen dw '?'
yesmsg db 0dh,0ah,'is a substr$'
nomsg db 0dh,0ah,'is not a substr$'
.code
main proc
	mov ax,@data
	mov ds,ax
	mov es,ax
	mov ah,9
	lea dx,msg1
	int 21h		;msg print for subset
	lea di,subs
	call read_st
	mov sublen,bx
	
	lea dx,msg2
	mov ah,9
	int 21h		;msg print for mainstr
	lea di,mainst
	call read_st
	
	or bx,bx
	je no
	cmp sublen,0
	je no
	cmp sublen,bx
	jg no
	
	lea si,subs
	lea di,mainst
	cld
	
	mov stop,di
	add stop,bx
	mov cx,sublen
	sub stop,cx			;stop
	mov start,di
repeated:
	mov cx,sublen
	mov di,start
	lea si,subs
	repe cmpsb
	je yes
	inc start
	mov ax,start
	cmp ax,stop
	jnle no
	jmp repeated
	
yes:
	lea dx,yesmsg
	jmp display_

no:
	lea dx,nomsg
	
display_:
	mov ah,9
	int 21h
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
	
	

