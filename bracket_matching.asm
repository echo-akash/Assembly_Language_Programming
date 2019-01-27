.model small
.stack 100h
.data

match_      db      0dh,0ah,'bracket matched$'
nomatch_    db      0dh,0ah,'not matched$'
right_      db      0dh,0ah,'too many left bracket$'
left_      db       0dh,0ah,'too many right bracket$'
var         db      0

.code

main proc
    
    mov ax,@data
    mov ds,ax
    mov bl,0
    mov cl,0
    
input:

    mov ah,1
    int 21h
    
    cmp al,0dh
    je check
    
    cmp al,'('
    je push_
    
    cmp al,'{'
    je push_
    
    cmp al,'['
    je push_
    
    cmp al,')'
    je pop1_
    
    cmp al,'}'
    je pop2_
    
    cmp al,']'
    je pop3_
    
    jmp input
    
pop1_:

    
    pop ax
    inc bl
    dec cl
    cmp ax,'('
    jne inp
    jmp input
    
pop2_:

    
    pop ax
    inc bl
    dec cl
    cmp ax,'{'
    jne inp
    jmp input
    
pop3_:

    
    pop ax
    inc bl
    dec cl
    cmp ax,'['
    jne inp
    jmp input
    
inp:

    mov ah,1
    int 21h
    cmp al,0dh
    je not_match
    jmp inp
    

    
not_match:

    lea dx,nomatch_
    mov ah,9
    int 21h
    jmp exit
           
push_:

    mov ah,0
    push ax
    inc var
    inc cl
    jmp input
 
check:

 
    cmp var,bl
    je match
    jg right
    jl left
    
right:

    lea dx,right_
    mov ah,9
    int 21h
    jmp exit
    
left:

    lea dx,left_
    mov ah,9
    int 21h
    jmp exit
    
    
    
match:

    lea dx,match_
    mov ah,9
    int 21h
    jmp exit
    
      
exit:

    mov ah,4ch
    int 21h
    
main endp
end main
    