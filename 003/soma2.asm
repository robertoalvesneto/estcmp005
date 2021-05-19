; SOMA DE VALORES DE TAM 5
; NAO TIVE CEREBRO O BASTANTE PARA PEGAR QUALQUER TAMANHO DE VALORES, NEM PARA
; RECEBER VALORES MAIORES QUE 8 BITS (INTEIROS DE 0 A 9)

SYS_EXIT  equ 1
SYS_READ  equ 3
SYS_WRITE equ 4
STDIN     equ 0
STDOUT    equ 1

section	.data
    msg db 'The Sum is:',0xa	
    len equ $ - msg			
    num1 db '    1'
    num2 db '    2'
    sum db '     '

section	.text
    global _start

_start: 
    mov     esi, 4
    mov     ecx, 5
    clc
add_loop:  
    mov 	al, [num1 + esi]
    adc 	al, [num2 + esi]
    aaa
    pushf
    or 	al, 30h
    popf
    
    mov	[sum + esi], al
    dec	esi
    loop	add_loop

    ;exibir soma
    mov	edx,5
    mov	ecx,sum
    mov	ebx,STDOUT
    mov	eax,SYS_WRITE
    int	0x80
    
    ;saida
    mov	eax,SYS_EXIT
    int	0x80

;PARA COMPILAR E RODAR
; nasm -f elf soma2.asm
; ld -m elf_i386 -s -o soma2 soma2.o
; ./soma2