.model small
.stack 100h
.data
A dw 100 dup(0)
var dw 0
var1 dw 0
row dw 2
.code
 main proc

	mov ax,@data
	mov ds,ax
	mov si,0
	
	mov ah,1
	int 21h
	and ax,000Fh
	mov cx,ax		;row in cx

	mov ah,1
	int 21h
	and ax,000Fh
	mov var,ax		;col in var

	mov dl,0dh
	mov ah,2
	int 21h
	mov dl,0ah
	int 21h
input:
	xor bx,bx
	xor ax,ax
while:
	mov ah,1
	int 21h
	cmp al,0dh
	je enter_
	cmp al,20h
	je last
	and ax,000Fh
	push ax
	mov ax,10
	mul bx
	pop bx
	add bx,ax
	jmp while
last:
	mov ax,bx
	mov [si],ax
	add si,2
	jmp input
enter_:
	mov ax,bx
	mov [si],ax
	add si,2
	
	mov ah,2
	mov dl,0dh
	int 21h
	
	mov dl,0ah
	int 21h
	loop input

    mov ah,2
	mov dl,0dh
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
    xor cx,cx
    	mov bx,10
 
rept_:
    xor dx,dx
    div bx
    push dx
    inc cx
    or ax,ax
    jne rept_
    mov ah,2
pr:
    pop dx
    add dl,48
    int 21h
    loop pr
    mov ah,4ch
    int 21h	
	
		

 main endp
end main