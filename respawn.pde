class Respawn extends FGameObject {


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
      respawnx = getX();
      respawny = getY()-100;
      attachImage(respawn[1]);
    }
  }
}
