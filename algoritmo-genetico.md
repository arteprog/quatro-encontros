# Algoritmo genético

O termo "algoritmo genético" refere-se a um algoritmo implementado para resolver tipos específicos de problemas - relacionados à evolução biológica, servem em geral para "otimizar" artefatos com múltiplas características.

Enquanto o próprio algoritmo genético formal servirá como base para os exemplos, não precisamos nos preocupar sobre como implementar o algoritmo com perfeita precisão, dado que nós estamos olhando para usos criativos de teorias evolutivas em nosso código.

## Seleção Interativa

Seleção interativa se refere ao processo de evolução de algo (muitas vezes uma imagem gerada por computador) guiado pela interação do usuário. Com seleção interativa, você escolheria seus favoritos dentro de um conjunto e inicia um processo algorítmico para gerar novos elementos baseados em suas preferências.

## Traduzir as etapas do algoritmo genético para código em Processing.

SETUP:

Etapa 1: Inicialização. Cria uma população de N elementos, cada um com DNA gerado aleatoriamente.

LOOP:

Etapa 2: Seleção. Avalia a adequação de cada elemento da população e cria um pool genético.

Etapa 3: Reprodução. Repete N vezes:
           a) Escolhe dois progenitores com probabilidade de acordo com a aptidão relativa.
           b) Cruzamento — cria um descendente, combinando o DNA desses dois progenitores.
           c) Mutação — muta o DNA do descendente, com base em determinada probabilidade.
           d) Adiciona o organismo descendente a uma nova população.

Etapa 4. Substituir a população velha com a nova população e retornar para a etapa 2.

