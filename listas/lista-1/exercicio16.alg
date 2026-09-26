algoritmo "exercicio16"
var
   n, i, fatorial: inteiro
inicio
   escreva("Digite um numero inteiro: ")
   leia(n)

   se n < 0 entao
      escreval("Nao existe fatorial de numero negativo.")
   senao
      fatorial <- 1

      para i de 1 ate n faca
         fatorial <- fatorial * i
      fimpara

      escreval("Fatorial de ", n, " = ", fatorial)
   fimse
fimalgoritmo
