# Random Walkers e Perlin Noise

## Números pseudo-randômicos 

Os números randômicos que obtemos utilizando a função random() não são realmente randômicos; portanto são chamados de "pseudo-randômicos". Eles são o resultado de funções matemáticas que simulam randomicidade. A função pode gerar um padrão ao longo do tempo, mas esse período é tão longo para nós que o padrão é imperceptível. Os números pseudo-randômicos funcionam tão bem quanto os randômicos nas aplicações de Processing. 

A randomicidade é observada em uma seqüência quando a ordem e os padrões parecem estar faltando.

## [Random Walker](https://github.com/arteprog/Processando-Processing/blob/master/natureza-do-codigo/introducao.md)

### Exemplo 01

```pde

float x, y; // posição x, posição y
float px, py; // posição x anterior, posição y anterior

void setup() {
  size(500, 500); // define o tamanho da tela em pixels. Largura X altura
  x = width/2; // define a posição inicial no eixo x
  y = height/2; // define a posição inicial no eixo y
}

void draw() {
  px = x; // guarda a posição x na variável px
  py = y; // guarda a posição y na variável py
  x = x + random(-10, 10);  // atualiza a posição x sorteando um valor
  y = y + random(-10, 10); // atualiza a posição y sorteando um valor
  line(px, py, x, y); // desenha uma linha entre os pontos (px, py) e (x, y)
}
```

![random1](https://github.com/arteprog/quatro-encontros/blob/master/assets/random1.jpg?raw=true)

## Perlin Noise

>Um algoritmo conhecido como “Ruído de Perlin,” chamado assim em homenagem ao seu criador Ken Perlin, leva esse conceito em consideração. Perlin desenvolveu a função de ruído enquanto trabalhava no filme original Tron, no início dos anos 80. Ela foi elaborada para criar texturas procedurais para efeitos gerados por computador. Em 1997, Perlin ganhou um Oscar de realização técnica com este trabalho. O ruído de Perlin pode ser usado para gerar diversos efeitos com qualidades naturais, como nuvens, paisagens e texturas padronizadas, como por exemplo, o mármore. Referência: [Khan Academy](https://pt.khanacademy.org/computing/computer-programming/programming-natural-simulations/programming-noise/a/perlin-noise)

### Exemplo 02

```pde
float x, y; // posição x, posição y
float px, py; // posição x anterior, posição y anterior
float tempoX = 0; // declarando a variável global tempoX e inicializando com 0
float tempoY = 10; // declarando a variável global tempoY e inicializando com 10

void setup() {
  size(500, 500); // define o tamanho da tela em pixels. Largura X Altura
  x = width * noise(tempoX); // calcula a posição x inicial
  y = height * noise(tempoY); // calcula a posição y inicial
}

void draw() {
  px = x; // guarda a posição x na variável px
  py = y; // guarda a posição y na variável py
  x = width * noise(tempoX);  // atualiza a posição x sorteando um valor
  y = height * noise(tempoY); // atualiza a posição y sorteando um valor
  line(px, py, x, y); // desenha uma linha entre os pontos (px, py) e (x, y)
  // incrementa os tempos a cada frame
  tempoX = tempoX + 0.01;
  tempoY = tempoY + 0.01;
}
```

### Exemplo 03

```pde
float x, y; // posição x, posição y
float px, py; // posição x anterior, posição y anterior
float tempoX = 0; // declarando a variável global tempoX e inicializando com 0
float tempoY = 100; // declarando a variável global tempoY e inicializando com 10

void setup() {
  size(500, 500); // define o tamanho da tela em pixels. Largura X Altura
  x = width/2; // calcula a posição x inicial
  y = height/2; // calcula a posição y inicial
}

void draw() {
  px = x; // guarda a posição x na variável px
  py = y; // guarda a posição y na variável py
  x = x -5 + 10*noise(tempoX);  // atualiza a posição x sorteando um valor
  y = y -5 + 10*noise(tempoY); // atualiza a posição y sorteando um valor
  line(px, py, x, y); // desenha uma linha entre os pontos (px, py) e (x, y)
  // incrementa os tempos a cada frame
  tempoX = tempoX + 0.1;
  tempoY = tempoY + 0.1;
}
```

## Referência para Processing
A partir do original em inglês atualizado em: Fri Jul 15 16:36:03 PDT 2005 - Tradução para o Português do Brasil: Luiz Ernesto Merkle - Atualizada em: 30 de novembro de 2005, 9h00 (BRST) e revista por Monica Rizzolli em maio de 2018.


### random()

**Nome:** random()

**Exemplo:**
```pde 

for(int i=0; i<100; i++) {
  float r = random(50);
  stroke(r*5);
  line(50, i, 50+r, i);
}

----------

for(int i=0; i<100; i++) {
  float r = random(-50, 50);
  stroke(abs(r*5));
  line(50, i, 50+r, i);
}
```

**Descrição:** Gera números pseudo-randômicos. Cada vez que a função random() é chamada, ela retorna um valor não esperado em determinado intervalo. Se um valor é passado a função, ela irá retornar um float entre zero e o valor deste parâmetro. A chamada de função  random(5) retorna valores entre 0.0 e 5.0. Se dois parâmetros são passados, ela irá retornar um float com valor entre estes parâmetros. A chamada de função random(-5.0, 10.2)  retorna valores entre -5.0 e 10.2. Para se converter um número randômico de ponto flutuante para inteiro, use a função int().

**Sintaxe:** 
```pde 
random(valor1);
random(valor1, valor2);
```

**Parâmetros:**

Valor1 - int ou float

Valor2 - int ou float

**Retorno:** float

**Utilização:** Web & Applicações

**Relacionado:** 
```pde
noise()
randomSeed()
```

### noise()

**Nome:** noise()

**Exemplo:**
```pde
float xoff = 0.0;

void draw(){
  background(204);
  xoff = xoff + .01;
  float n = noise(xoff) * width;
  line(n, 0, n, height);
}

----------

float noiseScale=0.02;

void draw() {
  background(0);
  for(int x=0; x<width; x++) {
    float noiseVal = noise((mouseX+x)*noiseScale,mouseY*noiseScale);
    stroke(noiseVal*255);
    line(x, mouseY+noiseVal*80, x, height);
  }
}
```

**Descrição:** Retorna um valor do ruído de Perlin em coordenadas específicas. O ruído de Perlin é um gerador de seqüências randômicas que produz uma sucessão ordenada de modo mais natural de números, se comparada a função padrão random().  Ela foi inventada por Ken Perlin nos anos de 1980, e tem sido utilizada desde então em aplicações gráficas para produzir texturas, movimento natural, formas, terrenos, etc. 

Sua principal diferença da função random() reside no fato de que o ruído de perlin é definido cem um espaço n-dimensional, onde cada par de coordenadas corresponde a um valor fixo-semi-randômico (fixo no tempo de vida de um programa). O valor resultante sempre será entre 0.0 e 1.0. Processing pode computar ruido de Perlin 1D, 2D e 3D, dependendo do número de coordenadas dados. O valor do ruído pode ser animado ao se movimentar pelo espaço de ruído como demonstrado no exemplo acima. A segunda e a terceira dimensão também podem ser interpretadas como tempo. 

O ruído real pode ser estruturado de modo similar a um sinal de áudio, em respeito ao uso que a função faz de freqüências. De modo similar ao conceito de harmônicas em física, o ruído de Perlin é calculado sobre várias oitavas, as quais são somadas para se obter o resultado final. 

Uma outra forma de se ajustar a qualidade da seqüência resultante  é a escala das coordenadas de entrada. Como a função trabalha em um espaço infinito, o valor das coordenadas não importa como tal, mas distância entre coordenadas sucessivas (por exemplo, na utilização de noise() em um laço). Como regra geral, quanto menor a diferença entre coordenadas, mais suave será a seqüência de ruído de Perlin resultante. Passos entre 0.0003 e 0.003 funcionam melhor para a maioria das aplicações, mas pode ser diferente dependendo do uso.

**Sintaxe:** 
```pde
noise(x)
noise(x, y)
noise(x, y, z)
```

**Parâmetros:**
X float: coordenada x no espaço de ruído de Perlin

Y float: coordenada y no espaço de ruído de Perlin

Z float: coordenada z no espaço de ruído de Perlin

**Retorno:** float

**Utilização:** Web & Applicações

**Relacionado:** 
```pde
noiseDetail()
random()
```
