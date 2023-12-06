.model small
.stack 100h
.data
    s1 db 'Nhap so: $'
    s2 db 10, 13, 'Chuyen doi sang nhi phan: $'
    a  dw 0
.code
    Truong_Van_minh proc
        mov ax, @data
        mov ds, ax
        
        mov ah, 9
        lea dx, s1
        int 21h 
        mov bx, 10
    nhap:    
        mov ah, 1
        int 21h
        cmp al, 13
        je enter
        sub al, 48
        mov ah, 0
        mov cx, ax      
        mov ax, a
        mul bx      
        add ax, cx
        mov a, ax
        jmp nhap        
        
        
    enter:        
        mov ah, 9
        lea dx, s2
        int 21h  
        mov cx, 0 
        mov bx, 2        
        mov ax, a
    chia:    
        mov dx, 0
        div bx
        push dx
        inc cl
        cmp ax, 0
        je xuat
        jmp chia  
        
    xuat:
        pop dx
        add dl, 48
        mov ah, 2
        int 21h
        loop xuat
        
        mov ah, 4ch
        int 21h
    Truong_Van_minh endp
end    
        
                   