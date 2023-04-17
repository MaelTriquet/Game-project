class Priest extends Hero {
  Priest(int x_, int y_, int currentHealth_) {
    super(x_, y_);
    health = currentHealth_;
    attack = 3;
  }
  
  void attack() {
    generatePossibleMoves(toGo);
    health = min(health + 15, maxHealth);
    for (Ennemy e : ennemies) {
      for (PVector p : possibleMoves) {
        if (p.x == e.pos.x && p.y == e.pos.y) {
          e.health -= attack;
        }
      }
    }
  }
  
  void generatePossibleMoves(PVector pos) {
    possibleMoves.clear();
    if (pos.x > 0) {
      possibleMoves.add(new PVector(pos.x - 1, pos.y));
    }
    if (pos.x < nb_tiles - 1) {
      possibleMoves.add(new PVector(pos.x + 1, pos.y));
    }
    if (pos.y > 0) {
      possibleMoves.add(new PVector(pos.x, pos.y - 1));
    }
    if (pos.y < nb_tiles - 1) {
      possibleMoves.add(new PVector(pos.x, pos.y + 1));
    }
  }
}
