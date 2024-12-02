class FPlayer extends FGameObject {

  int frame;
  
  FPlayer () {
    super();
    setPosition(0, -300);
    setName("player");
    setRotatable(false);
    setFillColor(red);
  }
  void act() {
    input();
    collisions();
    animate();
  }
  void animate() {
    
    if (frame>=action.length) frame=0;
    if (frameCount %5 == 0) {
      attachImage(action[frame]);
      frame++;
    }
  }
  void input() {
    float vy= getVelocityY();
    float vx= getVelocityX();
    if(abs(vy)<0.1){
     action=idle; 
    }
    if (akey) {
      action=run;
      setVelocity(-300, vy);
    }
    if (dkey) {
      action=run;
      setVelocity(300, vy);
    }
    if (wkey) {
      setVelocity(vx, -500);
    }
    if (skey) {
      setVelocity(vx, 500);
    }
    if (abs(vy)>0.1) {
      action=jump;
    }
  }
 
  void collisions() {
    
    if (touchingSpikes()) {
      setPosition(300, 0);
    }
    if (touchingIce()) {
      setFriction(0);
    }
    if (touchingStone()) {
      setFriction(7);
    }
    if (trampoline()) {
      setVelocity(0, -700);
    }
  }
  boolean touchingIce() {
    ArrayList<FBox> playercontactlist= getTouching();
    for (int i = 0; i < playercontactlist.size(); i++) {
      FBox boxincontact = playercontactlist.get(i);
      if (boxincontact.getName() == "ice") {
        return true;
      }
    }
    return false;
  }
  boolean touchingStone() {
    ArrayList<FBox> playercontactlist= getTouching();
    for (int i = 0; i < playercontactlist.size(); i++) {
      FBox boxincontact = playercontactlist.get(i);
      if (boxincontact.getName() == "stone") {
        return true;
      }
    }
    return false;
  }
  boolean trampoline() {
    ArrayList<FBox> playercontactlist= getTouching();
    for (int i = 0; i < playercontactlist.size(); i++) {
      FBox boxincontact = playercontactlist.get(i);
      if (boxincontact.getName() == "trampoline") {
        return true;
      }
    }
    return false;
  }
  boolean touchingSpikes() {
    ArrayList<FBox> playercontactlist= getTouching();
    for (int i = 0; i < playercontactlist.size(); i++) {
      FBox boxincontact = playercontactlist.get(i);
      if (boxincontact.getName() == "spikes") {
        return true;
      }
    }
    return false;
  }
}
