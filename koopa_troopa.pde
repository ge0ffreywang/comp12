class FKoopa extends FGameObject {

  int direction = R;
  int speed = 50;
  int frame=0;
  PImage[] animation;

  FKoopa(float x, float y, PImage[] a) {
    super();
    attachImage(a[0]);
    setPosition(x, y);
    setName("koopa");
    setRotatable(false);
    animation=a;
  }

  void act() {
    animate();
    collide();
    move();
  }
  void hammer() {
  }
  void animate() {
    if (frame>=animation.length) frame=0;
    if (frameCount%5==0) {
      if (direction==R)attachImage(animation[frame]);
      if (direction==L)attachImage(reverseImage(animation[frame]));
      frame++;
    }
  }

  void collide() {

    if (isTouching("gwall"))
    {
      direction *= -1;
      setPosition(getX() + direction, getY());
    }
    if (isTouching("goomba")||isTouching("ghost")||isTouching("bird"))
    {
      setPosition(getX() + direction*20, getY());
    }

    if (isTouching("player")) {

      if (player.getY() < getY() - gridSize/2) {

        FShell newShell = new FShell(getX(), getY()-gridSize/2, shell);
        world.add(newShell);
        enemies.add(newShell);

        world.remove(this);
        enemies.remove(this);


        player.setVelocity(player.getVelocityX(), -300);
      } else if (!immune){

        player.setPosition(respawnx, respawny);
        lives--;
      }else if (immune){
world.remove(this);
        enemies.remove(this);
       
      }
    }
  }

  void move() {
    float vy=getVelocityY();
    setVelocity(speed*direction, vy);
  }
}


class FShell extends FGameObject {

  boolean isMoving = false;
  int direction = 0;
  int speed = 300;
  int frame=0;
  PImage[] animation;


  FShell(float x, float y, PImage[] a) {
    super();
    attachImage(a[0]);
    setPosition(x, y);
    setName("shell");
    setRotatable(false);
    animation=a;
  }

  void act() {
    animate();
    collide();
    move();
  }

  void animate() {
    if (isMoving) {
      if (frame>=animation.length) frame=0;
      if (frameCount%5==0) {
        if (direction==R)attachImage(animation[frame]);
        if (direction==L)attachImage(reverseImage(animation[frame]));
        frame++;
      }
    }
  }

  void move() {

    if (isMoving) {
      setVelocity(direction * speed, getVelocityY());
    } else {

      setVelocity(0, getVelocityY());
    }
  }

  void collide() {

    if (isTouching("player")&&(frameCount%20==0))
    {

      if (player.getY() < getY() - gridSize/2) {
        score=score+100;
        world.remove(this);
        enemies.remove(this);

        player.setVelocity(player.getVelocityX(), -300);
      } else if (!immune) {

        if (!isMoving) {

          direction = (player.getX() < getX()) ? 1 : -1;
          isMoving = true;
        } else {

          player.setPosition(respawnx, respawny);
          lives--;
        }
      } else if (immune) {
        score=score+100;
        world.remove(this);
        enemies.remove(this);
      }
    }


    if (isTouching("gwall")) {
      direction *= -1;
      setPosition(getX() + direction, getY());
    }

    if (isMoving) {
      for (int i = enemies.size()-1; i >= 0; i--) {
        FGameObject enemy = enemies.get(i);
        if (enemy != this && sensorTouching(enemy, "shell")) {
          world.remove(enemy);
          enemies.remove(enemy);
        }
      }
    }
  }
}
