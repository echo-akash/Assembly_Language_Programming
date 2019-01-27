.model small
.stack 100h
.data
	A dw 100 dup(0)
	var dw 0
.code
main proc 
    	mov ax,@data
    	mov ds,ax
    	lea si,A
    
start:  
     	xor bx,bx
     	xor ax,ax
while_:
   	mov ah,1
    	int 21h
    	cmp al,0dh		;carriage return
    	je next
    	cmp al,20h		;when space then level
    	je level
    	and ax,000Fh		;decimal input
   	push ax
    	mov ax,10
    	mul bx
    	pop bx
    	add bx,ax		;end decimal_input code
    	jmp while_
level:				;space
    	mov ax,bx   
    	mov [si],bx		;putting value in si
    	inc var
    	add si,2		;'w' so adding 2 in si
    	jmp start		;after 1 space take next input
next:   
				;carriage return
	mov ax,bx   
     	mov [si],bx		;here the value of si has incremented after the last space
	inc var
	mov ah,2		;newline print
	mov dl,0dh
	int 21h
	mov dl,0ah		
	int 21h

	mov bx,var		;var for how many output
	lea si,A		
	xor si,si
	dec bx
	mov cx,bx		
	mov dx,si		;save array address
SORT_LOOP:
	mov si,dx		;si pts to array
	mov cx,bx		;no of comparision to make
	mov di,si		;di pts to largest element
	mov ax,[di]		;ax has largest element
	
FIND_BIG:
	add si,2		;si pts to next element
	cmp [si],ax
	jng @next		;no go on
	mov di,si		;yes, mov di
	mov ax,[di]		;al has largest element
@next:
	loop FIND_BIG
			
	push ax			; swaping
	mov ax,[si]
	xchg ax,[di]
	mov [si],ax
	pop ax
	dec bx
	jne SORT_LOOP
				;output
output:	
	lea di,A
	
l2:
    	mov ax,[di]		
    	xor cx,cx
    	mov bx,10
top_:
    	xor dx,dx
    	div bx
    	push dx
    	inc cx
    	or ax,ax
    	jne top_
    	mov ah,2
l1:
    	pop dx
    	add dl,48
    	int 21h
   	loop l1
    	mov ah,2
    	mov dl,' '
   	int 21h
    	add di,2
    	dec var
    	cmp var,0
    	jne l2
    	mov ah,4ch		;dos exit
    	int 21h
main  endp
end main