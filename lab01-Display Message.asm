segment code
..start:
; iniciar os registros de segmento DS e SS e o ponteiro de pilha SP
    mov ax,data
    mov ds,ax
    mov ax,stack
    mov ss,ax
    mov sp,stacktop

    ;Exibindo a mensagem 
    mov ah,9        ;Define a função 9 da interrupção 21h (exibir string terminada por '$')
    mov dx,mensagem ; Carrega o endereço da string (mensagem) no registrador DX
    int 21h         ; Chama a interrupção 21h para exibir a string
    
    ; Terminar o programa e voltar para o sistema operacional
    mov ah,4ch
    int 21h
segment data
    CR equ 0dh
    LF equ 0ah
    mensagem db ‘Oi, olha eu aqui’,CR,LF,’$’
segment stack stack
    resb 256
stacktop:
