.model small
.stack 100h
.data 
A dw 1,2,4
  dw 3,4,4
  dw 1,1,1
B dw 1,2,2
  dw 3,4,2
  dw 1,1,1
two db 3
.code
main proc
	mov ax,@data
	mov ds,ax
         
	xor bx,bx 
         
        
         
repeat:
        mov cx,3
        mov si,0

for:       
        mov dx,A[bx][si]
        add dx,B[bx][si]
        add si,2
        mov ah,2
        add dx,48
        int 21h
        mov dl,' '
        int 21h
        loop for	
        mov dl,0ah
        mov ah,2
        int 21h
        dec two
        mov dh,two
        cmp dh,0
        je exit
        add bx,6
         
        jmp repeat

exit:
	mov ah,4ch
	int 21h

main endp
end main