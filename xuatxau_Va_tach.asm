.model small
.stack 100h
.data
     s1   db   'nhap xau: $'
     s2   db   10, 13, 'vua nhap: $'
     s3   db   10, 13, 'xau chu hoa: $'
     s4   db   10, 13, 'xau chu thuong: $'
     s5   db   10, 13, 'so: $'
     s    db   100 dup(?)
     st   db   100 dup(?)
     sh   db   100 dup(?) 
     so   db   100 dup(?)
     t    dw   0
     t1   dw   0
.code
     Truong_Van_minh proc
          mov ax, @data
          mov ds, ax
          
          mov ah, 9
          lea dx, s1
          int 21h
          
          mov bx, 0
nhaptiep:          
          mov ah, 1
          int 21h
          cmp al, 13
          je   enter 
          mov s[bx], al
          inc bx
          jmp nhaptiep

enter:
          mov s[bx], '$'
          mov ah, 9
          lea dx, s2
          int 21h
          
          mov ah, 9
          lea dx, s
          int 21h
          
          mov cx, bx
          mov bx, 0
          mov si, 0
          mov di, 0 
          mov dx,0
         
          
doitiep:          
          cmp s[bx], 97
          jge  chuthuong
          cmp s[bx], 65
          jge  chuhoa
          mov al, s[bx]
          mov t, bx
          mov bx, t1
          mov so    [bx], al
          inc bx
          mov t1, bx
          mov bx, t
          jmp tiep
chuhoa:
          mov al, s[bx]
          mov sh[di], al
          inc di
          jmp tiep
chuthuong:
          mov al, s[bx]
          mov st[si], al
          inc si
tiep:     
          inc bx
          cmp bx, cx
          jle doitiep
                    
          mov bx, t1
          mov st[si], '$'
          mov sh[di], '$'
          mov so[bx], '$'
          mov ah, 9
          lea dx, s3
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
          
    Truong_Van_minh endp
end Truong_Van_minh