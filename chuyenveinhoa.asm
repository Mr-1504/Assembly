.model small
.stack 100h
.data
    s1 db 'Nhap xau: $'
    s2 db 10, 13, 'Xau in hoa: $'
    s3 db 10, 13, 'Xau in thuong; $'
    a  db 100 dup('$')
    b  db 100 dup('$')
.code
    Truong_Van_minh proc
        mov ax, @data
        mov ds, ax
        
        mov ah, 9
        lea dx, s1
        int 21h
        
        mov si, 0
    nhap:        
        mov ah,1
        int 21h
        cmp al, 13
        je enter
        sub al, 32
        cmp al, 65
        jl tang
        jmp chuyendoi
    tang:  
        add al, 32
    chuyendoi:
        mov a[si], al 
        cmp al, 32
        je cach
        add al, 32 
    cach:    
        mov b[si], al 
        inc si
        jmp nhap  
      
    enter:   
        mov ah, 9 
        lea dx, s3
        int 21h
        lea dx, b
        int 21h
        lea dx, s2
        int 21h
        lea dx, a
        int 21h
        
        mov ah, 4ch
        int 21h
    Truong_Van_minh endp
end    