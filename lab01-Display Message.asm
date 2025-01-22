segment code ; Define o início do segmento de código. Aqui entram as instruções do

; programa.

..start: ; Este rótulo indica para o NASM onde o programa começa.
; Inicialização dos registros de segmentos.
MOV AX,data
MOV DS,AX
MOV
MOV
MOV



AX,stack
SS,AX
SP,stacktop

; Move o endereço de “data” para AX
; Atualiza o DS com o endereço de “data”
; Move o endereço de “stack” para AX
; Atualiza o SS com o endereço de “stack”
; Atualiza o SP com o topo da pilha “stacktop”

; código do programa
:
:
:

; Aqui entram as instruções do programa

; Terminar o programa e voltar para o sistema operacional
MOV
INT

AH,4Ch
21h

; Move o valor de 0x4C para o registrador AH
; Chama a interrupção do DOS 0x21

; definicao das variáveis
segment data
:
:
:

; Define o início do segmento de dados. Aqui serão
; definidas as variáveis do programa.

; definição da pilha com total de 256 bytes
segment stack stack ; Define o início do segmento de pilha e associa um nome a este segmento.
RESB 256