.model small
.stack 100h
.data
newline db 0dh,0ah,'$'
var dw '?'
count db '?'
.code

main proc

    mov ax,@data
    mov ds,ax
    
    mov ah,1
    int 21h
    sub al,48
    mov count,al
    mov bl,1
    
    mov cx,1
    mov var,cx
    
    lea dx,newline
    mov ah,9            ;newline after input
    int 21h
    
    jmp star
   
again:
    
    inc var
    mov cx,var
     
star:
    
    mov ah,2
    mov dl,'*'
    int 21h
    loop star
    
    lea dx,newline
    mov ah,9
    int 21h
    
    inc bl
    cmp bl,count
    jg exit
    jmp again
    
exit:

    mov ah,4ch
    int 21h
    
    
main endp
end main
