.model small
.stack 100h
.data

newline     db 0d,0ah,'$'
enter_      db 0dh,0ah,'enter a binary num=$'
out_        db 0dh,0ah,'output in hex=$'
var         db 0

.code

main proc
    
    mov ax,@data
    mov ds,ax
    
    lea dx,enter_
    mov ah,9
    int 21h
    xor bx,bx
    mov cl,4
    
input:

    mov ah,1
    int 21h
    cmp al,0dh
    je output
    and al,0fh
    shl bx,1
    or bl,al
    jmp input
    
output:

    lea dx,out_
    mov ah,9
    int 21h
    
hex_out:

    mov dl,bh
    shr dl,cl
    cmp dl,10
    jge letter
    jmp digit
    
letter:
    
    add dl,55
    mov ah,2
    int 21h
    jmp check
    
digit:

    add dl,48
    mov ah,2
    int 21h
    jmp check
    
check:

    rol bx,cl
    inc var
    cmp var,4
    je exit
    jmp hex_out
    
exit:

    mov ah,4ch
    int 21h
    
main endp
end main

    