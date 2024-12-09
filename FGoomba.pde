class FGoomba extends FGameObject {

  int direction = L;
  int speed = 50;
  int frame=0;
  PImage[] animation;

  FGoomba(float x, float y, PImage[] a) {
    super();
    attachImage(a[0]);
    setPosition(x, y);
    setName("goomba");
    setRotatable(false);
    animation=a;
  }

  void act() {
    animate();
    collide();
    move();
  }

  void animate() {
    if (frame>=animation.length) frame=0;
    if (frameCount%5==0) {
      if (direction==L)attachImage(animation[frame]);
      if (direction==R)attachImage(reverseImage(animation[frame]));
      frame++;
    }
  }

  void collide() {
    if (isTouching("gwall")) {
      direction*=-1;
      setPosition(getX()+direction, getY());
    }
    if (isTouching("player")) {
      if (player.getY()<getY()-gridSize/2) {
        world.remove(this);
        enemies.remove(this);
        player.setVelocity(player.getVelocityX(),-300);
      } else{
      
      player.setPosition(0, -300);
      }
    }
  }

  void move() {
    float vy=getVelocityY();
    setVelocity(speed*direction, vy);
  }
}

class HammerBro extends FGoomba{
  
  int time=64;
  HammerBro(float x, float y, PImage[] a){
  super(x,y,a);
  
  }
  void throwhammer(){
    
    
  }
  
}
