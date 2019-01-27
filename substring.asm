.model small
.stack 100h
.data
msg1 db 'enter subst',0dh,0ah,'$'
msg2 db 0dh,0ah,'enter mainst',0dh,0ah,'$'
mainst db 70 dup(0)
subst db 70 dup(0)
stop dw ?
start dw ?
sub_len dw ?
yesmsg db 0dh,0ah,'yes$'
nomsg db 0dh,0ah,'no$'
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
	int 21h

	lea di,mainst
	call read_str
	
	or bx,bx
	je no
	cmp sub_len,0
	je no
	cmp sub_len,bx
	jg no

	lea si,subst
	lea di,mainst
	cld

	mov stop,di
	add stop,bx
	mov cx,sub_len
	sub stop,cx


	mov start,di
repeat:
	mov cx,sub_len
	mov di,start
	lea si,subst
	repe cmpsb
	je yes
	
	inc start
	mov ax,start
	cmp ax,stop
	jnle no
	jmp repeat
	
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
read_str proc
	cld
	xor bx,bx
	cld
	mov ah,1
	int 21h
while_:
	cmp al,0dh
	je end_
	stosb
	inc bx
	int 21h
	jmp while_
end_:
 ret
read_str endp
end main
