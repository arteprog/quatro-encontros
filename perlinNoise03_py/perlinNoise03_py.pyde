"""
Exemplo de Perlin Noise em duas dimensões 
Comparado com um random simples
"""

perlinScale = 0.2

def setup():
    size(500, 500)  # define o tamanho da tela em pixels. Largura X Altura
    noStroke()
    fill(0)

def draw():
    noLoop()
    background(200)
    cols = 50
    tam = width / cols

    for x in range(cols):
        for y in range(cols / 2):
            dia = tam * random(1)
            ellipse(tam / 2 + x * tam, tam / 2 + y * tam, dia, dia)

    for x in range(cols):
        for y in range(cols / 2):
            dia = tam * noise(x * perlinScale, y * perlinScale)
            ellipse(tam / 2 + x * tam, height / 2 + tam / 2 + y * tam,
                    dia, dia)
