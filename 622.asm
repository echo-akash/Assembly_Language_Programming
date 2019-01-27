.model small
.stack 100h
.data
A dw 100 dup(0)
var dw 0
var1 dw 0
var3 dw 0
.code
main proc 
    	mov ax,@data
    	mov ds,ax
    	mov si,0
    	mov ah,1   		 ;row input
    	int 21h
    	and ax,000Fh
    	mov cx,ax  		 ;loop cx=row no
    	
	
	mov ah,1   		 ;column input
    	int 21h
    	and ax,000Fh
    	mov var,ax
    	mov ah,2
	mov dl,0dh
	int 21h
	mov dl,0ah
	int 21h
				 ;input for matrix
 @input:  
     	xor bx,bx
     	xor ax,ax
 while_:
        mov ah,1
        int 21h
        cmp al,0dh		 ;carriage return
        je enter_
	cmp al,20h		 ;space
	je l1
	and ax,000Fh		 ;decmal input
        push ax
        mov ax,10
        mul bx
        pop bx
        add bx,ax
        jmp while_
l1:				 ;after getting space
    	mov ax,bx   
    	mov [si],ax
    	add si,2
    	jmp @input
enter_:   			 ;when enter
    	mov ax,bx   
   	mov [si],ax
    	add si,2		 ;incrementing si
	mov ah,2		 ;new line
	mov dl,0dh
	int 21h
	mov dl,0ah
	int 21h
	loop @input		 
	mov ah,2		 ;new line before output
	mov dl,0dh
	int 21h
	mov al,0ah
	int 21h
	mov ah,1		;which row input
	int 21h
	and ax,000Fh
	dec ax  
	mov bx,ax
	mov ax,var
	mul bx
	push ax
	mov var3,2
	pop ax
	mul var3
	mov var1,ax
	mov ah,1		;which col
	int 21h
	and ax,000Fh
	dec ax 
	mul var3
	mov di,ax
	mov bx,var1
	add di,bx
	mov ah,2
	mov dl,0dh
	int 21h
	mov dl,0ah
	int 21h
	mov ah,2
	mov dl,0dh
	int 21h
	mov dl,0ah
	int 21h
			;output
	xor ax,ax
    	mov ax,[di]
    	xor cx,cx
   	mov bx,10
top:
    	xor dx,dx
    	div bx
    	push dx
    	inc cx
    	or ax,ax
    	jne top
    	mov ah,2
level:
    	pop dx
    	add dl,48
    	int 21h
    	loop level
    	mov ah,4ch
    	int 21h
main  endp
end main