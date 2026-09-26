algoritmo "Lista2_Exercicio09"
var
   nome: caractere
   idade: inteiro
inicio
   escreva("Nome: ")
   leia(nome)
   escreva("Idade em anos: ")
   leia(idade)

   se idade < 0 entao
      escreval("Idade invalida.")
   senao
      se idade >= 18 entao
         escreval(nome, " e maior de idade.")
      senao
         escreval(nome, " e menor de idade.")
      fimse
   fimse
fimalgoritmo
