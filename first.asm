.model small
.stack 100h
.data

.code
main proc
	mov dl,'?'
	mov ah,2
	int 21h	

	mov ah,1
	int 21h	;input
	
	mov dl,al
	mov ah,2
	int 21h	;output

	mov ah,4ch
	int 21h	;dos exit 
main endp
end main