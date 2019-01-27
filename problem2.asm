.model small
.stack 100h
.data
	msg db 0ah,0dh,'$'
	msg1 db 'input:',0ah,0dh,'$'
	msg2 db 0ah,0dh,'Output:',0ah,0dh,'$'
	w db '?'
	r db '?'
	arr db 100 dup (10 dup (?))
.code
main proc
	mov ax,@data
	mov ds,ax
	lea dx,msg1
	mov ah,9
	int 21h

	mov ah,1
	int 21h

	mov bl,al
	and bx,000fh
	mov r,bl	;row

	int 21h

	and ax,000fh

	mov w,al

	mul bx
	mov cx,ax	;total

	lea dx,msg
	mov ah,9	;newline
	int 21h
	
	xor bx,bx
	lea si,arr
input:	

	mov ah,1
	int 21h
	cmp al,' '
	je pt2
	cmp al,0dh
	je pt1
	and ax,000fh
	push ax
	mov ax,10
	mul bx
	pop bx
	add bx,ax
	jmp input
pt1:	
	
	lea dx,msg	;print a newline
	mov ah,9
	int 21h
pt2:	
	
	mov [si],bx
	inc si
	xor bx,bx
	loop input
	
	mov ah,1

	int 21h		
	mov cl,al	;i

	int 21h
	mov dl,al	;j

	dec cl
	dec dl

	mov al,w	
	mul cl

	mov cl,al
	add cl,dl


	mov bl,cl
	and bx,000fh
	
	lea dx,msg2	;output msg
	mov ah,9
	int 21h

	mov al,arr[bx]
	and ax,00ffh	;ax has value of location






	
	mov bx,10
	xor cx,cx
output:

	xor dx,dx
	div bx
	push dx
	inc cx
	or ax,ax
	jne output
	mov ah,2
print:	

	pop dx
	add dl,48
	int 21h
	loop print
	
	mov ah,4ch
	int 21h
main endp
end main
	