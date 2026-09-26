algoritmo "Lista2_Exercicio04"
var
   n, i, soma: inteiro
inicio
   escreva("Valor de N (inteiro positivo): ")
   leia(n)

   se n < 1 entao
      escreval("Informe um inteiro positivo.")
   senao
      soma <- 0
      para i de 1 ate n faca
         soma <- soma + i
      fimpara
      escreval("Soma de 1 a ", n, ": ", soma)
   fimse
fimalgoritmo
