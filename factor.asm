.model small
.stack 100h
.data 
msg db 0dh,0ah,'$'
var dw '?'
var1 dw '?'
var2 dw '?'
.code
main proc
mov ax,@data
	mov ds,ax
	xor cx,cx
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
	lea dx,msg
	mov ah,9
	int 21h
	
	xor cx,cx
	mov var,bx
divi:
	mov ax,bx
	cwd
	div var
	mov ax,var
	dec var
	cmp dx,0
	je outt
	cmp var,0
	je exit_
	jmp divi
outt:
	
	mov var1,10
outt_:	
	cwd
	div var1
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
	
	mov dl,' '
	mov ah,2
	int 21h
	
	cmp var,0
	je exit_
	jmp divi
exit_:	
mov ah,4ch
int 21h
main endp
end main	
