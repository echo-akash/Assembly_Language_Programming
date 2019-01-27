.model small
.stack 100h
.data

maximum db 0dh,0ah,'maximum is=$'
minimum db 0dh,0ah,'minimum is=$'
no db 0dh,0ah,'no capital letter was typed :o $'

max db '@'
min db '['
.code

main proc

  mov ax,@data
  mov ds,ax
  
  input:
  
    mov ah,1
    int 21h
    cmp al,0dh
    je no_cap
    
    cmp al,'A'
    jl input
    
    cmp al,'Z'
    jg input
    
    cmp al,max
    jg highest
    
ck_min:

    cmp al,min
    jl lowest
    jmp input
    
highest:

    mov max,al
    jmp ck_min
    
lowest:

    mov min,al
    jmp input
    
no_cap:

    cmp max,'@'
    je next
    jmp output
    
next:
    
    cmp min,'['
    je message
    jmp output
    
message:

   
    lea dx,no
    mov ah,9
    int 21h
    jmp exit
    
    
output:

    
    lea dx,maximum
    mov ah,9
    int 21h
    
    mov ah,2
    mov dl,max
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
    
    


