// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Interactive Selection
// http://www.genarts.com/karl/papers/siggraph91.html

// Classe para descrever uma população de organismos

class Population {

  float mutationRate;           // Taxa de mutação
  Organism[] population;        // array da população atual de organismos
  ArrayList<Organism> matingPool;   // ArrayList do "mating pool"
  int generations;              // Número de gerações

  //  Novo população
  Population(float m, int num) {
    mutationRate = m;
    population = new Organism[num];
    matingPool = new ArrayList<Organism>();
    generations = 0;

    float s = width/5.2;
    int i = 0;
    for (int x = 0; x < 5; x++) {
      for (int y = 0; y < 5; y++) {
        population[i] = new Organism(new DNA(), s/1.75+x*s, s/1.75+y*s);
        i++;
      }
    }
  }

  // Mostra todos os organismos
  void display() {
    for (int i = 0; i < population.length; i++) {
      population[i].display();
    }
  }

  // Veja se o mouse está sobre o organismo
  void rollover(int mx, int my) {
    for (int i = 0; i < population.length; i++) {
      population[i].checkMouseOver(mx, my);
    }
  }

  // Gerar o "mating pool"
  void selection() {
    // Clear the ArrayList
    matingPool.clear();

    // Calculate total fitness of whole population
    float maxFitness = getMaxFitness();

    // Calculate fitness for each member of the population (scaled to value between 0 and 1)
    // Based on fitness, each member will get added to the mating pool a certain number of times
    // A higher fitness = more entries to mating pool = more likely to be picked as a parent
    // A lower fitness = fewer entries to mating pool = less likely to be picked as a parent
    for (int i = 0; i < population.length; i++) {
      float fitnessNormal = map(population[i].getFitness(), 0, maxFitness, 0, 1);
      int n = (int) (fitnessNormal * 100);  // Arbitrary multiplier
      for (int j = 0; j < n; j++) {
        matingPool.add(population[i]);
      }
    }
  }  

  // Making the next generation
  void reproduction() {
    // Refill the population with children from the mating pool
    for (int i = 0; i < population.length; i++) {
      // Sping the wheel of fortune to pick two parents
      int m = int(random(matingPool.size()));
      int d = int(random(matingPool.size()));
      // Pick two parents
      Organism mom = matingPool.get(m);
      Organism dad = matingPool.get(d);
      // Get their genes
      DNA momgenes = mom.getDNA();
      DNA dadgenes = dad.getDNA();
      // Mate their genes
      DNA child = momgenes.crossover(dadgenes);
      // Mutate their genes
      child.mutate(mutationRate);
      // Fill the new population with the new child
      population[i] = new Organism(child, population[i].x, population[i].y);
    }
    generations++;
  }

  int getGenerations() {
    return generations;
  }

  // Encontra o maior valor de fitness na população
  float getMaxFitness() {
    float record = 0;
    for (int i = 0; i < population.length; i++) {
      if (population[i].getFitness() > record) {
        record = population[i].getFitness();
      }
    }
    return record;
  }
}
