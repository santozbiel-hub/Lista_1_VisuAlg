algoritmo "Lista2_Exercicio11"
var
   n, i: inteiro
   fatorial: real
inicio
   escreva("Valor de N (inteiro nao negativo): ")
   leia(n)

   se n < 0 entao
      escreval("Fatorial indefinido para inteiros negativos.")
   senao
      fatorial <- 1
      para i de 1 ate n faca
         fatorial <- fatorial * i
      fimpara
      escreval(n, "! = ", fatorial:0:0)
   fimse
fimalgoritmo
