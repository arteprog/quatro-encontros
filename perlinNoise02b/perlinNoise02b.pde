float incremento = .01; // escala de incremento do tempo 't'
float amplitude = 250; // amplitude da variação da linha

size(500, 500); // define o tamanho da tela em pixels. Largura X Altura

for (int t = 0; t < width; t++) {
  // desenha uma linha do topo da tela até um número sorteado entre 0 e Altura/2
  // números sorteados pela função random
  line(t, 0, t, amplitude * random(1));
  // desenha uma linha do meio da tela até um número sorteado entre Altura/2 e Altura
  // números sorteados pela função noise
  line(t, height/2, t, height/2 + amplitude * noise(t * incremento));
  // a cada volta do laço o tempo 't' aumenta em 1
}
