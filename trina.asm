.model small
.stack 100h
.data 
msg db 'Enter the number'	
.code
main proc
		
		mov dl, '?'
		mov ah,2
		int 21h	
		
		mov dl, 0Ah
		mov ah,2
		int 21h
		mov dl, 0Dh
		mov ah,2
		int 21h		
		mov ah ,1
		int 21h		;Input	
		
		
		sub  al, 32
		
		mov dl, al
		mov ah,2
		int 21h		;Output

		mov ah , 4ch
		int 21h		;Dos Exit
main endp
end main