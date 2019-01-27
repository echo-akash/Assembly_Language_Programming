.model small
.stack 100h
.data 
msg db 0dh,0ah,'perfect$'
msg1 db 0dh,0ah,'not perfect$'
var dw 0
.code
main proc
mov ax,@data
	mov ds,ax
	;xor cx,cx
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
perfect_:
	
	mov ax,bx
	cwd
	dec var
	cmp var,0
	je level
	div var
	cmp dx,0
	je top
	
	jmp perfect_
top:
	add cx,var
	jmp perfect_
level:
	cmp cx,ax
	je yes
	jmp no
yes:
	mov ah,9
	lea dx,msg
	int 21h
	jmp exit
no:
	mov ah,9
	lea dx,msg1
	int 21h
exit:
	mov ah,4ch
	int 21h
main endp
end main	
