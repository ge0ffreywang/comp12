class Respawn extends FGameObject {

  int timer=101;
  Respawn(float x, float y) {
    super();
    setPosition (x, y);
    setName("spawn");
    setRotatable(false);
    setStatic(true);
    //setFill(255);
    attachImage(respawn[0]);
  }

  void act () {

    collide();
  }



  void collide() {
    
    if (isTouching("player")) {
      timer--;
      if (timer==100) {
        sound.coin.rewind();
        sound.coin.play();
      }
      respawnx = getX();
      respawny = getY()-101;
      attachImage(respawn[1]);
    } else {
      timer=100;
    }
  }
}
