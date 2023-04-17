class Archer extends Hero {
  Archer(int x_, int y_, int currentHealth_) {
    super(x_, y_);
    health = currentHealth_;
    attack = 11;
  }
  
  void attack() {
    int max = 0;
    Ennemy target = null;
    for (Ennemy e : ennemies) {
      if (e.health > max) {
        target = e;
        max = e.health;
      }
    }
    if (target != null) {
      target.health -= attack;
    }
  }
  
  void generatePossibleMoves(PVector pos) {
    possibleMoves.clear();
    if (pos.x > 0) {
      if (pos.y > 0) {
        possibleMoves.add(new PVector(pos.x - 1, pos.y - 1));
      }
      if (pos.y < nb_tiles - 1) {
        possibleMoves.add(new PVector(pos.x - 1, pos.y + 1));
      }
      possibleMoves.add(new PVector(pos.x - 1, pos.y));
    }

    if (pos.x < nb_tiles - 1) {
      if (pos.y > 0) {
        possibleMoves.add(new PVector(pos.x + 1, pos.y - 1));
      }
      if (pos.y < nb_tiles - 1) {
        possibleMoves.add(new PVector(pos.x + 1, pos.y + 1));
      }
      possibleMoves.add(new PVector(pos.x + 1, pos.y));
    }
    if (pos.y > 0) {
      possibleMoves.add(new PVector(pos.x, pos.y - 1));
    }
    if (pos.y < nb_tiles - 1) {
      possibleMoves.add(new PVector(pos.x, pos.y + 1));
    }
    
    if (pos.x > 1 && pos.y > 1) {
      possibleMoves.add(new PVector(pos.x - 2, pos.y - 2));
    }
    if (pos.x > 1 && pos.y < nb_tiles - 2) {
      possibleMoves.add(new PVector(pos.x - 2, pos.y + 2));
    }
    if (pos.x < nb_tiles - 2 && pos.y > 1) {
      possibleMoves.add(new PVector(pos.x + 2, pos.y - 2));
    }
    if (pos.x < nb_tiles - 2 && pos.y < nb_tiles - 2) {
      possibleMoves.add(new PVector(pos.x + 2, pos.y + 2));
    }
  }
}
