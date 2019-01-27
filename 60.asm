.model small
.stack 100h
.data
A dw 100 dup(0)
var dw 0
var1 dw 0
row dw 0
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
 input:  
     	xor bx,bx
     	xor ax,ax
 while:
        mov ah,1
        int 21h
        cmp al,0dh
        je enter
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
enter:   
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
	mov ah,1
	int 21h
	and ax,000Fh
	dec ax  
	mov bx,ax
	mov ax,var
	mul bx
push ax
	mov row,2
pop ax
	mul row
	mov var1,ax
	mov ah,1
	int 21h
	and ax,000Fh
	dec ax 
	mul row
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
	
	xor ax,ax
    	mov ax,[di]
    	xor cx,cx
   	mov bx,10
rept:
    	xor dx,dx
    	div bx
    	push dx
    	inc cx
    	or ax,ax
    	jne rept
    	mov ah,2
pr:
    	pop dx
    	add dl,48
    	int 21h
    	loop pr
    	mov ah,4ch
    	int 21h
main  endp
end main