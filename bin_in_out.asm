.model small
.stack 100h
.data

newline db 0dh,0ah,'$'

.code

main proc

    mov ax,@data
    mov ds,ax
    
    mov ah,1
    xor bx,bx
    mov cx,16
    
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
end main
    