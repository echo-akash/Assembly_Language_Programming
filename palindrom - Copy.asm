.model small
.stack 100h
.data

msg db 100 dup(0)
msg1 db 100 dup(0)
p db 'Palindrom$'
n db 'Not Palindrom'
newline db 0dh,0ah,'$'

.code
main proc

    mov ax,@data
    mov ds,ax
    mov es,ax
    
    lea di,msg
    cld
    xor bx,bx
    mov ah,1
    int 21h

input:   
    cmp al,0dh
    je reverse
    cmp al,8h
    jne store
    dec di
    dec bx
    jmp again
    
store:

    stosb
    inc bx
    
again:

    int 21h
    jmp input
    

reverse:

   dec bx
   lea si,msg
   add si,bx
   lea di,msg1
   std
   inc bx
   mov cx,bx
   
str_rev:
    movsb
    add di,2
    loop str_rev  
 
     
pal:	mov cx,8
	lea si,msg
	lea di,msg1  

	cld
	repe cmpsb
	jl str1_f
	jg str2_f

	
	lea dx,p
	mov ah,9
	int 21h
	jmp dis

str1_f:
	
	lea dx,n
	mov ah,9
	int 21h
	jmp dis

str2_f:	
	lea dx,n
	mov ah,9
	int 21h	
dis:   
    mov ah,4ch
    int 21h
    
main endp
end main
    
