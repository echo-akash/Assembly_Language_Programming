.model small

.stack 100h

.data

st1 db 50 dup('$')

msg1 db 13,10,'Enter a string : $'
msg2 db 13,10,'Reversed string : $'

.code

main proc
	mov ax,@data
	mov ds,ax
	mov es,ax

    	lea dx,msg1
    	mov ah,9		
    	int 21h



	lea di,st1
	call insert


    	lea dx,msg2
    	mov ah,9	
    	int 21h



	mov si,di
	std	
	mov cx,bx

tp:
	movsb
	;dec si				;;;alternate of movesb
	mov ah,2
	mov dl,[si]	
	int 21h

Loop tp


	mov ah,4ch
	int 21h


main endp

insert proc
	cld
	xor bx,bx
	mov ah,1
	int 21h

th:
	cmp al,0dh
	je tl
	
	
tj:
	stosb
	inc bx

tk:
	int 21h
	jmp th

tl:
	ret

insert endp

end main