         ; Take some hexa-decimal number & show output in binary
 
.model small
.stack 100h
.data 
	msg1 db 0dh,0ah,'Enter some hexa-decimal charter : $'
	msg2 db 0dh,0ah,'The output of the characters in binary : $'
.code

main proc

	mov ax , @data
	mov ds , ax
	
	lea dx , msg1
	mov ah , 9
	int 21h
	
	mov bx , 0
	mov cl , 4
	mov dx , 0

	input:
		mov ah , 1
		int 21h
		
		cmp al , 0dh
		je hex_bin
		
		cmp dx , 4
		jg hex_bin
		
		inc dx
		mov ah , 0
		
		cmp ax ,39h
		jg letter
		
		and ax , 0Fh
		jmp shift_

		letter:
			sub ax , 37h
		shift_:		
			shl bx , cl
			or bx , ax

			jmp input
		
	hex_bin:
		
		lea dx , msg2
		mov ah , 9
		int 21h
		
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
	
	
	