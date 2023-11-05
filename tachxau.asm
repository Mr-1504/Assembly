.model small
.stack 100h
.data
    s1 db 'nhap xau: $'
    s2 db 10, 13, 'xau hoa: $'
    s  db 100 dup(?) 
    a  db 100 dup(?)                   
    i  dw 0  
    d  dw 0
    s4 db 10, 13, 'xau thuong: $'  
.code
    main proc
           mov ax, @data
           mov ds, ax
           
           mov ah, 9
           lea dx, s1
           int 21h
            mov cx, 0  
            mov i, cx
           mov bx, 0
nhaptiep:           
           mov ah, 1
           int 21h  
           cmp al, 13
           je enter     
           cmp al, 97
           jl thuong 
           jmp hoa
thuong:
           mov s[bx], al
           inc bx
           jmp nhaptiep   
hoa:         
           mov i, bx
           mov bx, d
           mov a[bx], al
           inc bx
           mov d, bx
           mov bx, i  
           jmp nhaptiep 
enter:      
           mov s[bx], '$'    
           mov bx, d
           mov a[bx], '$'
           mov ah, 9
           lea dx, s2
           int 21h
           
           mov ah, 9
           lea dx, s
           int 21h 
           
           mov ah, 9
           lea dx, s4
           int 21h
           
           mov ah, 9
           lea dx, a
           int 21h
           
           mov ah, 4ch
           int 21h
        main endp
    end
           
           