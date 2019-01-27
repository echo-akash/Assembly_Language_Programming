.model small
.stack 100h
.data

max db '/'
min db ':'
maximum db 'maximum= $'
minimum db 'minimum= $'
newline db 0dh,0ah,'$'
.code

main proc


    mov ax,@data
    mov ds,ax
    
    mov ah,1
    
input:
    
    int 21h
    cmp al,0dh
    je output
   
    
    cmp al,max
    jg highest
    
ck_low:

    cmp al,min
    jl lowest
    jmp input
    
highest:

    mov max,al
    jmp ck_low
    
lowest:

    mov min,al
    jmp input
    
output:

    lea dx,newline
    mov ah,9
    int 21h

    lea dx,maximum
    mov ah,9
    int 21h
    
    mov ah,2
    mov dl,max
    int 21h
    
    
    lea dx,newline
    mov ah,9
    int 21h
    
    lea dx,minimum
    mov ah,9
    int 21h
    
    mov ah,2
    mov dl,min
    int 21h
    
exit:

    mov ah,4ch
    int 21h
    
main endp
end main
    
    
    
    