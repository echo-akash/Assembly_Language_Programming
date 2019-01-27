.model small
.stack 100h
.data
A dw 1, 2 ,3 ,4, 5
  dw 10, 20, 30 ,4 ,5
  dw 2, 4, 6, 8, 0
  dw 3, 5, 7, 9 ,1
  dw 0 ,0 ,0, 0, 0
var dw 5
avg dw 5 dup(0)
v dw '?'
.code
 main proc
	mov ax,@data
	mov ds,ax
	mov si,8
repeat:

	xor bx,bx
	xor ax,ax
	mov cx,5
for:
	add ax,a[bx+si]
	add bx,10
	loop for

	xor dx,dx
	div var
	mov avg[si],ax
	mov dx,avg[si]
	sub si,2
	jnl repeat

	mov cx,5
	mov si,0
for_:
	mov dx,avg[si]
	add dx,30h
	mov ah,2
	int 21h
	add si,2
	loop for_

	mov ah,4ch
	int 21h
	
	


 main endp
end main