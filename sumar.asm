.model small
.stack 100h
.data
 w dw 10,20,30,40,50,60,70,80,90,100
 var db '?'
.code
 main proc

	mov ax,@data
	mov ds,ax
	xor bx,bx
	lea si,w
	mov cx,10

top:
	add bx,[si]
	add si,2
	loop top
	

	mov var,0
	mov ax,bx

toop:
	cwd
	mov cx,10
	div cx
	push dx

	inc var
	cmp ax,0
	jne toop
top1:
	pop dx
	or dl,48
	dec var
	mov ah,2
	int 21h

	cmp var,0
	jne top1

	mov ah,4ch
	int 21h

	
	
 main endp
end main