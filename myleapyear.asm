.model small
.stack 100h
.data
yes1 db 'leap year$'
no1 db 'not leap year$'
msg db 0dh,0ah,'$'
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
	;and ax,000Fh
	sub al,48
	push ax
	mov ax,10
	
	mul bx
	pop bx
	add bx,ax
	jmp while_
end_:
	
	mov ax,bx
	mov cx,400
	;add cx,48
	cwd
	div cx
	cmp dx,0
	je yes
	jne l1
l1:
	
	mov ax,bx
	mov cx,100
	;add cx,48
	cwd
	div cx
	cmp dx,0
	je no
	jne top
top:
	
	mov ax,bx
	;add cx,48
	mov cx,4
	cwd
	div cx
	cmp dx,0
	je yes
	jne no
yes:
	lea dx,yes1
	mov ah,9
	int 21h
	jmp exit
no:
	lea dx,no1
	mov ah,9
	int 21h
	jmp exit


exit:
	mov ah,4ch
	int 21h	
	
 main endp
end main
 main endp
end main