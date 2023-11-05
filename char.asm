.model small
.stack 100h
.data
    s1 db 10, 13, 'nhap ky tu: $'
.code
    main proc
        mov ax, @data
        mov ds, ax
        
        mov ah, 9
        lea dx, s1
        int 21h
        mov ah, 1 
        mov bl, al  
        int 21h
       
        cmp bl, 97
        jge chuthuong   
        mov dl, 65
        jmp inkytu
        
chuthuong:
        mov al, 97
inkytu:
        mov ah, 2   
        int 21h
        add dl, 1
        cmp dl, bl
        jle inkytu
      
        mov ah, 4ch
        int 21h
        main endp
   end main
        
        