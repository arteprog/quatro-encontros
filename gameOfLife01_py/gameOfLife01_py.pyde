"""
Adaptado de
The Nature of Code, Daniel Shiffman http://natureofcode.com
"""

PLAY = True
CELL_SIZE = 3

def setup():
    global COLS, ROWS, BOARD
    size(600, 400)
    # Initialize ROWS, COLS and set-up arrays
    COLS = width / CELL_SIZE
    ROWS = height / CELL_SIZE
    # Game of life BOARD
    BOARD = [[0] * ROWS for _ in range(COLS)]
    # Call function to fill array with random values 0 or 1
    init()

def draw():
    background(255)
    for i in range(COLS):
        for j in range(ROWS):
            if (BOARD[i][j] == 1): fill(0)
            else:                  fill(255)
            noStroke()  # stroke(0)
            rect(i * CELL_SIZE, j * CELL_SIZE, CELL_SIZE, CELL_SIZE)
    if (PLAY):
        generate()

def keyPressed():
    """
    Reset board when 'r' is pressed
    Pause/Play when SPACE BAR is pressed
    """
    global PLAY
    if (key == ' '):
        PLAY =  not PLAY
    if (key == 'r'):
        init()

def init():
    for i in range(COLS):
        for j in range(ROWS):
            BOARD[i][j] = int(random(2))

# The process of creating the new generation
def generate():
    global BOARD
    next = [[0] * ROWS for _ in range(COLS)]
    # Loop through every spot in our 2D array and check spots neighbors
    for x in range(COLS):
        for y in range(ROWS):
            # Add up all the states in a 3x3 surrounding grid
            neighbors = 0
            for i in range(-1, 2):
                for j in range(-1, 2):
                    neighbors += BOARD[(x + i + COLS) %
                                       COLS][(y + j + ROWS) % ROWS]
            # A little trick to subtract the current cell's state since
            # we added it in the above loop
            neighbors -= BOARD[x][y]
            # Rules of Life
            if   BOARD[x][y] == 1 and neighbors < 2 : next[x][y] = 0 # Loneliness
            elif BOARD[x][y] == 1 and neighbors > 3 : next[x][y] = 0 # Overpopulation
            elif BOARD[x][y] == 0 and neighbors == 3: next[x][y] = 1 # Reproduction
            else:                                     next[x][y] = BOARD[x][y]  # Stasis
    # Next is now our board
    BOARD = next
