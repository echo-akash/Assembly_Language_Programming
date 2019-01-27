.model small
.stack 100h
.data

var        db   '?'
enter_     db   0dh,0ah,'enter a character=$'
ascii_     db   0dh,0ah,'ASCII code in binary=$'
num_       db   0dh,0ah,'number of 1=$'
continue_  db   0dh,0ah,'do u want to continue?$'
key_       db   0dh,0ah,'press y or n.$'
.code

main proc

    mov ax,@data
    mov ds,ax
    
input:

    lea dx,enter_
    mov ah,9
    int 21h
    
    mov cx,8
    mov var,0
    
    mov ah,1
    int 21h
    mov bl,al
    jmp bin_out
    
bin_out:

    lea dx,ascii_
    mov ah,9
    int 21h
    
out_:

    shl bl,1
    jc one
    jnc zero
    
one:

    inc var
    mov ah,2
    mov dl,'1'
    int 21h
    jmp for
    
zero:

    mov ah,2
    mov dl,'0'
    int 21h
    jmp for
    
for:

    loop out_
    
num_of_1:

    lea dx,num_
    mov ah,9
    int 21h
    
    mov ah,2
    mov dl,var
    add dl,48
    int 21h
    
continue:
    
    lea dx,continue_
    mov ah,9
    int 21h
    
    mov ah,1
    int 21h
    cmp al,'y'
    je  input
    cmp al,'n'
    je exit
    
    lea dx,key_
    mov ah,9
    int 21h
    jmp continue
    
exit:

    mov ah,4ch
    int 21h
    
main endp
end main
    
    