.model small
.stack 100h
.data  
       tb1 db 'Nhap chuoi: $'
       tb2 db 10, 13, 'chuoi dao nguoc: $'  
       s1  db 10, 13, 'chuoi vua nhap: $'
       str db 100 dup ('$')
.code
main proc   
        mov ax, @data
        mov ds, ax
       
        mov ah, 9
        lea dx, tb1
        int 21h
       
        mov si, 0    
        
    nhap:   
        mov ah, 1
        int 21h
        cmp al, 13
        je enter
        mov str[si], al  
        inc si
        jmp nhap      
    enter:            
        mov ah, 9  
        lea dx, s1
        int 21h
        lea dx, str
        int 21h
        lea dx, tb2
        int 21h  
        sub si, 1
    lap1:    
        mov ah, 2
        mov dl, str[si]
        int 21h   
        sub si, 1
        cmp si, 0
        jge lap1   
                
        mov ah, 4ch
        int 21h
    main endp
end main