.model small
.stack 100h
.data
    s1 db 'n = $'
    s2 db 10, 13, 's = $'
    a dw 0
.code
main proc
    mov ax, @data
    mov ds, ax

    mov ah, 9
    lea dx, s1
    int 21h
    mov ch, 0
    mov bx, 10
nhaptiep:
    mov ah, 1
    int 21h
    cmp al, 13
    je enter
    sub al, 48
    mov cl, al
    mov ax, a
    mul bx
    add ax, cx
    mov a, ax
    jmp nhaptiep

enter:
    mov ah, 9
    lea dx, s2
    int 21h

    mov bx, a
    mov cx, 1
    mov ax, 0
congtiep:
    add ax, cx
    inc cx
    cmp cx, bx
    jle congtiep

    mov bx, 10
    mov cx, 0  
    mov dx, 0
chiatiep: 
    mov ah, 0  
    mov dx, 0
    div bx
    cmp ax, 0
    je hienso
    push dx
    inc cl
    jmp chiatiep

hienso:
    push dx
    inc cl
intiep:
    mov ah, 2
    pop dx
    add dl, 48
    int 21h
    loop intiep

    mov ah, 4ch
    int 21h

main endp
end main
