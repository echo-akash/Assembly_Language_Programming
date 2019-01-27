.model small
.stack 100h
.data

enter_  db  0dh,0ah,'enter a year=$'
ly      db  0dh,0ah,'leap year $'
nly     db  0dh,0ah,'not leap year $'
again_  db  0dh,0ah,'do u want to continue?$'
press_  db  0dh,0ah,'plz press y or n.$'

.code

main proc

    mov ax,@data
    mov ds,ax
    
    
dec_input:
    
       
    lea dx,enter_
    mov ah,9
    int 21h
    


    mov bx,0
    
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

    mov ax,bx
    push ax
    push ax
    cwd
    
div_4:

    mov bx,4
    div bx
    cmp dx,0
    jne not_leap_year
    je div_100
    
div_100:

    pop ax
    mov bx,100
    div bx
    cmp dx,0
    je div_400
    jne leap_year
    
div_400:
    
    pop ax
    mov bx,400
    div bx
    cmp dx,0
    je leap_year
    jne not_leap_year

     
    
not_leap_year:

    lea dx,nly
    mov ah,9
    int 21h
    jmp again
    
leap_year:

    lea dx,ly
    mov ah,9
    int 21h
    jmp again
    
again:

    lea dx,again_
    mov ah,9
    int 21h
    
    mov ah,1
    int 21h
    cmp al,'y'
    je dec_input
    cmp al,'n'
    je exit
    
    lea dx,press_
    mov ah,9
    int 21h
    jmp again
    
exit:

    mov ah,4ch
    int 21h
    
    
main endp
end main
 
    
