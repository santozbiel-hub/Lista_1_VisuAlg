# MedControl

Simulação acadêmica de cadastro, fila de atendimento e estatísticas. Abra [MedControl.alg](MedControl.alg) no VisuAlg ou consulte o [link do vídeo](video.txt).

| Rotina | Entrada e resultado |
| --- | --- |
| `buscar` e `buscaRec` | Recebem um código e percorrem os registros. Devolvem a posição do paciente ou o marcador de não encontrado. |
| `vemAntes` | Compara duas posições de paciente para definir a ordem da fila. |
| `montarFila` | Recebe o limite de registros, ordena as posições pendentes e devolve a quantidade na fila. |
| `calcularMedia` | Recebe o total acumulado e a quantidade de itens. Retorna a média e trata o caso sem itens. |
| `marcarAtendido` | Recebe a posição do paciente e atualiza o estado e os totais. |

Comece pelo menu no fim do arquivo e siga a chamada `atender` até `montarFila` e `vemAntes`. As rotinas ficam no mesmo arquivo `.alg` para abrir e executar o programa inteiro no VisuAlg.
