.model small
.stack 100h
.data 
msg db 0dh,0ah,'perfect$'
msg1 db 0dh,0ah,'not perfect$'
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

	
	xor cx,cx
	mov var,bx
divi:	
	mov ax,bx
	cwd
	
	dec var
	cmp var,0
	je exit_
	div var
	cmp dx,0
	je outt
	
	jmp divi
outt:
	add cx,var

	jmp divi
exit_:	
cmp ax,cx
je yes
lea dx,msg1
mov ah,9
int 21h
jmp shesh
yes:
lea dx,msg
mov ah,9
int 21h
shesh:
mov ah,4ch
int 21h
main endp
end main	
