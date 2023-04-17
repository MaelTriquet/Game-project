class LargeMinion extends Ennemy{
  LargeMinion(int x_, int y_) {
    super(x_, y_, 25, 9);
  }
  
  void attack() {
    generatePossibleMoves();
    for (PVector p : possibleMoves) {
      if (p.x == hero.pos.x && p.y == hero.pos.y) {
        hero.health -= attack;
        if (!hero.takingDamage) {
          hero.takeDamage();
        }
      }
    }
  }
  
  void generatePossibleMoves() {
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
