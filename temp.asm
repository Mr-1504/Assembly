.model small
.stack
.data
  s1 db 13, 10, "Nhap so: $"
  s2 db 13, 10, "Ky tu vua nhap la: $"
  s3 db " $"
  s4 db 48
.code
main proc
  mov ax, @data
  mov ds, ax

  mov ah, 9
  lea dx, s1
  int 21h

  mov ah, 1
  int 21h
  mov bl, al
  
  mov ah, 9
  lea dx, s2

inn:    
  int 21h  
  inc s4
  mov ah, 2
  mov dl, s4  
  
  cmp s4, bl
  jle inn

  mov ah, 4ch
  int 21h
main endp
end
