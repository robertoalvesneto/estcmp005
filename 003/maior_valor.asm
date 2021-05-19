; recebe dois numeros de tam 1 (0 a 9)(8bits) e soma eles

SYS_EXIT  equ 1
SYS_READ  equ 3
SYS_WRITE equ 4
STDIN     equ 0
STDOUT    equ 1

segment .bss

    num1 resb 2 
    num2 resb 2 
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

    ; 8bits
    mov al, [num1]
    mov ah, [num2]

    ; compara
	cmp al, ah
	jl Else ;se al < ah, pule
	mov ah, [num1]  
    Else: 
	mov [res], ah

    ;print resp
    mov eax, SYS_WRITE        
    mov ebx, STDOUT
    mov ecx, res         
    mov edx, 1        
    int 0x80

exit:    
    
    mov eax, SYS_EXIT   
    xor ebx, ebx 
    int 0x80

;PARA COMPILAR E RODAR
; nasm -f elf soma.asm
; ld -m elf_i386 -s -o soma soma.o
; ./soma