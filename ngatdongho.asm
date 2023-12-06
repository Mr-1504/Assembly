                     .model small
.stack 100h
.data
    s db '00:00:00$'  
.code
    Truong_Van_minh proc
        mov ax, @data
        mov ds, ax  
    tiep:    
        mov ah, 2ch
        int 21h
        
        mov al, ch
        mov ah, 0
        mov bl, 10
        
        div bl  
        add al, 48
        mov s[0], al      
        add ah, 48
        mov s[1],ah 
        
        mov ah, 0
        mov al, cl
        div bl     
        add al, 48
        add ah, 48
        mov s[3], al
        mov s[4], ah
        
        mov ah, 0
        mov al, dh
        div bl    
        add al, 48
        add ah, 48
        mov s[6], al
        mov s[7], ah 
        mov ah, 2
        mov dl, 13
        int 21h
        mov ah, 9
        lea dx, s
        int 21h
        
        mov ah,1
        int 16h   
        jz tiep 
        mov ah, 0
        int 16h
        cmp al, 13
        je kt
        jmp tiep
    kt:    
        mov ah, 4ch
        int 21h 
    Truong_Van_minh endp
end    
            