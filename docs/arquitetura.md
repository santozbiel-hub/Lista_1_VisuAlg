# Guia de leitura · Algoritmos em VisuAlg

O material reúne exercícios pequenos, fluxogramas e um programa de atendimento que combina os conceitos.

## Fluxo do projeto

1. Abra um exercício `.alg` e identifique as entradas lidas.
2. Siga as decisões ou repetições e compare com a saída.
3. No MedControl, comece pelo menu e acompanhe as chamadas aos procedimentos e funções.

## Estrutura do código

| Arquivo | Responsabilidade |
| --- | --- |
| [`listas/lista-1/README.md`](../listas/lista-1/README.md) | Leva aos exercícios independentes da primeira lista. |
| [`listas/lista-2/README.md`](../listas/lista-2/README.md) | Lista os fluxogramas e o problema de cada figura. |
| [`listas/lista-3/README.md`](../listas/lista-3/README.md) | Apresenta os exercícios de vetores, matrizes e recursividade. |
| [`DESAFIO1/README.md`](../DESAFIO1/README.md) | Documenta as rotinas centrais do MedControl. |
| [`DESAFIO1/MedControl.alg`](../DESAFIO1/MedControl.alg) | Reúne as funções e procedimentos no arquivo executável do VisuAlg. |

## Exemplo para acompanhar

No MedControl, acompanhe `atender` até `montarFila`. A função reúne os pacientes que aguardam, ordena as posições e devolve o tamanho da fila. `vemAntes` decide a precedência por prioridade, idade e ordem de cadastro.

## Execução e verificação

Abra o arquivo no VisuAlg. Use dados fictícios para comparar duas entradas com a mesma prioridade e idades diferentes. Para consultar a demonstração, use o [link do vídeo](../DESAFIO1/video.txt).
