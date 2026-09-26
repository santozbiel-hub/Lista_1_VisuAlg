algoritmo "Lista2_Exercicio12"
var
   numero: inteiro
   anterior, atual, proximo: real
inicio
   escreva("Numero inteiro: ")
   leia(numero)

   se numero < 0 entao
      escreval("O numero nao pertence a sequencia de Fibonacci.")
   senao
      anterior <- 0
      atual <- 1
      enquanto atual < numero faca
         proximo <- anterior + atual
         anterior <- atual
         atual <- proximo
      fimenquanto

      se (numero = 0) ou (atual = numero) entao
         escreval("O numero pertence a sequencia de Fibonacci.")
      senao
         escreval("O numero nao pertence a sequencia de Fibonacci.")
      fimse
   fimse
fimalgoritmo
