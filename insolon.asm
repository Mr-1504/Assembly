.model small
.stack 100h
.data
    s1 db 'nhap: $'
    s2 db 10, 13, 'ket qua: $'     
    a dw 0
    b dw 0
.code
    main proc
        mov ax, @data
        mov ds, ax
        
        mov ah, 9
        lea dx, s1
        int 21h
        
        mov cl, 0
        mov bx, 10
nhap:        
        mov ah, 1
        int 21h
        cmp al, 13
        je enter  
        inc cl  
        mov ah, 0 
        sub al, 48
        mov b , ax
        mov ax, a
        mul bx  
        add ax, b
        mov a, ax
        jmp nhap

enter:        
        mov ah, 9
        lea dx, s2
        int 21h        
        
chia:   
        mov dx, 0   
        mov ax, a
        div bx 
        push dx    
        mov a, ax
        cmp ax, 0
        je inra
        jmp chia          
inra:    
        pop dx  
        mov ah, 2 
        add dl, 48  
        int 21h
        sub cl, 1
        cmp cl, 0
        jg inra 
         
        mov ah, 4ch
        int 21h
    main endp
end    