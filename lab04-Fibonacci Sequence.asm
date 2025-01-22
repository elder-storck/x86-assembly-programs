segment code ; Define o início do segmento de código
start:
    MOV AX, dados ; Inicialização dos registros de segmentos
    MOV DS, AX
    MOV AX, stack
    MOV SS, AX
    MOV SP, stacktop

    ; AQUI COMEÇA A EXECUÇÃO DO PROGRAMA PRINCIPAL
    MOV DX, mensini ; Mensagem de início
    MOV AH, 9
    INT 21h

    MOV AX, 0 ; Primeiro elemento da série
    MOV BX, 1 ; Segundo elemento da série

L14:
    MOV DX, AX
    ADD DX, BX ; Calcula novo elemento da série
    MOV AX, BX
    MOV BX, DX
    CMP DX, 0x8000
    JB L14

    ; AQUI TERMINA A EXECUÇÃO DO PROGRAMA PRINCIPAL
exit:
    MOV DX, mensfim ; Mensagem de final
    MOV AH, 9
    INT 21h

quit:
    MOV AH, 4CH
    INT 21h

segment dados ; Segmento de dados inicializados
    mensini: DB 'Programa que calcula a Série de Fibonacci. ', 13, 10, '$'
    mensfim: DB 'bye', 13, 10, '$'
    saída: DB '00000', 13, 10, '$'

segment stack stack
    RESB 256 ; Reserva 256 bytes para formar a pilha
stacktop: ; Posição de memória que indica o topo da pilha = SP
