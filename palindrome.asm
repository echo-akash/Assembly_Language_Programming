.model small
.stack 100h
.data

msg db 100 dup(0)
msg1 db 100 dup(0)
yes_ db 'yes$'
no_ db 'no$'

.code

main proc

    mov ax,@data
    mov ds,ax
    mov es,ax
    
    
    lea di,msg
    cld
    xor bx,bx
    
input:

    mov ah,1
    int 21h
    
    cmp al,0dh
    je newline
    
    cmp al,8h
    jne else
    
    dec di
    dec bx
    
else:

    stosb
    inc bx
    jmp input
    
newline:
    
    mov ah,2
    mov dl,0dh
    int 21h
    mov dl,0ah
    int 21h
    
    
palindrome:
    
    mov cx,bx
    dec bx
    lea si,msg
    add si,bx
    lea di,msg1
    std
    
rev:

    movsb
    add di,2
    loop rev
    
    lea si,msg
    lea di,msg1
    cld
    inc bx
    mov cx,bx
    repe cmpsb
    je yes
    jmp no
    
yes:

    lea dx,yes_
    mov ah,9
    int 21h
    jmp exit
    
no:

    lea dx,no_
    mov ah,9
    int 21h
    
    
    
    
    
exit:

    mov ah,4ch
    int 21h
    
main endp
end main