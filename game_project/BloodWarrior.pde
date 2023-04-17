class BloodWarrior extends Hero {
  BloodWarrior(int x_, int y_, int currentHealth_) {
    super(x_, y_);
    health = currentHealth_;
    attack = 8;
  }
  
  void attack() {
    generatePossibleMoves(toGo);
    health -= 12;
    for (Ennemy e : ennemies) {
      for (PVector p : possibleMoves) {
        if (p.x == e.pos.x && p.y == e.pos.y) {
          e.health -= attack;
          health += 4;
        }
      }
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
  }
}
