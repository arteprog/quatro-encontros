# Random Walkers e Perlin Noise

## Números pseudo-randômicos 

Os números randômicos que obtemos utilizando a função random() não são realmente randômicos; portanto são chamados de "pseudo-randômicos". Eles são o resultado de funções matemáticas que simulam randomicidade. A função pode gerar um padrão ao longo do tempo, mas esse período é tão longo para nós que o padrão é imperceptível. Os números pseudo-randômicos funcionam tão bem quanto os randômicos nas aplicações de Processing. 

A randomicidade é observada em uma seqüência quando a ordem e os padrões parecem estar faltando.

## Referência para Processing
A partir do Original em inglês atualizado em: Fri Jul 15 16:36:03 PDT 2005 - Tradução para o Português do Brasil: Luiz Ernesto Merkle - Atualizada em: 30 de novembro de 2005, 9h00 (BRST) e revista por Monica Rizzolli em maio de 2018.


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


Nome | 
Exemplo | 
Descrição |
Sintaxe |
Parâmetros |
Retorno |
Utilização | 
Relacionado
