float x, y; // posição x, posição y
float px, py; // posição x anterior, posição y anterior
float tempoX = 0; // declarando a variável global tempoX e inicializando com 0
float tempoY = 100; // declarando a variável global tempoY e inicializando com 10

void setup() {
  size(500, 500); // define o tamanho da tela em pixels. Largura X Altura
  x = width/2; // calcula a posição x inicial
  y = height/2; // calcula a posição y inicial
}

void draw() {
  px = x; // guarda a posição x na variável px
  py = y; // guarda a posição y na variável py
  x = x -5 + 10*noise(tempoX);  // atualiza a posição x sorteando um valor
  y = y -5 + 10*noise(tempoY); // atualiza a posição y sorteando um valor
  line(px, py, x, y); // desenha uma linha entre os pontos (px, py) e (x, y)
  // incrementa os tempos a cada frame
  tempoX = tempoX + 0.1;
  tempoY = tempoY + 0.1;
}
