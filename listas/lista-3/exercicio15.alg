algoritmo "Exercicio15_Comentado"
tipo
   Livro = registro
      titulo: caractere
      autor: caractere
      ano: inteiro
   endregistro
var
   l: vetor[1..5] de Livro
   i: inteiro
inicio
   // PASSO 1: Leitura dos dados dos 5 livros
   para i de 1 ate 5 faca
      escreval("--- Livro ", i, " ---")
      escreva("Título: ")
      leia(l[i].titulo)
      escreva("Autor: ")
      leia(l[i].autor)
      escreva("Ano de Publicação: ")
      leia(l[i].ano)
   endpara

   // PASSO 2: Filtrar e mostrar apenas livros lançados após o ano 2000
   escreval()
   escreval("--- Livros após o ano 2000 ---")
   para i de 1 ate 5 faca
      se l[i].ano > 2000 entao
         escreval(l[i].titulo, " (", l[i].ano, ")")
      fimse
   endpara
fimalgoritmo