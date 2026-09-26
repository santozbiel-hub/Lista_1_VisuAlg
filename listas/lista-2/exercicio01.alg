algoritmo "Lista2_Exercicio01"
var
   primeiro, segundo: inteiro
inicio
   escreva("Primeiro numero inteiro: ")
   leia(primeiro)
   escreva("Segundo numero inteiro: ")
   leia(segundo)

   se primeiro > segundo entao
      escreval("O maior numero e: ", primeiro)
   senao
      se segundo > primeiro entao
         escreval("O maior numero e: ", segundo)
      senao
         escreval("Os numeros sao iguais.")
      fimse
   fimse
fimalgoritmo
