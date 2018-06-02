float incremento = .01; // também é usado o nome "escala" (ou em inglês "scale")
float amplitude = 250;

size(500, 500); // define o tamanho da tela em pixels. Largura X Altura

for (int x = 0; x < width; x++) {
  // desenha uma linha do topo da tela até um número sorteado entre 0 e Altura/2
  // números sorteados pela função random
  line(x, 0, x, amplitude * random(1));
  // desenha uma linha do meio da tela até um número sorteado entre Altura/2 e Altura
  // números sorteados pela função noise
  line(x, height/2, x, height/2 + amplitude * noise(x * incremento));
  // incrementa o tempo a cada frame
}
