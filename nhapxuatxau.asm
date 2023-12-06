.model small
.stack 100h
.data
    s1 db 'Nhap xau: $'
    s2 db 10, 13, 'Xau vua nhap la: $' 
    s3 db 10, 13, 'Xau rong!$'  
    s  db 100 dup(?)
.code
    Truong_Van_minh proc
        mov ax, @data
        mov ds, ax
        
        mov si, 0
        mov ah, 9
        lea dx, s1
        int 21h   
    nhap:    
        mov ah, 1
        int 21h
        cmp al, 13
        je enter
        mov s[si], al 
        inc si
        jmp nhap
               
        
    enter:  
        cmp si, 0
        je  tbao
        mov ah, 9
        lea dx, s2
        int 21h
        
        mov s[si], '$'
        lea dx, s
        int 21h
        jmp ketthuc  
        
    tbao:
        mov ah, 9
        lea dx, s3
        int 21h
        
    ketthuc:
        mov ah, 4ch
        int 21h
    Truong_Van_minh endp
end    
                     