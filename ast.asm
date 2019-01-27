.model small
.stack 100h
.data
A dw 100 dup(0)
var dw 0
.code
 main proc

	mov ax,@data
	mov ds,ax

	lea si,A
input:
	xor bx,bx
	xor ax,ax
while_:
	mov ah,1
	int 21h
	cmp al,0dh
	je enter_
	cmp al,20h
	je space

	and ax,000Fh
	push ax
	mov ax,10
	mul bx
	pop bx
	add bx,ax
	jmp while_
space:
	mov ax,bx
	mov [si],ax
	add si,2
	inc var
	jmp input
enter_:
	mov ax,bx
	mov [si],ax
	inc var
	
	mov dl,0dh
	mov ah,2
	int 21h
	mov al,0ah
	int 21h

;sorting

	mov bx,var
	lea si,A
	dec bx
	je end_sort
	;mov cx,bx
	mov dx,si
sort_loop:
	mov si,dx
	mov cx,bx
	mov di,si
	mov ax,[di]
find_big:
	add si,2
	cmp [si],ax
	jng next
	mov di,si
	mov ax,[di]
next:
	loop find_big
	
;swap

	push ax
	mov ax,[si]
	xchg ax,[di]
	mov [si],ax
	pop ax

	dec bx
	jne sort_loop
end_sort:
	lea si,A

top:
	mov ax,[si]

	mov bx,10
	xor cx,cx

toop:
	xor dx,dx
	div bx
	push dx
	inc cx
	cmp ax,0
	jne toop
	mov ah,2
	
	
level:
	pop dx
	add dl,48
	int 21h
	loop level
	mov dl,' '
	int 21h
	add si,2
	dec var
	cmp var,0
	jne top

	mov ah,4ch
	int 21h
	
	
	
	
 main endp
end main