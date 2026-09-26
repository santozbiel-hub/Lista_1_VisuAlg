algoritmo "Lista2_Exercicio10"
var
   primeiro, segundo, aritmetica, geometrica, ponderada: real
inicio
   escreva("Primeiro numero: ")
   leia(primeiro)
   escreva("Segundo numero: ")
   leia(segundo)

   aritmetica <- (primeiro + segundo) / 2
   ponderada <- (3 * primeiro + 2 * segundo) / 5
   escreval("Media aritmetica: ", aritmetica:0:2)
   escreval("Media ponderada (pesos 3 e 2): ", ponderada:0:2)

   se (primeiro >= 0) e (segundo >= 0) entao
      geometrica <- raizq(primeiro * segundo)
      escreval("Media geometrica: ", geometrica:0:2)
   senao
      escreval("Media geometrica indefinida para valores negativos.")
   fimse
fimalgoritmo
