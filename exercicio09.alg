algoritmo "exercicio9"
var
   preco, desconto, novoPreco: real
inicio
   escreva("Digite o preco do produto: R$ ")
   leia(preco)

   desconto <- preco * 0.10
   novoPreco <- preco - desconto

   escreval("Valor com 10% de desconto: R$ ", novoPreco)
fimalgoritmo
