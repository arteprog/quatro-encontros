/* Exemplo de orientação a objetos
 *  com uma lista dinâmica 'ArrayList' de bolinhas da classe Bola.
 */

ArrayList<Bola> bolas;  // lista de bolas do grupo

void setup() {
  size(600, 400);
  noStroke();
  bolas = new ArrayList<Bola>(); // bolas é uma lista de bolinhas
  for (int i = 0; i < 50; i++) {
    bolas.add(new Bola(width/2, height/2, 5, 20));
  }
}

void draw() {
  background(200);
  for (Bola bola : bolas) {
    bola.desenhar();  
    bola.mover();
  }
  // remove bolas que sairam para baixo do canvas
  for (int i = bolas.size()-1; i >= 0; i--) { 
    Bola bola = bolas.get(i);
    if (bola.y > height) {
      bolas.remove(i);
    }
  }
}
void mousePressed() {
  //for (int i = 0; i < 50; i++) {
  bolas.add(new Bola(mouseX, mouseY, 10, 20));
  //}
}

class Bola {
  float x, y, vx, vy, tamanho;
  color cor;
  Bola(float px, float py, float tam_min, float tam_max) {
    x = px;
    y = py;
    tamanho = random(tam_min, tam_max);
    cor = color(random(255), random(255), random(255), 128);
    vx = random(-2, 2);
    vy = random(-2, 2);
  }
  void desenhar() {
    fill(cor);
    ellipse ( x, y, tamanho, tamanho);
  }
  void mover() {
    tamanho = tamanho * .995;
    x = x + vx;
    if (x < 0 || x > width) { 
      vx = -vx;
    }
    vy = vy + 0.02;
    y = y + vy;
    if (y < 0) { 
      vy = -vy;
    }
  }
}
