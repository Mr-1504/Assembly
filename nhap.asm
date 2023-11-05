                                   .model small
.stack 100h
.data   
    s1 db 'nhap n: $'
    s2 db 10, 13, 's = $'  
    enter   equ 13   
    a db 0
.code
    main proc           
        mov ax, @data
        mov ds, ax
        
      
     khong  :
        mov ah, 1   
        int 21h
        mov cl, al
        cmp cl, enter
        je ketthuc
        mov al, bh 
        mov bl, 10
        mul bl
        mov bh, al 
        add bh, cl
        jmp khong
        
        
      ketthuc:
        mov ah, 9
        lea dx, s2
        int 21h   
        
        mov cl, 100  
        mov ah, 0
        div cl
        mov bl, ah
        mov cl, al
        mov ah, 2
        mov dl, al
        add dl, 48
        int 21h  
        
        mov ah, 2
        mov dl, al
        add dl, 48
        int 21h
                 
        mov dl, bh
        add dl, 48
        int 21h
        mov ah, 4ch
        int 21h
        
        mov ah, 4ch
        int 21h  
                 
    main endp      
end main