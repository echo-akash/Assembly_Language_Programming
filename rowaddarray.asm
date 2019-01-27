.model small
.stack 100h
.data

A dw 1,2,3,4,5
  dw 2,1,3,4,5
  dw 4,5,6,8,0
  dw 0,0,0,1,1

var dw 5
var1 dw '?'
avg dw 100 dup(0)
.code
main proc

	mov ax,@data
	mov ds,ax
	mov cx,5
	xor bx,bx
	mov var1,5
repeat:
	

	xor ax,ax
	mov si,0

for:
	add ax,A[si+bx]
	add si,2
	cmp si,8
	jle for
	xor dx,dx
	div var
	mov ah,2
	mov dx,ax
	add dx,000Fh
	int 21h
	add bx,10
	dec var1
	cmp var1,1
	jnl repeat

	mov ah,4ch
	int 21h
	
	
 
main endp
end main
 