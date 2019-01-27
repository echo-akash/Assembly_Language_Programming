.model small
.stack 100h
.data
 
.code
 	main proc
               mov cl,4
               mov ch,4	      
               xor bx,bx	 
               mov ah,1
               int 21h
    
        WHILE:
               cmp al,0dh
               je new_line
               and al,0fh
               shl bx,1
               or  bl,al
               int 21h
               jmp WHILE	;input

	     
	new_line:
        	mov dl,0Ah
		mov ah,2
		int 21h
	end_while:
		mov dl,bh
		shr dl,cl
		cmp dl,10
		jl print
		add dl,55
		mov ah,2
		int 21h
                rol bx,cl		
                dec ch
                cmp ch,0
                je exit
                jmp end_while
	print:
		add dl,48
		mov ah,2
		int 21h
                rol bx,cl
		dec ch
                cmp ch,0
		jne end_while
		
		
	

	exit:
		mov ah,4ch
		int 21h

	main endp
end main
		
		