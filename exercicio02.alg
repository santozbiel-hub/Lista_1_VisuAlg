algoritmo "exercicio2"
var
   n1, n2: inteiro
inicio
   escreva("Digite o primeiro numero inteiro: ")
   leia(n1)
   escreva("Digite o segundo numero inteiro: ")
   leia(n2)

   escreval("Soma: ", n1 + n2)
   escreval("Subtracao: ", n1 - n2)
   escreval("Multiplicacao: ", n1 * n2)

   se n2 <> 0 entao
      escreval("Divisao: ", n1 / n2)
   senao
      escreval("Divisao: impossivel (divisao por zero).")
   fimse
fimalgoritmo
