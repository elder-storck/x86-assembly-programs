segment code
..start:
; iniciar os registros de segmento DS e SS e o ponteiro de pilha SP
    mov ax,data
    mov ds,ax
    mov ax,stack
    mov ss,ax
    mov sp,stacktop
    
    ;Inicio do código 
    mov bx,three_chars  ;Carrega o endereço da variável three_chars no registrador BX

    mov ah,1        ; Seleciona a função para ler caractere
    int 21h         ; Chama a interrupção para entrada de dado    
    dec al          ; Decrementa o valor de AL
    mov [bx],al     ; Armazena o caractere decrementado na memória em `three_chars`
    
    inc bx          ; Incrementa BX para apontar para o próximo byte em `three_chars`
    int 21h         ; Chama a interrupção para entrada de dado    
    dec al          ; Decrementa o valor de AL
    mov [bx],al     ; Armazena o caractere decrementado na memória em `three_chars`
    
    inc bx          ; Incrementa BX para apontar para o próximo byte em `three_chars`
    int 21h         ; Chama a interrupção para entrada de dado    
    dec al          ; Decrementa o valor de AL
    mov [bx],al     ; Armazena o caractere decrementado na memória em `three_chars`
    
    mov dx,display_string   ; Coloca o endereço de `display_string` em DX
    mov ah,9                ; Seleciona a função 09h para exibir uma string
    int 21h                 ; Exibe a string na tela

    ; Terminar o programa e voltar para o sistema operacional
    mov ah,4ch
    int 21h


segment data
    CR equ 0dh
    LF equ 0ah
    display_string db CR,LF
    three_chars resb 3
                db ‘$’


segment stack stack
    resb 256
stacktop:
