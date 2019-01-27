.model small
.stack 100h
.data

newline db 0dh,0ah,'$'

.code

main proc

    mov ax,@data
    mov ds,ax
    xor bx,bx
    mov ah,1
    
    
binary_input:
    
    int 21h
    cmp al,0dh
    je binary_output
    
    and al,0Fh               ;convert to bin value
    shl bx,1                 ;make room for bin value
    or  bl,al                ;put value into bx
    jmp binary_input



binary_output:

    lea dx,newline
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
    jmp next
    
zero:
    mov ah,2
    mov dl,'0'
    int 21h
    jmp next
    
next:
    loop output
    
exit:
    
    mov ah,4ch
    int 21h
    
main endp
end main
    

    
    