    	  ; Take binary number & show output in hexadecimal number
 
.model small
.stack 100h
.data 
	msg1 db 0dh,0ah,'Enter binary number : $'
	msg2 db 0dh,0ah,'In Hexa-decimal it is : $'
.code

main proc

	mov ax , @data
	mov ds , ax
	
	lea dx , msg1
	mov ah , 9
	int 21h
	
	mov bx , 0
	mov dx , 16
	
	input:
		cmp dx , 0
		je bin_hex

		mov ah , 1
		int 21h
		
		cmp al , 0dh
		je bin_hex
		
		and al , 0Fh
	  	shl bx , 1
		or  bl , al

		dec dx
		jmp input

	bin_hex:
	
		lea dx , msg2
		mov ah , 9
		int 21h
		
		mov ch , 4
		mov cl , 4
		
		print_:
			cmp ch , 0
			je exit
		
			dec ch

			mov dl , bh
			shr dl , cl
			rol bx , cl
			
			add dl , 48
			
			cmp dl , 57
			jg A_F

			mov ah , 2
			int 21h
	
			jmp print_
 	
		A_F:
			add dl , 7
			mov ah , 2
			int 21h
			
			jmp print_
	
	exit:
		mov ah , 4ch
		int 21h
	
main endp
	end main
	
	
	