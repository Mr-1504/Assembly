.model small
.stack 100h
.data           
    nhap db 'Nhap ki tu: $'
    xuong db 10,13,'$'
.code
    main proc  
        MOV ax, @data
        MOV ds, ax
                  
        MOV ah, 9
        LEA dx, nhap 
        INT 21h
                 
        MOV ah, 1
        INT 21h    
                       
        MOV bh, al  
        CMP bh, 97  
        JGE thuong 
        MOV bl, 65 
        JMP xuonghang
        thuong:
            MOV bl, 97   
                
    xuonghang:
        MOV ah, 9
        LEA dx, xuong
        INT 21h
        
    inra:
        MOV ah, 2
        MOV dl, bl
        INT 21h
        MOV ah, 2
        MOV dl, 32
        INT 21h   
        
        ADD bl, 1
        CMP bl, bh
        JLE inra
        
        MOV ah, 4ch
        INT 21h
        
    main endp
end main