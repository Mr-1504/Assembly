.model small
.stack 100h
.data   
    s1 db 'nhap n: $'
    s2 db 10, 13, 's = $'
.code
    main proc           
        mov ax, @data
        mov ds, ax
        
        mov ah, 9
        lea dx, s1
        int 21h
        
        mov ah, 1
        int 21h
        sub al, 48
        mov bl, al
        
        mov ah, 9
        lea dx, s2
        int 21h
        
        mov cl, 1  ; i = 1
        mov al, 0  ; s = 0
congtiep:        
        add al, cl ; s = s + 1
        inc cl     ; add cl, 1
        cmp cl, bl
        jle congtiep
        
        
        mov cl, 10  
        mov ah, 0
        div cl
        mov bl, ah
        
        mov ah, 2
        mov dl, al
        add dl, 48
        int 21h
                 
        mov dl, bh
        add dl, 48
        int 21h
        mov ah, 4ch
        int 21h
        
        
        
                 
    main endp      
end main