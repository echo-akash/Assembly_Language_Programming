.model small
.stack 100h
.data

newline db 0dh,0ah,'$'
var db 0
.code

main proc

    mov ax,@data
    mov ds,ax

    
    mov cl,4
    xor bx,bx
    
input:

    mov ah,1
    int 21h
    cmp al,0dh
    je new_line
    sub al,48
    mov ah,0
    add bx,ax
    jmp input
    
new_line:

    lea dx,newline
    mov ah,9
    int 21h
    
output:

while:

    
    mov dl,bh
    shr dl,cl
    cmp dl,10
    jge letter_
    jmp digit_

letter_:
    
     add dl,55
     mov ah,2
     int 21h
     jmp check

digit_:

    add dl,48
    mov ah,2
    int 21h
    
check:
    
    rol bx,cl
    inc var
    cmp var,4
    je exit
    jmp while
    
exit:

    mov ah,4ch
    int 21h
    
main endp 
end main