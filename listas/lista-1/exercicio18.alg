algoritmo "exercicio18"
var
   nome, nomeMaisVelho, nomeMaisNovo: caractere
   idade, idadeMaisVelho, idadeMaisNovo, soma, i: inteiro
   media: real
inicio
   soma <- 0

   para i de 1 ate 5 faca
      escreval("Pessoa ", i)
      escreva("Digite o nome: ")
      leia(nome)
      escreva("Digite a idade: ")
      leia(idade)

      soma <- soma + idade

      se i = 1 entao
         idadeMaisVelho <- idade
         nomeMaisVelho <- nome
         idadeMaisNovo <- idade
         nomeMaisNovo <- nome
      senao
         se idade > idadeMaisVelho entao
            idadeMaisVelho <- idade
            nomeMaisVelho <- nome
         fimse

         se idade < idadeMaisNovo entao
            idadeMaisNovo <- idade
            nomeMaisNovo <- nome
         fimse
      fimse
   fimpara

   media <- soma / 5

   escreval("Media das idades: ", media)
   escreval("Pessoa mais velha: ", nomeMaisVelho, " - ", idadeMaisVelho, " anos")
   escreval("Pessoa mais nova: ", nomeMaisNovo, " - ", idadeMaisNovo, " anos")
fimalgoritmo
