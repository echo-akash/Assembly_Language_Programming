.model small
.stack 100h
.data

newline db      0dh,0ah,'$'
enter_  db      0dh,0ah,'type a character=$'
out_    db      'the ascii code in hex=$'
var     db      0
    
.code

main proc

    mov ax,@data
    mov ds,ax

    
    mov cl,4
    xor bl,bl
    
input:

    lea dx,enter_
    mov ah,9
    int 21h
    
    mov ah,1
    int 21h
    mov bl,al

new_line:

    lea dx,newline
    mov ah,9
    int 21h
    
output:

    lea dx,out_
    mov ah,9
    int 21h
    

while:

    
    mov dl,bl
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
    
    rol bl,cl
    inc var
    cmp var,2
    je exit
    jmp while
    
exit:

    mov ah,4ch
    int 21h
    
main endp 
end main