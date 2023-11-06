.model small
.stack 100h
.data 
    s0 db 'Tinh mot phep chia het: $'
    s1 db 10, 13, 'Nhap so bi chia: $' 
    s2 db 10, 13, 'Nhap so chia: $'
    s3 db 10, 13, 'ket qua: $'  
    s4 db 10, 13, 'so chia khong hop le!$' 
    s5 db 10, 13, 'CO DU!$'
    a  dw 0
    b  dw 0
.code 
    main proc
        mov ax, @data
        mov ds, ax
        
        mov ah ,9 
        lea dx, s0
        int 21h
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
        cmp b, 0
        je tbao 
        mov ax, a 
        mov cx, b
        div cx    
        mov a, ax
        mov cl, 0  
        cmp dx, 0
        je chia
        mov ah, 9
        lea dx, s5
        int 21h          
        
    chia:
        mov dx, 0        
        mov ax, a
        div bx
        push dx 
        inc cl
        cmp ax, 0
        je tiep
        mov a, ax  
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
        sub cl, 1
        cmp cl, 0
        jg inra    
        jmp ketthuc
     tbao:
        mov ah, 9
        lea dx, s4
        int 21h
     ketthuc:    
        mov ah, 4ch
        int 21h
    main endp
end    