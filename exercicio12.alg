algoritmo "exercicio12"
var
   anoNascimento, idade: inteiro
inicio
   escreva("Digite o ano de nascimento: ")
   leia(anoNascimento)

   idade <- 2026 - anoNascimento

   escreval("Idade aproximada: ", idade, " anos.")

   se idade >= 16 entao
      escreval("Ja tem idade suficiente para votar.")
   senao
      escreval("Ainda nao tem idade suficiente para votar.")
   fimse
fimalgoritmo
