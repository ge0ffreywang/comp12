class FThwomp extends FGameObject {

  int state;
  float restingX, restingY;
  FBox bottomSensor;
  FThwomp(float x, float y) {
    super(2*gridSize, 2*gridSize);
    setPosition(x, y);
    restingX = x;
    restingY = y;
    setName("FThwomp");
    setRotatable(false);
    setStatic(true);
    setSensor(false);
    attachImage(thwomp[0]);
    state=1;
    bottomSensor = new FBox(gridSize, 2);
    bottomSensor.setSensor(true);
    bottomSensor.setName("hammer");  //this line is critical to define a name of enemy
    world.add(bottomSensor);
  }

  void act() {
    bottomSensor.setPosition(getX(), getY()+gridSize);
    bottomSensor.setVelocity(getVelocityX(), getVelocityY());
    if (state==1) {
      setStatic(true);
      attachImage(thwomp[0]);
      if (player.getY()>getY() && player.getY()<getY()+10*gridSize && abs(getX()-player.getX())<gridSize) {
        state=2;
      }
    }
    if (state==2) {
      setStatic(false);
      attachImage(thwomp[1]);
    }
    if (sensorTouching(bottomSensor, "stone")) {
      state=3;
    }
    if (sensorTouching(bottomSensor, "player")) {
      state=3;
    }
    if (state==3) {
      setVelocity(0, -200);
      if (dist(getX(), getY(), restingX, restingY) < 5) {
        state=1;
      }
    }
    if (isTouching("player")) {
      if (player.getY()>getY()+gridSize/2) {

        if (!starOn) {
          player.setPosition(respawnx, respawny);
          lives--;
        }
      }
    }
    if (isTouching("player") && starOn) {
      state=3;
    }
    setPosition(restingX, getY());
    //println("Resting X:"+restingX+", Resting Y:"+restingY+", getY():"+getY());
  }
}
