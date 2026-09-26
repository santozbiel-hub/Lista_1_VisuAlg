algoritmo "exercicio7"
var
   numero, maior, i: inteiro
inicio
   escreva("Digite o 1o numero: ")
   leia(numero)
   maior <- numero

   para i de 2 ate 5 faca
      escreva("Digite o ", i, "o numero: ")
      leia(numero)
      se numero > maior entao
         maior <- numero
      fimse
   fimpara

   escreval("O maior numero e: ", maior)
fimalgoritmo
