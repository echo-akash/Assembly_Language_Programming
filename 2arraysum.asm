.model small
.stack 100h
.data

array1 db 4,2,1,8
array2 db 2,1,5,1
array3 db 4 dup (?)
var db '?'
var1 db '?'
.code
main proc
	mov ax,@data
	mov ds,ax
	mov cx, 4
summation:
	mov al,array1[bx]
	add al,array2[bx]
	mov array3[bx],al
		mov ah,0
		call printd
	add bx,1
	loop summation
	mov ah,4ch
	int 21h
	main endp
printd  proc

	
	push ax
	push bx
	push cx
	push dx
	
	mov cx,10
	mov dx,0
	;mov ax,bx
	div cx
TOP2:
	
	
	inc var
	;push dx

	cmp ax,0
	jne next

	add dl,30h
	mov ah,2
	int 21h
	
next:
	call printd
    ret
printd  endp
end main