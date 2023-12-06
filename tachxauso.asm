                     .model small
.stack 100h
.data
    s1 db 'nhap xau: $'
    s2 db 10, 13, 'xau hoa: $'   
    s3 db 10, 13, 'xau so: $'
    s4 db 10, 13, 'xau thuong: $'  
    s  db 100 dup(?) 
    a  db 100 dup(?)    
    so db 100 dup(?)               
    i  dw 0  
    d  dw 0  
    e  dw 0
.code
    Truong_Van_minh proc
           mov ax, @data
           mov ds, ax
           
           mov ah, 9
           lea dx, s1
           int 21h
            mov cx, 0  
            mov i, cx
           mov bx, 0
nhaptiep:           
           mov ah, 1
           int 21h  
           cmp al, 13
           je enter     
           cmp al, 97
           jge hoa   
           cmp al, 65
           jge thuong
           jmp soo
thuong:
           mov s[bx], al
           inc bx
           jmp nhaptiep   
hoa:         
           mov i, bx
           mov bx, d
           mov a[bx], al
           inc bx
           mov d, bx
           mov bx, i  
           jmp nhaptiep  
soo:       
           mov i, bx
           mov bx, e
           mov so[bx], al
           inc bx
           mov e, bx
           mov bx, i
           jmp nhaptiep
enter:      
           mov s[bx], '$'    
           mov bx, d
           mov a[bx], '$'   
           mov bx, e
           mov so[bx], '$'
           
           mov ah, 9
           lea dx, s2
           int 21h
           lea dx, s
           int 21h 
           lea dx, s4
           int 21h
           lea dx, a
           int 21h
           lea dx, s3
           int 21h
           lea dx, so
           int 21h
           mov ah, 4ch
           int 21h
    Truong_Van_minh endp
end
           
           