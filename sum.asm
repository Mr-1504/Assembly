                       .model small
.stack 100h
.data 
    s1 db 10,13, 'nhap a: $'    
    s2 db 10,13, 'tong la: $'
.code
    Truong_Van_minh proc
           mov ax, @data
           mov ds, ax 
           
           mov ah, 9
           lea dx, s1
           int 21h 
           
           mov ah,1
           sub al, 48  
           mov cl, al 
           int 21h   
           
           mov ah, 9
           lea dx, s2
           int 21h
           
           mov bl, 0 
           mov al, 1 
           
           cong:
           add bl, al    
           add al, 1
           cmp al, cl
           jle cong           
           
           mov ah, 2  
           mov dl, bl 
           add bl, 48
           int 21h 
            
           mov ah, 4ch
           int 21h
    Truong_Van_minh endp
end Truong_Van_minh