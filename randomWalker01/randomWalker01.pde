float x, y; // posição x, posição y
float px, py; // posição x anterior, posição y anterior

void setup() {
  size(500, 500); // define o tamanho da tela em pixels. Largura X altura
  x = width/2; // define a posição inicial no eixo x
  y = height/2; // define a posição inicial no eixo y
}

void draw() {
  px = x; // guarda a posição x na variável px
  py = y; // guarda a posição y na variável py
  x = x + random(-10, 10);  // atualiza a posição x sorteando um valor
  y = y + random(-10, 10); // atualiza a posição y sorteando um valor
  line(px, py, x, y); // desenha uma linha entre os pontos (px, py) e (x, y)
}
