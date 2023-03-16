# URLs

- http://localhost:8080/hello
- http://localhost:8080/hello/error


## Syslog TCP para shell
- port 1514

## GELF UDP para java, 
- port 12201

## Pesquisas

- message:BAD_REQUEST => qualquer coisa que contenha bad request
- message:"BAD_REQUEST" => exatamente bad request
- BAD_REQUEST AND source:macrrwfcj3yrn
- BAD_REQUEST NOT source:macrrwfcj3yrn


## Criar índices e rotear coisas
- System -> Indices

## Criar streams
- Escolher Índice
- Escolher a source input

Inputs coletam os dados
Streams fazem o filtro com base nos inputs e colocam nos índices
Indices servem para armazenar e ajudar nos filtros (configuração de rotação dos dados)