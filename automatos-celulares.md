# Autômatos Celulares

## Introdução

O desenvolvimento de sistemas de autômatos celulares é normalmente atribuído a Stanisław Ulam e John von Neumann, que eram ambos pesquisadores do laboratório nacional de Los Alamos no Novo México na década de 1940. Ulam estudava o crescimento de cristais e von Neumann imaginava um mundo de robôs auto-replicante. O trabalho de von Neumann em auto-replicação e Autômatos Celulares é conceitualmente semelhante ao que é provavelmente o mais famoso autômato celular: o "jogo da vida", de Conway (Conway's Game of Life). Provavelmente o trabalho científico mais significativo estudando autômatos celulares chegou em 2002: o livro [A New Kind of Science](http://www.wolframscience.com/nksonline/toc.html) de Stephen Wolfram.

Um autômato celular é um sistema de células com as seguintes características:

1. As células vivem em uma grade.

2. Cada célula tem um estado. O número de possibilidades do estado é tipicamente finito. O exemplo mais simples tem duas possibilidades: 1 e 0 (referidos como "ligado" e "desligado" ou "vivo" e "morto" ou "on" e "off").

3. Cada célula tem vizinhos. Isto pode ser definido de várias maneiras, mas normalmente é definido através de uma lista das células adjacentes.

![grade](https://github.com/arteprog/quatro-encontros/blob/master/assets/grade.png?raw=true)

> Uma grade de células ligadas e desligadas. A "vizinhança" da célula vermelha é composta pelas células amarelas.

Um detalhe importante do funcionamento dos autômatos celulares é o tempo. Não estamos falando do tempo real, mas sim sobre como o Autômato Celular vive durante um período de tempo, o que também poderia ser chamado de uma geração e, no nosso caso, irá provavelmente se referir a contagem de quadros de uma animação (frameCount). Devemos nos perguntar como calculamos os estados de todas as células de uma geração e como os estados de todas as células transformam-se de uma geração para a outra.

Um novo estado da célula é uma função de todos os estados na vizinhança da célula no momento anterior no tempo (ou durante a geração anterior). Podemos calcular um valor de estado olhando para todos os estados anteriores dos vizinhos.
No mundo dos autômatos celulares, há muitas maneiras para calcular o estado de uma célula a partir de um grupo de células, vários sistemas de regras são possíveis, como por exemplo com múltiplas camadas de vizinhança.

### Sistemas complexos

Sistemas complexos, como os autômatos celulares, possuem algumas características básicas: o todo é maior do que a soma das suas partes, o sistema complexo é formado por elementos operando em paralelo, com relações de curto alcance e, como um todo, apresenta comportamento emergente.

## Conway's Game of Life

O jogo da vida de Conway foi popularizado por Martin Gardner em sua coluna na revista Scientific American em 1970. Como poucas pessoas tinham acesso a computadores, Gardner no artigo sugere calcular os estados do autômato usando um tabuleiro quadriculado e fichas da seguinte maneira:
> Para experimentar o jogo você deve ter um tabuleiro razoavelmente grande e um suprimento abundante de fixas de duas cores. É possível trabalhar com lápis e papel quadriculado mas é muito mais fácil, especialmente para iniciantes, usar fichas em um tabuleiro.

As células do sistema tem a seguintes regras: 
1. Cada célula pode ter um de dois estados, "vivo" ou "morto";
2. Se a soma das células vizinhas vivas for menor que 2 (uma ou nenhuma vizinha viva), a célula morre (regra da solidão);
3. Se a soma das vizinhas vivas for maior que 3 (quatro ou mais vizinhas vivas), a célula morre (regra da superpopulação);
4. Se a soma das vizinhas for exatamente 3, a célula, estando morta nasce (regra do nascimento);
5. Com 2 e  3 vizinhas vivas uma célula se mantém viva, e se não tiver exatamente 3 vizinhas continua morta (regra da permanência).

O motivo de serem necessárias fichas de duas cores é o seguinte, como o cálculo do próximo estado do tabuleiro (também conhecido como a próxima geração) depende da contagem das células vizinhas, se começamos calculando uma célula do tabuleiro por vez, não é possível remover imediatamente as primeiras células que encontramos, se forem morrer, uma vez que isso vai atrapalhar a contagem para o cálculo da próxima célula. É necessário então marcar com as fichas de outra cor as células que vão ser removidas, calcular todas e remover em uma segunda etapa.

Na simulação computacional, esta situação é resolvida mantendo-se "dois tabuleiros", um com as células da geração atual, e um segundo onde vão sendo acrescentados os resultados dos cálculos para a próxima geração. Ao final do cálculo o tabuleiro original é descartado, isto é ganha os estados  das células da próxima geração.


### Exemplo 01

```pde
// Adaptado de The Nature of Code, Daniel Shiffman http://natureofcode.com

boolean play = true;
int tamCelula = 5;
int colunas, filas;
// Game of life board
int[][] grade;

void setup() {
  size(600, 400);
  // Calcula colunas e filas, incializa um array
  colunas = width/tamCelula;
  filas = height/tamCelula;
  grade = new int[colunas][filas];
  // Chama a função que sorteia 0s e 1s na grade
  inicializa();
}

void draw() {
  background(255);

  for ( int i = 0; i < colunas; i++) {
    for ( int j = 0; j < filas; j++) {
      if ((grade[i][j] == 1)) fill(0);
      else fill(255); 
      noStroke(); //stroke(0);
      rect(i*tamCelula, j*tamCelula, tamCelula, tamCelula);
    }
  }

  if (play) {
    gerar();
  }
}


// Reseta a grande com a tecla 'r'
// Pause/Play com a barra de espaço
void keyPressed() {
  if (key == ' ') {
    play = !play;
  }
  if (key == 'r') {
    inicializa();
  }
}


void inicializa() {
  for (int i =1; i < colunas-1; i++) {
    for (int j =1; j < filas-1; j++) {
      grade[i][j] = int(random(2));
    }
  }
}


// O processo de calcular uma nova geração
void gerar() {

  int[][] proxima = new int[colunas][filas];

  // Circula por todas as células da grade
  for (int x = 0; x < colunas; x++) {
    for (int y = 0; y < filas; y++) {

      // Soma os estados em posições 3x3 em volta de cada célula
      int vizinhas = 0;
      for (int i = -1; i <= 1; i++) {
        for (int j = -1; j <= 1; j++) {
          // Aqui tem um cálculo que faz as bordas da tela se unirem às bordas opostas
          vizinhas += grade[(x+i+colunas)%colunas][(y+j+filas)%filas];
        }
      }
      // Subtrai o estado da própria célula que foi adicionado no laço anterior
      vizinhas -= grade[x][y];

      // Regras do jogo da vida
      if      ((grade[x][y] == 1) && (vizinhas <  2)) proxima[x][y] = 0;           // Solidão
      else if ((grade[x][y] == 1) && (vizinhas >  3)) proxima[x][y] = 0;           // Superpopulação
      else if ((grade[x][y] == 0) && (vizinhas == 3)) proxima[x][y] = 1;           // Nascimento
      else                                             proxima[x][y] = grade[x][y]; // Permanência
    }
  }

  // A próxima grade se torda a agrade atual
  grade = proxima;
}
```


