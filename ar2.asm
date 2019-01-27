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
	mov cx,1
	mov byte ptr [si],"T"	
top1:
	
    	mov ah,2
	mov dl,msg[si]
	
	int 21h
	inc cx
	inc si
	cmp cx,17
	jle top1
	
	
	mov ah,4ch
	int 21h
 main endp
end main