class ghost extends FGameObject {


  int direction = L;
  int speed = 50;
  int timer=0;

  ghost(float x, float y, PImage[] a) {
    super();
    attachImage(ghost);
    setPosition(x, y);
    setName("ghost");
    setRotatable(false);
  }

  void act() {
    timer=timer+1;
    if (timer==400) {
      timer=0;
    }
    animate();
    collide();
    move();
  }
  void hammer() {
  }
  void animate() {
    if (timer<200) {
      if (direction==R)attachImage(ghost);
      if (direction==L)attachImage(reverseImage(ghost));
    }

    if (timer>200) {
      attachImage(noghost);
    }
  }

  void collide() {
    if (isTouching("gwall")||isTouching("bird")||isTouching("koopa")||isTouching("goomba")) {
      direction*=-1;
      setPosition(getX()+direction, getY());
    }
    if (isTouching("player")) {
      if (player.getY()<getY()-gridSize/2) {
        score=score+100;
        world.remove(this);
        enemies.remove(this);
        player.setVelocity(player.getVelocityX(), -300);
      } else {

        player.setPosition(respawnx, respawny);
        if(immune==false){
        lives=lives--;
        }
      }
    }
  }

  void move() {
    float vy=getVelocityY();
    setVelocity(speed*direction, vy);
  }
}
