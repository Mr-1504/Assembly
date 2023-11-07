.model small
.stack 100h
.data
    s db 'T0 00/00/0000$'
.code
    main proc
        mov ax, @data
        mov ds, ax
        
        mov ah, 2ah
        int 21h
        
        cmp al, 0
        je chunhat
        jmp tiep1
        
    chunhat:
        mov s[0], 'C'
        mov s[1], 'N'
        jmp ngay
        
    tiep1:
        add al, 49
        mov s[1], al
        
    ngay:  
        mov bl, 10 
        mov ah, 0
        mov al, dl
        div bl
        add al, 48
        add ah, 48
        mov s[3], al
        mov s[4], ah
        
        mov al, dh  
        mov ah, 0
        div bl
        add al, 48
        add ah, 48
        mov s[6], al
        mov s[7], ah
        
        mov ax, cx
        mov cl, 0
        mov dx, 0
        mov bx, 10 
        mov si, 9
       
    chia:   
        div bx 
        push dx
        inc cl
        cmp ax, 0
        je nam
        mov dx, 0
        jmp chia
        
    nam:
        
        pop dx
        add dl, 48
        mov s[si], dl  
        inc si
        sub cl, 1
        cmp cl, 0
        jg nam
        
        mov ah, 9
        lea dx, s
        int 21h
        
        mov ah, 4ch
        int 21h
    main endp
end    
        
        
                
            