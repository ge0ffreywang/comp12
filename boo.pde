class FBoo extends ghost {

  // A flag to track if Boo should be moving or not based on player's position
  boolean isFacingPlayer = false;
  int frame_move=0;
  int frame_still=2;
  PImage[] animation;
  
  FBoo(float x, float y, PImage[] a) {
    super(x, y, a);
    setName("boo");
    boolean isFacingPlayer = false;
    frame_move=0;
    frame_still=2;
    animation=a;
  }

  void act() {
    isFacingPlayer = isPlayerFacingBoo();

    animate();
    collide();
    move();
  }

  // Determine if the player is facing the Boo based on relative position
  boolean isPlayerFacingBoo() {
    if (player.getX() < getX()) {
      // Player is on the left side of Boo
      return (player.getVelocityX() > 0) && (getVelocityX()<0); // Player moving right (boo facing left)
    }
    if (player.getX() > getX()) {
      // Player is on the right side of Boo
      return (player.getVelocityX() < 0)  && (getVelocityX()>0); // Player moving left (boo facing right)
    }
    return false;
  }

  void animate_move() {
    if (frame_move>=2) frame_move=0;
    if (frameCount%5==0) {
      if (direction==R)attachImage(animation[frame_move]);
      if (direction==L)attachImage(reverseImage(animation[frame_move]));
      frame_move++;
    }
  }

  void animate_still() {
    if (frame_still>=5) frame_still=2;
    if (frameCount%5==0) {
      if (direction==R)attachImage(animation[frame_still]);
      if (direction==L)attachImage(reverseImage(animation[frame_still]));
      frame_still++;
    }
  }


  void animate() {
  
    if (isFacingPlayer) {
      animate_still();
    } else {
      animate_move();
    }
  }

  void move() {
    float vy = getVelocityY();
    if (!isFacingPlayer) {
      setVelocity(speed * direction, vy);
    } else {
      setVelocity(0, getVelocityY()); // Stay still when facing the player
    }
  }
}
