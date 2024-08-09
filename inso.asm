.model small
.stack 100h
.data
    s1 db 'nhap: $'
    s2 db 10, 13, 'ket qua: $'     
    a db 0
.code
    Truong_Van_minh proc
        mov ax, @data
        mov ds, ax
        
        mov ah, 9
        lea dx, s1
        int 21h    
        
        mov cx, 0
        mov bl, 10
nhap:        
        mov ah, 1
        int 21h
        cmp al, 13
        je enter  
        inc cl  
        sub al, 48
        mov bh , al
        mov al, a
        mul bl  
        add al, bh
        mov a, al
        jmp nhap

enter:        
        mov ah, 9
        lea dx, s2
        int 21h       
        
chia:   
        mov ah, 0  
        mov al, a
        div bl 
        push ax 
        mov ah, 0  
        mov a, al
        cmp al, 0
        je inra
        jmp chia          
inra:    
        pop dx  
        mov ah, 2 
        add dh, 48  
        mov dl, dh
        int 21h
        loop inra 
         
        mov ah, 4ch
        int 21h
    Truong_Van_minh endp
end    