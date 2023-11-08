.model small
.stack 100h
.data
    s1 db 'Nhap so thu 1: $' 
    s2 db 10, 13, 'Nhap so thu 2: $'
    s3 db 10, 13, 'ket qua: $'
    a  dw 0
    b  dw 0
.code 
    main proc
        mov ax, @data
        mov ds, ax
        
        mov ah ,9
        lea dx, s1
        int 21h
        
        mov bx, 10

    nhap1:        
        mov ah, 1
        int 21h  
        mov ah, 0
        cmp al, 13
        je enter1
        sub al, 48   
        mov cx, ax 
        mov ax, a
        mul bx
        add ax, cx
        mov a, ax
        jmp nhap1
        
    enter1:
        mov ah, 9
        lea dx, s2
        int 21h
        
    nhap2:    
        mov ah, 1
        int 21h
        cmp al, 13
        je enter2
        mov ah, 0
        sub al, 48
        mov cx, ax
        mov ax, b
        mul bx
        add ax, cx
        mov b, ax
        jmp nhap2
        
    enter2: 
        mov ax, b
        add a, ax
        mov cx, 0                            
        mov ax, a          
        
    chia:
        mov dx, 0 
        div bx
        push dx 
        inc cl
        cmp ax, 0
        je tiep
        jmp chia
        
        
    tiep:
        mov ah, 9
        lea dx, s3  
        int 21h
    inra:    
        pop dx
        add dl, 48
        mov ah, 2
        int 21h
        loop inra  
        
        mov ah, 4ch
        int 21h
    main endp
end    