/*
 Exemplo de Perlin Noise em duas dimensões 
 Comparado com um random simples
 */

float perlinScale = 0.2;

void setup() {
  size(500, 500); // define o tamanho da tela em pixels. Largura X Altura
  noStroke();
  fill(0);
}

void draw() {
  noLoop();
  background(200);
  int cols = 50;
  float tam = width / cols;
  for (int x = 0; x < cols; x++) {
    for (int y = 0; y < cols/2; y++) {
      float dia = tam * random(1);
      ellipse(tam/2 + x * tam, tam/2 + y * tam, dia, dia);
    }
  }
  for (int x = 0; x < cols; x++) {
    for (int y = 0; y < cols/2; y++) {
      float dia = tam * noise(x*perlinScale, y*perlinScale);
      ellipse(tam/2 + x * tam, height/2 + tam/2 + y * tam, dia, dia);
    }
  }
}
