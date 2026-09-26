algoritmo "Lista2_Exercicio05"
var
   idade: inteiro
inicio
   escreva("Idade em anos: ")
   leia(idade)

   se idade < 0 entao
      escreval("Idade invalida.")
   senao
      se idade < 18 entao
         escreval("Menor de idade.")
      senao
         se idade < 65 entao
            escreval("Adulto.")
         senao
            escreval("Idoso.")
         fimse
      fimse
   fimse
fimalgoritmo
