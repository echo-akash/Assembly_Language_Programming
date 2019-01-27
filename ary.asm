.model small
.stack 100h
.data

 msg db 'this is a message'
.code
 main proc

	mov ax,@data
	mov ds,ax
	xor si,si
	;lea si,msg
	mov cx,17
top:
	cmp msg[si],' '
	je next
   	sub msg[si],32
    
	
next:
	inc si
	
	loop top
	xor si,si
	xor cx,cx
	
top1:
	
    	mov ah,2
	mov dl,msg[si]
	
	int 21h
	inc cx
	inc si
	cmp cx,17
	jne top1
	
	
	mov ah,4ch
	int 21h
 main endp
end main