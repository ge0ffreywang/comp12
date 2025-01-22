class Fflag extends FGameObject {
  int n=1;
  Fflag(float x, float y) {
    super();
    setPosition (x, y);
    setName("flag");
    attachImage(flag);
    setStatic(true);
    setSensor(true);
  }

  void act () {
    if (n==3)n=0;
    if (isTouching("player")) {
      respawnx =100;
      respawny =0;

      if (mode == M1) {
        world.clear();
        resetWorld(map2);
        loadPlayer();
        mode = M2;
      respawnx = 100;
      respawny = 0;
      } else if (mode == M2) {
        // YouWin
        world.clear();
        mode = WIN;
        loadPlayer();
      }
    }
  }
}
