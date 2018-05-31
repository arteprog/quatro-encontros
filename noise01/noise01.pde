float tempo = 0; // declarando a variável global tempo e inicializando com 0

void setup() {
  size(500, 500); // define o tamanho da tela em pixels. Largura X Altura
}

void draw() {
  // desenha uma linha do topo da tela até um número sorteado entre 0 e Altura/2
  // números sorteados pela função random
  line(tempo * 10, 0, tempo * 10, height/2 * random(1));
  // desenha uma linha do meio da tela até um número sorteado entre Altura/2 e Altura
  // números sorteados pela função noise
  line(tempo * 10, height/2, tempo * 10, height/2 + height/2 * noise(tempo));
  // incrementa o tempo a cada frame
  tempo += 0.1;
}
