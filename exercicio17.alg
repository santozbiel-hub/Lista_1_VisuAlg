algoritmo "exercicio17"
var
   numero, pares, impares, i: inteiro
inicio
   pares <- 0
   impares <- 0

   para i de 1 ate 10 faca
      escreva("Digite o ", i, "o numero inteiro: ")
      leia(numero)

      se numero mod 2 = 0 entao
         pares <- pares + 1
      senao
         impares <- impares + 1
      fimse
   fimpara

   escreval("Quantidade de pares: ", pares)
   escreval("Quantidade de impares: ", impares)
fimalgoritmo
