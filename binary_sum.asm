.model small
.stack 100h
.data

newline db 0dh,0ah,'$'
enter_  db 0dh,0ah,'enter a number=$'
sum_ db 0dh,0ah,'the sum is=$'

var1    dw 0
.code

main proc

    mov ax,@data
    mov ds,ax
    
    
    call binary_input
    mov var1,bx
    
    call binary_input
    
    add bx,var1
    
    lea dx,sum_
    mov ah,9
    int 21h
   

      mov cx,16
    
output:

    shl bx,1
    jc one
    jnc zero
    
one:
    mov ah,2
    mov dl,'1'
    int 21h
    jmp for
    
zero:

    mov ah,2
    mov dl,'0'
    int 21h
    jmp for
    
for:
    loop output
    
exit:

    mov ah,4ch
    int 21h
 
 main endp
    
binary_input proc


    lea dx,enter_
    mov ah,9
    int 21h
    
    mov ah,1
    xor bx,bx
    
    
input:

    int 21h
    cmp al,0dh
    je new_line
    and al,0fh
    shl bx,1
    or bl,al
    jmp input
    
new_line:

    lea dx,newline
    mov ah,9
    int 21h
    
ret
binary_input endp
   

end main
    