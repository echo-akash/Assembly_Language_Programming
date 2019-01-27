.model small
.stack 100h
.data
var db '?'

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
	mul bx
	pop bx
	add bx,ax
	jmp while_

end_:
	mov cx,bx
	mov ax,1
top:
	mul cx
	loop top

	mov cx,10
	mov var,0
top1:
	;cwd
	div cx
	push dx
	inc var
	cmp ax,0
	jne top1

top2:
	
	dec var
	pop bx
	add bx,48
	mov dx,bx
	mov ah,2
	int 21h
	
	cmp var,0
	jne top2
l1:
	mov ah,4ch
	int 21h
	
 main endp
end main