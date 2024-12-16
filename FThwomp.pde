class FThwomp extends FGameObject {

  int mode;
  FThwomp(float x, float y) {
    super();
    setPosition(x, y);
    setName("FThwomp");
    setRotatable(false);
    setStatic(true);
    setSensor(false);
    mode=1;
  }

  void act() {
    if (mode==1){
      setStatic(false);
      if (player.getY()>getY() && player.getY()<getY()+4*gridSize) {
        mode=2;
      }
    }
    if (mode==2) {
      setStatic(true);
    }
    if (isTouching("stone")) {
      mode=3;
    }
    if (mode==3) {
      setVelocity(0, -200);
      if (isTouching("stone")) {
        mode=1;
      }
    }
  }
}
