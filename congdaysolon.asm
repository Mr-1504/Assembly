.model small
.stack 100h
.data
    s1 db 'nhap: $'
    s2 db 10, 13, 'ket qua: $'     
    a dw 0
    b dw 0  
.code
    Truong_Van_minh proc
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
        
        mov cx, 0
        mov bx, 0
        mov ax, 0 
congtiep:                   
        add ax, bx
        inc bx 
        cmp bx, a
        jg ok
        jmp congtiep
ok:           
        mov bx, 10
chia:   
        mov dx, 0 
        div bx 
        push dx  
        inc cl  
        cmp al, 0
        je inra
        jmp chia          
inra:    
        pop dx  
        mov ah, 2 
        add dl, 48  
        int 21h
        loop inra 
         
        mov ah, 4ch
        int 21h
    Truong_Van_minh endp
end    