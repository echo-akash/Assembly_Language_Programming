.model small
.stack 100h
.data
A dw 1 ,2 , 3
  dw 4, 5, 6
  dw 1 ,0 ,0
B dw 8 ,2, 0
  dw 2, 2,1
  dw 6,1,2
 var dw '?'
.code
 main proc

	mov ax,@data
	mov ds,ax
	xor bx,bx
	xor ax,ax
	mov cx,3
	mov var,3
top:
	mov si,0
level:
	mov ax,A[bx][si]
	add ax,B[bx][si]
	mov ah,2
	mov dx,ax
	add dx,48
	int 21h
	mov ah,2
	mov dl,' '
	int 21h
	add si,2
	loop level
	add bx,6
	dec var
	mov cx,3
	mov dl,0dh	
	mov ah,2
	int 21h
	mov dl,0ah
	int 21h
	cmp var,0
	je exit
	jmp top
exit:
	mov ah,4ch
	int 21h
	

 main endp
end main