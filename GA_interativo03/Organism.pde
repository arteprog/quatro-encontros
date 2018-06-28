// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com
// Interactive Selection
// http://www.genarts.com/karl/papers/siggraph91.html

// A classe do nooso "organismo", contem uma sequencia de DNA, valor de aptidão/"fitness",
// e posição na tela. A aptidão é calculada pelo tempo do mouse clicado sobre o indivíduo.

class Organism {

  DNA dna;          // 
  float fitness;    // Quão apto é este organismo?
  float x, y;       // Posição na tela
  int wh = 110;      // Quadrado em volta do organismo
  boolean mouseIsOver; // O mouse está sobre este organismo?
  float a, ra, rl;

  // Construtor, cria um novo organism0
  Organism(DNA dna_, float x_, float y_) {
    dna = dna_;
    x = x_; 
    y = y_;
    fitness = 1;
  }

  // Display desenha o organismo
  void display() {
    // Como cada gene é um valor entre 0 and 1, usamos o map()
    float r          = map(dna.genes[0], 0, 1, 0, 70);
    color c          = color(dna.genes[1], dna.genes[2], dna.genes[3]);
    float eye_y      = map(dna.genes[4], 0, 1, 0, 5);
    float eye_x      = map(dna.genes[5], 0, 1, 0, 10);
    float eye_size   = map(dna.genes[5], 0, 1, 0, 10);
    color eyecolor   = color(dna.genes[4], dna.genes[5], dna.genes[6]);
    color mouthColor = color(dna.genes[7], dna.genes[8], dna.genes[9]);
    float mouth_y    = map(dna.genes[5], 0, 1, 0, 25);
    float mouth_x    = map(dna.genes[5], 0, 1, -25, 25);
    float mouthw     = map(dna.genes[5], 0, 1, 0, 50);
    float mouthh     = map(dna.genes[5], 0, 1, 0, 10);

    // Calculadas as propriedades, vamos usar essas variáveis para desenhar.
    pushMatrix();
    translate(x, y);
    noStroke();

    // Cabeça
    fill(c);
    ellipseMode(CENTER);
    ellipse(0, 0, r, r);

    // Olhos
    fill(eyecolor);
    rectMode(CENTER);
    rect(-eye_x, -eye_y, eye_size, eye_size);
    rect( eye_x, -eye_y, eye_size, eye_size);

    // Boca
    fill(mouthColor);
    rectMode(CENTER);
    rect(mouth_x, mouth_y, mouthw, mouthh);

    // Retângulo de contorno
    stroke(0.25);
    if (mouseIsOver) fill(0, 0.25);
    else noFill();
    rectMode(CENTER);
    rect(0, 0, wh, wh);
    popMatrix();

    // Texto com o valor de fitness/aptidão
    textAlign(CENTER);
    fill(0);
    text(int(fitness), x, y+70);
  }

  float getFitness() {
    return fitness;
  }

  DNA getDNA() {
    return dna;
  }

  // Increment fitness if mouse is rolling over organism
  void checkMouseOver(int mx, int my) {
    int cx = int(x-wh/2);
    int cy = int(y-wh/2);
    if (mx > cx && mx < cx + wh  && my > cy && my < cy + wh) {
      mouseIsOver = true;
      if (mousePressed) fitness += 0.25;
    } else {
      mouseIsOver = false;
    }
  }
}
