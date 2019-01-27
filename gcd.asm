.model small
.stack 100h
.data
msg db 0dh,0ah,'enter a num:$'
msg1 db 0dh,0ah,'gcd:$'
var dw 0
.code
main proc
	mov ax,@data
	mov ds,ax
	
	call read
	mov var,bx
	call read
	mov ax,bx
top:	
	cwd
	div var
	cmp dx,0
	je outt
	mov ax,var
	mov var,dx
	jmp top
outt:
	lea dx,msg1
	mov ah,9
	int 21h
	mov ax,var
	mov bx,10
outt_:	
	cwd
	div bx
	push dx
	inc cx
	cmp ax,0
	je finish
	jmp outt_
finish:
	pop dx
	add dl,48
	mov ah,2
	int 21h
	loop finish
mov ah,4ch
int 21h
main endp

read proc

	xor cx,cx
	mov bx,0
	lea dx,msg
	mov ah,9
	int 21h
	
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
	ret

read endp


end main	