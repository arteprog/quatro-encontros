// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Interactive Selection
// http://www.genarts.com/karl/papers/siggraph91.html

Population population;

void setup() {
  size(900, 300);
  colorMode(HSB, 1.0);
  int popmax = 10;
  float mutationRate = 0.01;  // A pretty high mutation rate here, our population is rather small we need to enforce variety
  // Create a population with a target phrase, mutation rate, and population max
  population = new Population(mutationRate, popmax);
}

void draw() {
  background(1.0);
  // Display the faces
  population.display();
  population.rollover(mouseX, mouseY);
  // Display some text
  textAlign(LEFT);
  fill(0);
  text("['e' to evolve] Generation #:" + population.getGenerations(), 15, 190);
}

// If 'e' is presses, evolve next generation
void keyPressed() {
  if (key == 'e') {
    randomSeed(frameCount);
    population.selection();
    population.reproduction();
  }
}
