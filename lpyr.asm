.model small
.stack 100h
.data
ymsg db 0dh,0ah,'leap year$'
nomsg db 0dh,0ah,'not leap year$'
var dw 4
var1 dw 100
var2 dw ?
.code
main proc
	mov ax,@data
	mov ds,ax
	xor bx,bx
	xor cx,cx
while_:	
	mov ah,1
	int 21h
	cmp al,0dh
	je end_
	mov ah,0
	sub al,48
	push ax
	mov ax,10
	mul bx
	pop bx
	add bx,ax
	jmp while_
end_:
	mov ax,bx
	mov var2,400
	cwd
	div var
	cmp dx,0
	jne no
	mov ax,bx
	cwd
	div var1
	cmp dx,0
	jne yes
	
	mov ax,bx
	cwd
	div var2
	cmp dx,0
	jne no
yes:
	lea dx,ymsg
	mov ah,9
	int 21h
	jmp exit_
no:
	lea dx,nomsg
	mov ah,9
	int 21h
exit_:
mov ah,4ch
int 21h
main endp
end main	
		
	
