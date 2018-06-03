tempo = 0  # declarando a variável global tempo e inicializando com 0
incremento = .01  # escala de incremento do tempo
amplitude = 250  # tamanho máximo possível da linha

def setup():
    size(500, 500)  # define o tamanho da tela em pixels. Largura X Altura

def draw():
    global tempo
    # desenha uma linha do topo da tela até um número sorteado entre 0 e Altura/2
    # números sorteados pela função random
    line(tempo, 0, tempo, amplitude * random(1))
    # desenha uma linha do meio da tela até um número sorteado entre Altura/2 e Altura
    # números sorteados pela função noise
    line(tempo, height / 2, tempo,
         height / 2 + amplitude * noise(tempo * incremento))
    # incrementa o tempo a cada frame
    tempo = tempo + 1
    
    if tempo >= width: noLoop()
