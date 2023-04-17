float tile_size;
float board_size;
int nb_tiles = 7;
Hero hero;
int turn_counter = 0;
ArrayList<Ennemy> ennemies = new ArrayList<Ennemy>();

void setup() {
  size(1600, 800);
  board_size = min(width, height);
  tile_size = board_size/nb_tiles;
  noStroke();
  hero = new Priest(nb_tiles/2, nb_tiles - 1, 100);
  for (int i = 0; i < nb_tiles; i++) {
    ennemies.add(new Minion(i, 0));
  }
}

void draw() {
  background(0);
  drawBoard();
  for (Ennemy e : ennemies) {
    e.checkDeath();
    e.showNextMove();
  }
  for (Ennemy e : ennemies) {
    e.show();
  }
  hero.checkDeath();
  hero.show();
}

void drawBoard() {
  float board_start = (width - board_size)/2;
  fill(0, 80, 150);
  rect(board_start, 0, board_size, board_size);
  fill(0, 30, 80);
  for (int i = 0; i < nb_tiles; i++) {
    for (int j = 0; j < nb_tiles; j++) {
      if ((i+j)%2 == 1) {
        rect(board_start + i * tile_size, j * tile_size, tile_size, tile_size);
      }
    }
  }
}

void endOfTurn() {
  turn_counter++;
  hero.attack();
  for (Ennemy e : ennemies) {
    e.checkDeath();
    e.move();
  }
}

void mousePressed() {
  int x = (int)(mouseX - (width - board_size)/2) / (int)tile_size;
  int y = (int)(mouseY) / (int)tile_size;
  hero.move(new PVector(x, y));
}
