class FPlayer extends FGameObject {
  int i=500;
  int starTimer=i;

  boolean canTakeDamage = true;
  int direction;
  int frame;

  FPlayer () {
    super();
    frame=0;
    direction=R;
    setPosition(respawnx, respawny);
    setName("player");
    setRotatable(false);
    setFillColor(red);
  }
  void act() {
    input();
    collisions();
    animate();
    damage();
    //println(enemies.size());
  }
  void damage() {


    if (starOn) {
      starTimer--;
      if (starTimer <= 0) {
        starOn = false;
        starTimer = i;
      }
    }
  }

  //if (startimer=0){startimer=40;}
  void animate() {

    if (frame>=action.length) frame=0;
    if (frameCount %5 == 0) {
      if (direction==R) {
        attachImage(action[frame]);
      }
      if (direction==L) {
        attachImage(reverseImage(action[frame]));
      }
      frame++;
    }
  }
  void input() {
    float vy= getVelocityY();
    float vx= getVelocityX();
    if (abs(vy)<0.1 && !starOn) {
      action=idle;
    }

    if (abs(vy)<0.1 && starOn) {
      action=idleStar;
    }
    if (akey && !starOn) {
      action=run;
      setVelocity(-300, vy);
      direction=L;
    }
    if (akey && starOn) {
      action=runStar;
      setVelocity(-300, vy);
      direction=L;
    }
    if (dkey && !starOn) {
      action=run;
      setVelocity(300, vy);
      direction=R;
    }
    if (dkey && starOn) {
      action=runStar;
      setVelocity(300, vy);
      direction=R;
    }
    if (wkey && canJump()) {
      setVelocity(vx, -500);
      sound.marioJumpAudio.play();
      sound.marioJumpAudio.rewind();
    }

    if (skey) {
      setVelocity(vx, 500);
    }
    if (abs(vy)>0.1 && !starOn) {
      action=jump;
    }
    if (abs(vy)>0.1 && starOn) {
      action=jumpStar;
    }
  }

  void collisions() {

    if (touchingSpikes() && starOn==false) {
      setPosition(respawnx, respawny);
      lives--;
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

    if (touchingAHammer() && starOn==false) { // Add this check
      println("Player touched ahammer!");
      setPosition(respawnx, respawny);
      lives--;
    }

    if (getY()>1700 && starOn==false) {
      setPosition(respawnx, respawny);
      lives--;
    }else if (getY()>1700 && starOn) {
      setPosition(respawnx, respawny);
    }
  }
  boolean canJump() {
    ArrayList<FContact> contactList = player.getContacts();
    for (int i = 0; i < contactList.size(); i++) {
      FContact fc = contactList.get(i);
      if (fc.contains("stone") || fc.contains("gwall") || fc.contains("respawn") ||
        fc.contains("treetrunk") || fc.contains("spikes") || fc.contains("ice") ||
        fc.contains("bridge")) {
        return true;
      }
    }
    return false;
  }
  boolean touchingAHammer() {
    ArrayList<FBox> playercontactlist = getTouching();
    for (int i = 0; i < playercontactlist.size(); i++) {
      FBox boxincontact = playercontactlist.get(i);
      if (boxincontact.getName().equals("ahammer")) {
        return true;
      }
    }
    return false;
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
