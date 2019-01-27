.model small
.stack 100h
.data
A dw 5,2,3,4,5
  dw 2,3,4,5,6
  dw 1,2,5,6,8
  dw 1,3,6,9,0
  dw 2,4,5,0,0
var dw 5
avg dw 100 dup(0)
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
	add ax,A[bx+si]
	add bx,10
	loop for
	xor dx,dx
	div var
	mov avg[si],ax
	sub si,2
	cmp si,0
	jnl repeat

	mov si,0
	xor dx,dx
	mov cx,5

for_:
	mov dx,avg[si]
	add dx,48
	add si,2
	mov ah,2
	int 21h
	loop for_
	mov ah,4ch
	int 21h
 main endp
end main