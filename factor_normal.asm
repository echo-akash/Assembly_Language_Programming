.model small
.stack 100h
.data

newline db 0dh,0ah,'$'

.code

main proc

    mov ax,@data
    mov ds,ax
    
    mov ah,1
    int 21h
    mov bl,al
    
    lea dx,newline
    mov ah,9
    int 21h
    
    mov al,bl
    mov ah,0
    sub al,48
    mov cx,ax
    mov bx,ax
    
    
factor_:

    mov ax,bx
    cwd
    div cx
    cmp dx,0
    jne again
    mov ah,2
    mov dx,cx
    add dl,48
    int 21h
    mov dl,' '
    int 21h
    
again:

    loop factor_
    
exit:
    
    mov ah,4ch
    int 21h
    
main endp
end main
    
    
