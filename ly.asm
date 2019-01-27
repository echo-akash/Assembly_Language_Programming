.model small
.stack 100h
.data

y db 'leap year$'
n db 'not leap year$'
.code
 main proc

	mov ax,@data
	mov ds,ax	

	mov bx,0

while_:
	mov ah,1
	int 21h
	cmp al,0dh
	je end_
	mov ah,0
	sub ax,48
	push ax
	mov ax,10
	pop bx
	mul bx
	add bx,ax
	jmp while_
end_:

leap:
	mov cl,200
	shr bx,cl
	jnc lp1
	jc lp2
lp1:
	lea dx,y
	mov ah,9
	int 21h
	jmp exit
lp2:
	mov cl,200
	rcl bx,cl
	mov cl,50
	shr bx,cl
	jnc els
	jc lp3
	
lp3:
	mov cl,50
	rcl bx,cl
	mov cl,2
	shr bx,cl
	jnc lp1
	jc els

els:
	lea dx,n
	mov ah,9
	int 21h

exit:
	mov ah,4ch
	int 21h	
	
 main endp
end main