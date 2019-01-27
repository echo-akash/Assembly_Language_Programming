.model small
.stack 100h
.data

msg1 db 'take input:$'

msg2 db  'do u want to continue:Y/N$'

msg3 db 'error message$'

n DB 0dh,0ah,'$'  



	
.code

	main proc
		
		

		mov ax,@data
		mov ds,ax
input:
		lea dx,n
		mov ah,9
		int 21h

		lea dx,msg1
		mov ah,9
		int 21h

		mov ah,1	;input char
		int 21h	
		
		cmp al,'A'
		jl EE
		cmp al,'F'
		jg EE
		jmp output


EE:		
		lea dx,msg3
		mov ah,9
		int 21h
		jmp con

output:
				

		mov bl,al
		sub bl,'A'
		add bl,'0'

		mov ah,2
		mov dl,'1'
		int 21h
		mov dl,bl
		int 21h	
		
con:		lea dx,n
		mov ah,9
		int 21h

		lea dx,msg2
		mov ah,9
		int 21h
    	
		mov ah,1
		int 21h
	
		cmp al,'y'
		je input
		
exit:
		mov ah,4ch	;dos exit
		int 21h
	main endp
end main
