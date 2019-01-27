.model small
.stack 100h
.data

enter_     db 0dh,0ah,'enter a hex digit= $'
decimal_   db 0dh,0ah,'in decimal it is= $'
question_  db 0dh,0ah,'do you want to do it again? $'
illegal_   db 0dh,0ah,'illegal character $'
correct_   db 0dh,0ah,'enter y or n $'
sorry_     db 0dh,0ah,'sorry u have failed three times. $'

.code

main proc

    mov ax,@data
    mov ds,ax
    mov cx,0
    
enter:
 
    lea dx,enter_
    mov ah,9
    int 21h
    
    mov ah,1
    int 21h
    mov bl,al
    
    cmp bl,'0'
    jl illegal
    
    cmp bl,'9'
    jle out_dec
    
    cmp bl,'A'
    jl illegal
    
    cmp bl,'F'
    jg illegal
    jmp out_char
    
illegal:
    
    inc cx
    cmp cx,3
    je sorry
    
    lea dx,illegal_
    mov ah,9
    int 21h
    jmp enter

    
    
out_dec:
    
    lea dx,decimal_
    mov ah,9
    int 21h
    
    mov dl,bl
    mov ah,2
    int 21h
    
    jmp question
    
out_char:

    lea dx,decimal_
    mov ah,9
    int 21h
    
    mov dl,'1'
    mov ah,2
    int 21h
    
    mov dl,bl
    sub dl,17
    int 21h
    
    jmp question
    
question:

    lea dx,question_
    mov ah,9
    int 21h
    
    mov ah,1
    int 21h
    cmp al,'y'
    je enter
    cmp al,'n'
    je exit
    
    lea dx,correct_
    mov ah,9
    int 21h
    
    jmp question 
    
sorry:

    lea dx,sorry_
    mov ah,9
    int 21h
    
exit:

    mov ah,4ch
    int 21h
    
main endp
end main
    