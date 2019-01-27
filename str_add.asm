.model	small
.stack	100h
.data

	msg db 'First no : $'
	msg1 db 'Second no : $'
	msg2 db 'The sum is : $'

	str1	db	10 dup (?)
	str2	db	10 dup (?)
	str3	db	10 dup (?)
	c1	dw	?
	c2	dw	?

.code

main proc
	mov ax, @data
	mov ds, ax
	mov es, ax

	mov bx, 0
	mov cx, 0

					;input 1st string 

	lea dx ,msg
	mov ah , 9
	int 21h
	
	lea di, str1
	cld 
	
top:	
	mov ah , 1
	int 21h
	
	cmp al, 0dh
	je top_exit
	
	stosb
	inc cl	
	jmp top

top_exit:

	mov c1, cx
	mov cx, 0
	
	mov ah,2	;New line in inputs
	mov dl, 0ah	
	int 21h

	mov dl, 0dh
	int 21h
			;input 2nd string 
	lea dx ,msg1
	mov ah , 9
	int 21h

	lea di, str2
	cld

top1:	
	mov ah, 1
	int 21h
	
	cmp al, 0dh
	je top1_exit
	
	stosb
	inc cl	
	jmp top1

top1_exit:
	mov c2, cx
	mov cx, 0
		;end of 2nd string

		;load strings
	mov bx, c1
	mov cx, c2

		; New line between inputs
	mov ah, 2
	mov dl, 0ah	
	int 21h

	mov dl, 0dh
	int 21h

	lea dx ,msg2	;adding stirngs starts
	mov ah , 9
	int 21h
		
	dec bx
	lea si, str1
	add si, bx

	dec cx
	lea di, str2
	add di, cx

sum:
	cmp c1, 0
	je go_hell

	mov al, [si]	;moves value of si in al
	mov bl, al
	sub bl, 48
	call stri

	add bl, 48
	mov dl, bl
	mov ah, 2
	int 21h
	
	dec c1
	dec si
	jmp sum

go_hell:
	mov ah, 4ch
	int 21h
	
main endp


stri proc
	mov al,[di]
	mov cl,al
	sub cl,48
	add bl,cl
	dec c2
	dec di
ret
stri endp

end main