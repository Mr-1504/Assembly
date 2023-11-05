.model small
.stack 100h
.data
    ;Khai bao du lieu   
    s db 'Nhap ky tu $'    
    s2 db 10,13, 'ky tu vua nhap $'
.code    
    main proc     
        ;chuyen data
       mov ax, @data
       mov ds, ax
       mov ah,9        
       lea dx, s
       int 21h       
             
             ;nhap ky tu
       mov ah,1   
       int 21h    
       mov bl, al
       
       
       mov ah,9
       mov dx, s2 offset 
       int 21h   
       
       mov ah,2
       mov dl, bl 
       add dl, 1
       int 21h   
       
       mov ah,2
       mov dl, bl  
       sub dl ,1
       int 21h 
        
       mov ah, 4ch
       int 21h
    main endp
end main        