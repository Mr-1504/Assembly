            .model small
.stack 100h
.data
    s1 db 'nhap a: $'
    s2 db 10, 13, 'nhap b: $'
    s3 db 10, 13, 'a > b$'
    s4 db 10, 13, 'a < b$'  
    s5 db 10, 13, 'a = b$'  
    s6 db  ' '
.code
    main proc
        mov ax, @data
        mov ds, ax
            
        mov ah, 2    
        mov dl, 57   
        
        intiep:   
        int 21h   
        
        mov bl, dl   
        
        mov ah, 2
        mov dl, 32
        int 21h
        
        mov dl, bl   
        sub dl, 1
        cmp dl, 48
        jge intiep
        
        mov ah, 4ch
        int 21h
        
        main endp
end main