algoritmo "exercicio6"
var
   idade: inteiro
inicio
   escreva("Digite a idade: ")
   leia(idade)

   se idade < 18 entao
      escreval("Menor de idade.")
   senao
      se idade >= 60 entao
         escreval("Idosa.")
      senao
         escreval("Maior de idade.")
      fimse
   fimse
fimalgoritmo
