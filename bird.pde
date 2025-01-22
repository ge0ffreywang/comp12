class FBird extends FGameObject {


  int direction = L;
  int speed = 100;
  int frame = 0;

  FBird(float x, float y) {
    super();
    setPosition(x, y);
    setName("bird");
    setRotatable(false);
  }

  void act() {
    animate();
    collide();
    move();
  }

  void animate() {
    if (frame >= bird.length) frame = 0;
    if (frameCount % 5 == 0) {
      if (direction == L) attachImage(reverseImage(bird[frame]));
      if (direction == R) attachImage(bird[frame]);
      frame++;
    }
  }

  void collide() {
    if (isTouching("gwall")||isTouching("ghost")||isTouching("koopa")||isTouching("goomba")) {
      direction *= -1;
      setPosition(getX() + direction, getY());
      speed = 100;
    }
    
    if (player.getX() < getX() && player.getY() >= getY()) {
      direction = L;
      speed = 270;
    } else if (player.getX() > getX() && player.getY() >= getY()) {
      direction = R;
      speed = 270;
    } 
    
    
    
    
    if (isTouching("player")) {
      if (player.getY() < getY()-gridSize/2) {
        if (lives<3) {
          lives++;
        }
        score=score+100;
        world.remove(this);
        enemies.remove(this);
        player.setVelocity(player.getVelocityX(), -300);
      } else if (!immune){
        player.canTakeDamage = false;
        player.setPosition(respawnx, respawny);

        lives--;
       
      } else if (immune && isTouching("player")) {
       
        world.remove(this);
        enemies.remove(this);

        player.setVelocity(player.getVelocityX(), -300);
      }
    }
  }

  void move() {
    float vy = getVelocityY();
    setVelocity(speed*direction, vy);
  }
}
