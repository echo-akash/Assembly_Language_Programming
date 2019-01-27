.model small
.stack 100h
.data
.code

main proc

    mov ax,@data
    mov ds,ax
    mov es,ax
    
    
main endp

read_string proc

    cld
    xor bx,bx
    mov ah,1
    int 21h
    
    cm