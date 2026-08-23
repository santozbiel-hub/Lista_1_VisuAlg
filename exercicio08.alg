algoritmo "exercicio8"
var
   numero, menor, i: inteiro
inicio
   escreva("Digite o 1o numero: ")
   leia(numero)
   menor <- numero

   para i de 2 ate 5 faca
      escreva("Digite o ", i, "o numero: ")
      leia(numero)
      se numero < menor entao
         menor <- numero
      fimse
   fimpara

   escreval("O menor numero e: ", menor)
fimalgoritmo
