algoritmo "Lista2_Exercicio06"
var
   ladoA, ladoB, ladoC: real
inicio
   escreva("Primeiro lado: ")
   leia(ladoA)
   escreva("Segundo lado: ")
   leia(ladoB)
   escreva("Terceiro lado: ")
   leia(ladoC)

   se (ladoA > 0) e (ladoB > 0) e (ladoC > 0) e (ladoA + ladoB > ladoC) e (ladoA + ladoC > ladoB) e (ladoB + ladoC > ladoA) entao
      escreval("Os lados formam um triangulo.")
   senao
      escreval("Os lados nao formam um triangulo.")
   fimse
fimalgoritmo
