# Autômatos Celulares

## Introdução

Um autômato celular é um sistema de células com as seguintes características:

1 - As células vivem em uma grade.

2 - Cada célula tem um estado. O número de possibilidades do estado é tipicamente finito. O exemplo mais simples tem duas possibilidades: 1 e 0 (referidos como "ligado" e "desligado" ou "vivo" e "morto" ou "on" e "off").

3 - Cada célula tem um vizinho. Isto pode ser definido de várias maneiras, mas normalmente é definido através de uma lista das células adjacentes.

![grade](https://github.com/arteprog/quatro-encontros/blob/master/assets/grade.png?raw=true)

Uma grade de células ligadas e desligadas. A "vizinhança" da célula vermelha é composta pelas células amarelas.

O desenvolvimento de sistemas de autômatos celulares é normalmente atribuído a Stanisław Ulam e John von Neumann, que eram ambos pesquisadores do laboratório nacional de Los Alamos no Novo México na década de 1940. Ulam estudava o crescimento de cristais e von Neumann imaginava um mundo de robôs auto-replicante. O trabalho de von Neumann em auto-replicação e Autômatos Celulares é conceitualmente semelhante ao que é provavelmente o mais famoso autômato celular: o "jogo da vida", de Conway (Conway's Game of Life).

## Conway's Game of Life

### Exemplo 01

```pde
// Adaptado de
// The Nature of Code, Daniel Shiffman http://natureofcode.com

boolean play = true;
int cellSize = 5;
int columns, rows;
// Game of life board
int[][] board;

void setup() {
  size(600, 400);
  // Initialize rows, columns and set-up arrays
  columns = width/cellSize;
  rows = height/cellSize;
  board = new int[columns][rows];
  // Call function to fill array with random values 0 or 1
  init();
}

void draw() {
  background(255);

  for ( int i = 0; i < columns; i++) {
    for ( int j = 0; j < rows; j++) {
      if ((board[i][j] == 1)) fill(0);
      else fill(255); 
      noStroke(); //stroke(0);
      rect(i*cellSize, j*cellSize, cellSize, cellSize);
    }
  }

  if (play) {
    generate();
  }
}


// Reset board when 'r' is pressed
// Pause/Play when SPACE BAR is pressed
void keyPressed() {
  if (key == ' ') {
    play = !play;
  }
  if (key == 'r') {
    init();
  }
}


void init() {
  for (int i =1; i < columns-1; i++) {
    for (int j =1; j < rows-1; j++) {
      board[i][j] = int(random(2));
    }
  }
}


// The process of creating the new generation
void generate() {

  int[][] next = new int[columns][rows];

  // Loop through every spot in our 2D array and check spots neighbors
  for (int x = 0; x < columns; x++) {
    for (int y = 0; y < rows; y++) {

      // Add up all the states in a 3x3 surrounding grid
      int neighbors = 0;
      for (int i = -1; i <= 1; i++) {
        for (int j = -1; j <= 1; j++) {
          neighbors += board[(x+i+columns)%columns][(y+j+rows)%rows];
        }
      }
      // A little trick to subtract the current cell's state since
      // we added it in the above loop
      neighbors -= board[x][y];

      // Rules of Life
      if      ((board[x][y] == 1) && (neighbors <  2)) next[x][y] = 0;           // Loneliness
      else if ((board[x][y] == 1) && (neighbors >  3)) next[x][y] = 0;           // Overpopulation
      else if ((board[x][y] == 0) && (neighbors == 3)) next[x][y] = 1;           // Reproduction
      else                                             next[x][y] = board[x][y]; // Stasis
    }
  }

  // Next is now our board
  board = next;
}
```


