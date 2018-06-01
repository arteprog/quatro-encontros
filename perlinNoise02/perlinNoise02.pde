float tempo = 0; // declarando a variável global tempo e inicializando com 0
float incremento = .01;
float amplitude = 250;

void setup() {
  size(500, 500); // define o tamanho da tela em pixels. Largura X Altura
}

void draw() {
  // desenha uma linha do topo da tela até um número sorteado entre 0 e Altura/2
  // números sorteados pela função random
  line(tempo / incremento, 0, tempo / incremento, amplitude * random(1));
  // desenha uma linha do meio da tela até um número sorteado entre Altura/2 e Altura
  // números sorteados pela função noise
  line(tempo / incremento, height/2, tempo / incremento, height/2 + amplitude * noise(tempo));
  // incrementa o tempo a cada frame
  tempo += incremento;
}
