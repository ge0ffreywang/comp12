class FGoomba extends FGameObject {

  int direction = L;
  int speed = 50;
  int frame=0;

  FGoomba(float x, float y) {
    
    super();
    attachImage(goomba[0]);
    setPosition(x, y);
    setName("goomba");
    setRotatable(false);
  }

  void act() {
    animate();
    collide();
    move();
  }

  void animate() {
    if (frame>=goomba.length) frame=0;
    if (frameCount%5==0) {
      if (direction==L)attachImage(goomba[frame]);
      if (direction==R)attachImage(reverseImage(goomba[frame]));
      frame++;
    }
  }

  void collide() {
    if (isTouching("gwall")) {
      direction*=-1;
      setPosition(getX()+direction, getY());
    }
  }
  
  void move() {
    float vy=getVelocityY();
    setVelocity(speed*direction, vy);
  }
}
