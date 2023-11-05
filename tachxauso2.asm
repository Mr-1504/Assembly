                                              .model small
.stack 100h
.data
    s1 db 'nhap xau: $'
    s2 db 10, 13, 'xau hoa: $'   
    s3 db 10, 13, 'xau so: $'
    s4 db 10, 13, 'xau thuong: $' 
    s5 db 10, 13, 'xau vua nhap: $' 
    s  db 100 dup(?)
    st db 100 dup(?) 
    sh db 100 dup(?)    
    so db 100 dup(?)    
.code
    main proc
           mov ax, @data
           mov ds, ax
           
           mov si, 0
           mov di, 0
           mov xn, 0
           mov ah, 9
           lea dx, s1
           int 21h
           mov bx, 0
nhaptiep:           
           mov ah, 1
           int 21h  
           cmp al, 13
           je enter     
           mov s[bx], al
           jmp nhaptiep

enter:      
           mov s[bx], '$'    
           mov ah, 9
           lea dx, s5
           int 21h
           lea dx, s
           int 21h
           
           mov cx, bx
           mov bx, 0
doi:       
           cmp bx, cx
           jge inra    
           cmp s[bx], 97
           jge thuong  
           cmp s[bx], 65
           jge hoa  
           jmp soo
           
thuong:
           mov al, s[bx]
           mov st[ti], al
           inc ti
           inc bx
           jmp doi   
           
hoa:         
           mov al, s[bx]
           mov sh[hi], al
           inc hi
           inc bx    
           jmp doi
soo:       
           mov al, s[bx]
           mov so[sn], al
           inc sn
           inc bx     
           jmp doi                      
inra:
           mov sh[hi], '$'
           mov st[ti], '$'
           mov so[sn], '$'
           
           mov ah, 9
           lea dx, s2
           int 21h
           lea dx, sh  
           int 21h
           lea dx, s4
           int 21h
           lea dx, st
           int 21h
           lea dx, s5
           int 21h
           lea dx, so
           int 21h
                   
           mov ah, 4ch
           int 21h
        main endp
    end
           
           