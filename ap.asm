.model small
.stack 100h
.data
 var dw 0
.code
 main proc

	mov ax,@data
	mov ds,ax
	
	mov si,0
	mov ah,1
	int 21h
	mov ah,0
	and ax,000Fh
	mov cx,ax		;row in cx

	mov ah,1
	int 21h
	mov ah,0
	and ax,000Fh
	mov var,ax		;column in var
	
	mov ah,2
	mov dl,0dh
	int 21h
	mov al,0ah
	int 21h
while_:
	xor bx,bx
	xor ax,ax
input:
	mov ah,1
	int 21h
	cmp al,0dh
	je enter_
	cmp al,20h
	je space
	mov ah,0
	and ax,000Fh
	push ax
	mov ax,10
	mul bx
	pop bx
	add bx,ax
	jmp input
space:
	mov ax,bx
	mov [si],ax
	add si,2
	jmp while_
enter_:
	mov ax,bx
	mov [si],ax
	add si,2
	mov dl,0dh
	mov ah,2
	int 21h
	mov dl,0ah
	int 21h
	loop while_

	mov dl,0dh
	mov ah,2
	int 21h
	mov dl,0ah
	int 21h
	xor si,si
	mov ah,1
	int 21h
	mov ah,0
	dec ax
	and ax,000Fh
	mov bx,var
	mul bx
	mov bx,ax
	mov ah,1
	int 21h
	mov ah,0
	dec ax
	and ax,000Fh
	add ax,bx
	mov bx,2
	mul bx
	add si,ax
	mov ax,[si]
	mov bx,10
	xor cx,cx
output:
	xor dx,dx
	div bx
	push dx
	inc cx
	or ax,ax
	jne output
l1:
	pop dx
	add dl,48
	mov ah,2
	int 21h
	loop l1
	
	mov ah,4ch 
	int 21h
 main endp
end main