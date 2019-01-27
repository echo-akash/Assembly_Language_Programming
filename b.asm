.model small
.stack
.data
	e db 'enter the 1st input:$'
	f db 'enter the 2nd input:$'
	g db 'result is:$'
.code

   main proc
	mov ax,@data
	mov ds,ax
	lea dx,e
	mov ah,9
	int 21h

	mov bl,0
	mov cl,0
	mov dl,8

x:	mov ah,1
	int 21h
	sub al,48
	shl bl,1
	or bl,al
	dec dl
	cmp dl,0
	jz inp
	jmp x
	
inp: 	lea dx,f
	mov ah,9
	int 21h

	mov dl,8

again:	

	mov ah,1
	int 21h
	sub al,48
	
	shl cl,1
	or cl,al
	dec dl
	cmp dl,0
	jz sum
	jmp again

sum:	add bl,cl
	mov dl,8

shift:	cmp dl,0
	jz print
	dec dl
	shl bl,1
	jc count
	jmp shift

count:	inc bh
	jmp shift

print:	lea dx,g
	mov ah,9
	int 21h
	mov dl,bh
	add dl,48
	mov ah,2
	int 21h
	

exit:	mov ah,4ch
	int 21h

main endp
end main
	
	

	
	
