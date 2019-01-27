.model small
.stack 100h
.data

newline db 0dh,0ah,'$'
enter_  db 'enter a number=$'
out_    db 'the number is=$'
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
    je new_line
    
    sub al,48
    mov ah,0
    push ax
    
    mov ax,10
    mul bx
    pop bx
    add bx,ax
    jmp input
    
new_line:
    
    lea dx,newline
    mov ah,9
    int 21h
    
    lea dx,out_
    mov ah,9
    int 21h
    
output:

    mov ax,bx
    mov bx,10
    
dec_out:

    cwd
    div bx
    push dx
    inc cx
    cmp ax,0
    je pop_
    jmp dec_out
    
pop_:

    pop dx
    add dx,48
    mov ah,2
    int 21h
    loop pop_
    
    
exit:

    mov ah,4ch
    int 21h
    
main endp
end main
    
    