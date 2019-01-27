.model small
.stack 100h
.data
 
.code
 	main proc
               mov cx,16	      
               xor bx,bx	 
               mov ah,1
               int 21h
    
        WHILE:
               cmp al,0dh
               je end_while
               and al,0fh
               shl bx,1
               or  bl,al
               int 21h
               jmp WHILE
         
       end_while:
                rol bx,1            
                 
                jc output
                mov dl,'0'
                mov ah,2
                int 21h
                loop end_while
                jmp exit
        output:
		mov dl,'1'
                mov ah,2
                int 21h
                loop end_while
	exit:
         	mov ah,4ch
		int 21h
	main endp
end main