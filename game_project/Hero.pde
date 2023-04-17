class Hero {
  PVector pos;
  PVector toGo;
  boolean takingDamage = false;
  boolean moving = false;
  int maxHealth = 100;
  int health;
  int attack;
  ArrayList<PVector> possibleMoves = new ArrayList<PVector>();
  PImage image;
  boolean dead;

  Hero (int x_, int y_) {
    pos = new PVector(x_, y_);
    toGo = pos.copy();
    health = maxHealth;
  }

  void show() {
    if (!dead) {
      if (dist(pos.x, pos.y, toGo.x, toGo.y) < .1) {
        pos = toGo.copy();
        if (takingDamage) {
          toGo.y += .6;
          takingDamage = false;
        } else if (moving) {
          moving = false;
          endOfTurn();
        }
      }
      if (pos.x != toGo.x || pos.y != toGo.y) {
        PVector diff = toGo.copy().sub(pos);
        pos.add(diff.setMag(.1));
      }
      fill(255);
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

      generatePossibleMoves(toGo);
      removeImpossibleMoves();
      showMoves();
    }
  }

  void showMoves() {
    fill(0, 50, 110);
    for (PVector p : possibleMoves) {
      circle(p.x * tile_size + tile_size / 2 + (width - board_size)/2, p.y * tile_size + tile_size / 2, tile_size * .3);
    }
  }

  void move(PVector destination) {
    for (PVector p : possibleMoves) {
      if (p.x == destination.x && p.y == destination.y) {
        toGo = destination.copy();
        moving = true;
        return;
      }
    }
  }

  void attack() {
  }
  
  void generatePossibleMoves(PVector pos) {
  }



  void removeImpossibleMoves() {
    for (int i = possibleMoves.size() - 1; i > -1; i--) {
      for (Ennemy e : ennemies) {
        if (e.pos.x == possibleMoves.get(i).x && e.pos.y == possibleMoves.get(i).y && !e.dead) {
          possibleMoves.remove(i);
          break;
        }
      }
    }
  }

  void checkDeath() {
    if (health <= 0) {
      dead = true;
    }
  }
  
  void takeDamage() {
    takingDamage = true;
    toGo.y -= .6;
  }
}
