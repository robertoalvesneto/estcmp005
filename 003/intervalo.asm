; so funciona com valores de 0 a 9 (8 bits)

SYS_EXIT  equ 1
SYS_READ  equ 3
SYS_WRITE equ 4
STDIN     equ 0
STDOUT    equ 1

segment .bss

    num1 resb 1 
    num2 resb 1
    lop resb 1
    res resb 1    

section	.text
    global _start

_start:
    ;entrada 1
    mov eax, SYS_READ 
    mov ebx, STDIN  
    mov ecx, num1 
    mov edx, 2
    int 0x80      

    ;entrada 2
    mov eax, SYS_READ  
    mov ebx, STDIN  
    mov ecx, num2 
    mov edx, 2
    int 0x80        

    ;destransforma de ascii
    mov eax, [num1]
    sub eax, '0'
    mov ebx, [num2]
    sub ebx, '0'

    ; 8bits
    mov al, [num1]
    mov ah, [num2]

L1:
    ;incrementa
    inc al
    mov [res], al

    ;se al >= ah, para loop
    cmp al, ah
    jge Gotoo

    ;print resp
    mov eax, SYS_WRITE        
    mov ebx, STDOUT
    mov ecx, res         
    mov edx, 1        
    int 0x80

    ;devolve os valores aos registradores
    mov al, [res]
    mov ah, [num2]
    
    ;pulo
    jmp L1
Gotoo:

exit:    
    
    mov eax, SYS_EXIT   
    xor ebx, ebx 
    int 0x80

;PARA COMPILAR E RODAR
; nasm -f elf intervalo.asm
; ld -m elf_i386 -s -o intervalo intervalo.o
; ./intervalo