algoritmo "Exercicio13_Comentado"
tipo
   Produto = registro
      nome: caractere
      preco: real
      quantidade: inteiro
   endregistro
var
   p: vetor[1..4] de Produto
   i: inteiro
   totalGeral: real
inicio
   totalGeral <- 0

   // PASSO 1: Ler informações de 4 produtos
   para i de 1 ate 4 faca
      escreval("--- Produto ", i, " ---")
      escreva("Nome: ")
      leia(p[i].nome)
      escreva("Preço: ")
      leia(p[i].preco)
      escreva("Quantidade: ")
      leia(p[i].quantidade)
      
      // PASSO 2: Calcular o valor do item e acumular no total geral do estoque
      totalGeral <- totalGeral + (p[i].preco * p[i].quantidade)
   endpara

   escreval()
   escreval("Valor Total Geral em Estoque: R$ ", totalGeral:5:2)
fimalgoritmo