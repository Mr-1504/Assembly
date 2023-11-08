.model small
.stack
.data
    s1 db 'Nhap xau, nhap 0 de dung: $'
    s2 db 10, 13, 'Xau vua nhap: $'
    s3 db 10, 13, 'So so chan: $'
    s  db 100 dup(?) 
.code
    main proc
        mov ax, @data
        mov ds, ax
        
        mov ah, 9
        lea dx, s1
        int 21h
       
        mov bh, 0
        mov bl, 2
        mov si, 0
    nhaptiep:    
        mov ah, 1
        int 21h
        cmp al, 48 
        je enter
        mov s[si], al  
        div bl
        cmp ah, 0
        je  tinh  
        jmp tiep
    tinh:
        inc bh
    tiep:    
        inc si
        jmp nhaptiep             
         
    enter:  
        mov s[si], '$'
        
        mov ah, 9
        lea dx, s2
        int 21h
        lea dx, s
        int 21h
        lea dx, s3
        int 21h
        mov ah, 2
        mov dl, bh 
        add dl, 48
        int 21h
        
    ketthuc:    
        
        mov ah, 4ch
        int 21h
        
    main endp
end    