.model small
.stack 100h
.data 
.code 
main proc

	mov bx,0
	mov cx,0
top:
	mov ah,1
	int 21h
	cmp al,0dh
	je endtop
	
	mov ah,0
	sub ax,48
	push ax
	mov ax,10
	mul bx
	pop bx
	add bx,ax
	jmp top

endtop:
	mov dl,0Ah
	mov ah,2
	int 21h       ;new line 
	
	mov cl , 16
			
print_:
	cmp cl , 0
	je exit

	shl bx , 1
 	jc print_1

	mov dl ,'0'
	mov ah , 2
	int 21h
	
	dec cl
	jmp print_

print_1:
	mov dl ,'1'
	mov ah , 2
	int 21h
		
	dec cl
	jmp print_

exit:
	mov ah , 4ch
	int 21h
	
main endp
	end main

