.model small
.stack 100h

.data
	string1 db 'abcd$'
	string2 db 5 dup(0)
.code
main proc
	mov ax,@data
	mov ds,ax
	mov es,ax
	
	lea si,string1
	lea di,string2
	
	mov cx,5
	
	cld
	
top:

	movsb 
	loop top
	
	lea dx,string2
	mov ah,9
	int 21h

	mov ah,4ch
	int 21h

main endp
end main