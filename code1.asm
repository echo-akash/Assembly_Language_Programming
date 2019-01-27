.model small
.stack 100h
.data
    msg1 db 'Enter two number$'
    msg2 db 'Sum is: $'
    
.code

    main proc
        
        mov ax, @data
        mov ds, ax
        lea dx, msg1
        mov ah, 9
        int 21h
        
        mov dl, 0Ah
        mov ah, 2
        int 21h
        
        
        mov dl, 0Dh
        mov ah, 2
        int 21h
        
        
        mov ah, 1
        int 21h    ;input 
        
        mov bh, al ; copy first number
        
        mov ah, 1  ;space
        int 21h
        
        
        mov ah, 1
        int 21h
        
        add bh, al ; summing
        
        
        sub bh, 48 ;converting to number
        
        mov dl, 0Ah
        mov ah, 2
        int 21h
        
        
        mov dl, 0Dh
        mov ah, 2
        int 21h
        
        mov ax, @data
        mov ds, ax
        lea dx, msg2
        mov ah, 9
        int 21h
        
        
                
        mov dl, bh
        mov ah, 2
        int 21h    ;output
        
        mov ah, 4Ch ;DOS exit
        int 21h
        
        main endp
    end main
    