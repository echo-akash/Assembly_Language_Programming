.model small
.stack 100h
.code


main proc
	

	mov ah,1           ;input display func
	int 21h            ;input 1
	mov bl,al
	

	int 21h		;input 2	
	mov bh,al
	

	mov ah,2
	mov dl,0ah	
	int 21h
	
	cmp bl,bh
	jge T
	

	mov dl,bh
	jmp print
	

T:      mov dl,bl
	
print:   mov ah,2
	int 21h


	mov ah,4ch
	int 21h


main endp
end main  