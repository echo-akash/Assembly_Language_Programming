.model small
.stack 100h
.data
msg db 100 dup(0)
msg1 db 100 dup(0)
no db 'not palin$'
yes db 'palin$'
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
input:    cmp al,0dh
    je reverse    
cmp al,8h    
jne store
   dec di
    dec bx
    jmp again
    store:   stosb
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
     output:
  lea dx,newline    
mov ah,9    
int 21h
    lea si,msg1
    cld
   mov cx,bx   
 mov ah,2   
for:
   lodsb
    mov dl,al
    int 21h
    loop for
    call palindrome
exit:    mov ah,4ch
    int 21h    
main endp
palindrome proc
mov cx,bx	
lea si,msg
	lea di,msg1
	repe cmpsb
	jl noo
	jg noo
	mov ah,9
	lea dx,yes
	int 21h
	jmp finish
noo :	mov ah,9
	lea dx,no
	int 21h
finish:	ret
palindrome endp
end main 

