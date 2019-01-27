.model small
.stack 100h
.data

enter_  db     0dh,0ah,'enter a number=$'
per_    db     0dh,0ah,'perfect number$'
no_     db     0dh,0ah,'not perfect number$'
var     dw      0
.code

main proc

    mov ax,@data
    mov ds,ax
    mov bx,0
    mov cx,0
    
    lea dx,enter_
    mov ah,9
    int 21h
    
input:

    mov ah,1
    int 21h
    cmp al,0dh
    je check
    
    sub al,48
    mov ah,0
    push ax
    
    mov ax,10
    mul bx
    pop bx
    add bx,ax
    jmp input
    
check:

    mov var,bx
    dec bx
    mov cx,bx
    mov bx,0
    
check_per:

    mov ax,var
    cwd
    div cx
    cmp dx,0
    je add_
    jne loop_
    
add_:

    add bx,cx
    jmp loop_
    
loop_:

    loop check_per
    
    cmp bx,var
    je perfect
    jmp notperfect
    
perfect:

    lea dx,per_
    mov ah,9
    int 21h
    jmp exit
    
notperfect:

    lea dx,no_
    mov ah,9
    int 21h

exit:
    
    mov ah,4ch
    int 21h
    
main endp
end main
    
    