// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Interactive Selection
// http://www.genarts.com/karl/papers/siggraph91.html

class DNA {

  // A sequência de números que representam os genes
  float[] genes;
  int len = 16;  // O comprimento é arbitrário
  
  //Construtor (cria um DNA aleatório)
  DNA() {
    // DNA is random floating point values between 0 and 1 (!!)
    genes = new float[len];
    for (int i = 0; i < genes.length; i++) {
      genes[i] = random(0,1);
    }
  }
  
  DNA(float[] newgenes) {
    genes = newgenes;
  }
  

  // Crossover
  // Cria uma nova sequencia de DNA a partir de duas 
  DNA crossover(DNA partner) {
    float[] child = new float[genes.length];
    int crossover = int(random(genes.length));
    for (int i = 0; i < genes.length; i++) {
      if (i > crossover) child[i] = genes[i];
      else               child[i] = partner.genes[i];
    }
    DNA newgenes = new DNA(child);
    return newgenes;
  }
  
  // Sorteia um valor de caordo com a probabilidade de mutação.
  void mutate(float m) {
    for (int i = 0; i < genes.length; i++) {
      if (random(1) < m) {
         genes[i] = random(0,1);
      }
    }
  }
}
