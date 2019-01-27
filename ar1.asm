.model small
.stack 100h
.data

w dw 10,20,30,40,50,60,70,80,90,100
.code
 main proc
	mov ax,@data
	mov ds,ax
	
	xor ax,ax
	lea si,w
	mov cx,10
	
addno:
	add ax,[si]
	add si,2
	loop addno
	add ax,48
	xor cx,cx
	mov bx,10
	
top:
	cwd
	div bx
	push dx
	inc cx
	cmp ax,0
	jne top
to1:
	pop bx
	add bx,48
	mov ah,2
	mov dx,bx
	int 21h
	dec cx
	cmp cx,0
	jne to1
	
	
	mov ah,4ch
	int 21h

 main endp
end main