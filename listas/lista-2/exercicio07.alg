algoritmo "Lista2_Exercicio07"
var
   salario, imposto: real
inicio
   escreva("Salario em reais: ")
   leia(salario)

   se salario < 0 entao
      escreval("Salario invalido.")
   senao
      se salario <= 2000 entao
         imposto <- 0
      senao
         se salario <= 5000 entao
            imposto <- salario * 0.10
         senao
            imposto <- salario * 0.20
         fimse
      fimse
      escreval("Imposto a pagar: R$ ", imposto:0:2)
   fimse
fimalgoritmo
