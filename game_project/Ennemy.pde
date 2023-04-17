class Ennemy {
  PVector pos;
  PVector toGo;
  boolean moving = false;
  int maxHealth;
  int health;
  int attack;
  ArrayList<PVector> possibleMoves = new ArrayList<PVector>();
  PImage image;
  PVector nextMove;
  boolean dead;

  Ennemy(int x_, int y_, int maxHealth_, int attack_) {
    attack = attack_;
    maxHealth = maxHealth_;
    pos = new PVector(x_, y_);
    toGo = pos.copy();
    nextMove();
    health = maxHealth;
  }

  void show() {
    if (!dead) {
      if (dist(pos.x, pos.y, toGo.x, toGo.y) < .1) {
        pos = toGo.copy();
        if (moving) {
          moving = false;
          nextMove();
        }
      }
      if (pos.x != toGo.x || pos.y != toGo.y) {
        PVector diff = toGo.copy().sub(pos);
        pos.add(diff.setMag(.1));
      }
      fill(255, 0, 0);
      if (image != null) {
        image(image, pos.x, pos.y);
      } else {
        circle(pos.x * tile_size + tile_size / 2 + (width - board_size)/2, pos.y * tile_size + tile_size / 2, tile_size * .8);
      }

      //showHealth
      fill(0, 255, 0);
      rect(pos.x * tile_size + .1 * tile_size + (width - board_size)/2, pos.y * tile_size + .1 * tile_size, .8 * tile_size * (float)health / (float)maxHealth, .1 * tile_size);
      fill(255, 0, 0);
      rect(pos.x * tile_size + .1 * tile_size + (width - board_size)/2 + .8 * tile_size * (float)health / (float)maxHealth, pos.y * tile_size + .1 * tile_size, .8 * tile_size * (float)(maxHealth - health) / (float)maxHealth, .1 * tile_size);
    }
  }

  void showNextMove() {
    if (!dead) {
      fill(150, 0, 0);
      rect(nextMove.x * tile_size + (width - board_size)/2, nextMove.y * tile_size, tile_size, tile_size);
    }
  }

  void nextMove() {
    attack();
    hero.checkDeath();
    generatePossibleMoves();
    removeImpossibleMoves();
    PVector move;
    float b;
    if (possibleMoves.size() > 0) {
      do {
        b = random(1);
        int a = (int) random(possibleMoves.size());
        move = possibleMoves.get(a);
      } while (dist(pos.x, pos.y, hero.pos.x, hero.pos.y) < dist(move.x, move.y, hero.pos.x, hero.pos.y) && b > .05);
    } else {
      move = pos.copy();
    }
    nextMove = move.copy();
  }

  void move() {
    if (hero.pos.x != nextMove.x || hero.pos.y != nextMove.y) {
      toGo = nextMove.copy();
      moving = true;
    }
  }

  void attack() {
  }

  void generatePossibleMoves() {
  }

  void removeImpossibleMoves() {
    for (int i = possibleMoves.size() - 1; i > -1; i--) {
      for (Ennemy e : ennemies) {
        if (e != this && e.nextMove != null && !e.dead) {  
          if (e.nextMove.x == possibleMoves.get(i).x && e.nextMove.y == possibleMoves.get(i).y) {
            possibleMoves.remove(i);
            break;
          }
        }
      }
    }
  }

  void checkDeath() {
    if (health <= 0) {
      dead = true;
    }
  }
}
