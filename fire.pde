class lava extends FGameObject {
  int frame=0;


  lava(float x, float y) {
    super();
    setPosition(x, y);
    setName("lava");
    setStatic(true);
  }

  void act() {
    if (isTouching("player") && immune==false) {
      player.setPosition(respawnx, respawny);
      lives--;
    }
    if (frame>=lava.length) frame=0;
    if (frameCount%5==0) {
      attachImage(lava[frame]);

      frame++;
    }
  }
}
