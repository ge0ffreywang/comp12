class FPlayer extends FGameObject {
  int i=500;
  int starTimer=i;
  boolean canDash;
  int dashtimer=250;
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
    if (immune) {
      sound.levelAudio.pause();
      sound.courseClearAudio.play();
    } else {
      sound.courseClearAudio.pause();
      sound.courseClearAudio.rewind();
      sound.levelAudio.play();
    }

    if (isTouching("tramp")) {
      sound.slime.rewind();
       sound.slime.play();
    }

    if (immune) {
      starTimer--;
      if (starTimer <= 0) {
        immune = false;
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

    if (spacekey && canDash) {

      canDash = false;
      sound.marioKickAudio.play();
      sound.marioKickAudio.rewind();

      if (direction == R) {
        setVelocity(750, vy);
      } else if (direction == L) {
        setVelocity(-750, vy);
      }
    }

    if (!canDash ) {
      dashtimer--;
      if (dashtimer <= 0) {
        canDash = true;
        dashtimer = 250;
      }
    }

    if (abs(vy)<0.1 && !immune) {
      action=idle;
    }

    if (abs(vy)<0.1 && immune) {
      action=idleStar;
    }
    if (akey && !immune) {
      action=run;
      setVelocity(-200, vy);
      direction=L;
    }
    if (akey && immune) {
      action=runStar;
      setVelocity(-200, vy);
      direction=L;
    }
    if (dkey && !immune) {
      action=run;
      setVelocity(200, vy);
      direction=R;
    }
    if (dkey && immune) {
      action=runStar;
      setVelocity(200, vy);
      direction=R;
    }
    if (wkey && canJump()) {
      setVelocity(vx, -550);
      sound.marioJumpAudio.play();
      sound.marioJumpAudio.rewind();
    }

    if (skey) {
      setVelocity(vx, 500);
    }
    if (abs(vy)>0.1 && !immune) {
      action=jump;
    }
    if (abs(vy)>0.1 && immune) {
      action=jumpStar;
    }
  }

  void collisions() {

    if (touchingSpikes() && immune==false) {
      setPosition(respawnx, respawny);
      lives--;
    }
    if (touchingIce()) {
      setFriction(0);
    }
    if (touchingStone()) {
      setFriction(7);
    }
    //if (trampoline()) {
    //  setVelocity(0, getVelocityY());
    //}

    if (touchingAHammer() && immune==false) { // Add this check
      println("Player touched ahammer!");
      setPosition(respawnx, respawny);
      lives--;
    }

    if (getY()>1700 && immune==false) {
      setPosition(respawnx, respawny);
      lives--;
    } else if (getY()>1700 && immune) {
      setPosition(respawnx, respawny);
    }
  }
  boolean canJump() {
    ArrayList<FContact> contactList = player.getContacts();
    for (int i = 0; i < contactList.size(); i++) {
      FContact fc = contactList.get(i);
      if (fc.contains("stone") || fc.contains("gwall") || fc.contains("respawn")  || fc.contains("spikes") || fc.contains("ice") ||
        fc.contains("bridge")|| fc.contains("avgtreeleave") ||
        fc.contains("leftleave") ||
        fc.contains("rightleave") || fc.contains("trampoline")) {
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
