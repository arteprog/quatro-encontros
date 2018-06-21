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
