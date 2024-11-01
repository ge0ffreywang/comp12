Gif face;

float mode=0;
final float intro=1, game=2, redwin=3, greenwin=4;
import fisica.*;

boolean rungame;
//palette
color blue   = color(29, 178, 242);
color brown  = color(166, 120, 24);
color green  = color(74, 163, 57);
color red    = color(224, 80, 61);
color yellow = color(242, 215, 16);
//key board
boolean wkey, akey, skey, dkey, upkey, downkey, rightkey, leftkey;
//assets
//PImage redBird;
//jumping
//basketball
PImage basketball;
FPoly floor;
FPoly bottomPlatform;
//scores
float lscore=0;
float rscore=0;
//left net
FPoly lbasketp1;
FPoly lbasketp2;
FPoly lcontact;
FPoly lcontact2;
FPoly rect;
FPoly rbasketp1;
FPoly rbasketp2;
FPoly rcontact;
FPoly rcontact2;
//ball
FCircle ball;
//player
FBox leftPlayer;
FBox rightPlayer;
//fisica
FWorld world;

void setup() {
  //make window
  size(800, 600);

  mode=intro;
  //load resources
  //basketball
  basketball = loadImage("basketball2.png");
  //initialise world
  makeWorld();
 face=new Gif("gif2/face", ".png", 8,5,width/2-100,height/2,200,200);// problem here
  //add terrain to world

  ground();
  lbasket();
  rbasket();
  leftPlayer();
  rightPlayer();
  ball();

}

//===========================================================================================

void makeWorld() {
  Fisica.init(this);
  world = new FWorld();
  world.setGravity(0, 900);
  world.setEdges();
}

//===========================================================================================
void lbasket() {
  //scoring
  lcontact=new FPoly();
  lcontact.setFillColor(red);
  lcontact.vertex(0, height/2-5);
  lcontact.vertex(55, height/2-5);
  lcontact.vertex(55, height/2-8);
  lcontact.vertex(0, height/2-8);
  lcontact.setStatic(true);
  world.add(lcontact);

  //scoring p2

  lcontact2=new FPoly();
  lcontact2.setFillColor(red);
  lcontact2.vertex(46, height/2-5);
  lcontact2.vertex(96, height/2-100);
  lcontact2.vertex(101, height/2-100);
  lcontact2.vertex(49, height/2);
  lcontact2.vertex(46, height/2);
  lcontact2.setStatic(true);
  world.add(lcontact2);

  //basket part 1
  lbasketp1=new FPoly();
  lbasketp1.vertex(0, height/2);
  lbasketp1.vertex(50, height/2);
  lbasketp1.vertex(50, height/2-5);
  lbasketp1.vertex(0, height/2-5);
  lbasketp1.setStatic(true);
  world.add(lbasketp1);

  //basket part 2
  lbasketp2=new FPoly();
  lbasketp2.vertex(50, height/2-5);
  lbasketp2.vertex(100, height/2-100);
  lbasketp2.vertex(105, height/2-100);
  lbasketp2.vertex(53, height/2);
  lbasketp2.vertex(50, height/2);
  lbasketp2.setStatic(true);
  world.add(lbasketp2);

  //sensor
  rect= new FPoly();
  rect.vertex(100, height/2-100);
  rect.vertex(0, height/2-100);
  rect.vertex(0, height/2-95);
  rect.vertex(100, height/2-95);
  rect.setSensor(true);
}

void rbasket() {
  //scoring
  rcontact=new FPoly();
  rcontact.setFillColor(green);
  rcontact.vertex(width, height/2-5);
  rcontact.vertex(width-55, height/2-5);
  rcontact.vertex(width-55, height/2-8);
  rcontact.vertex(width, height/2-8);
  rcontact.setStatic(true);
  world.add(rcontact);

  //scoring p2

  rcontact2=new FPoly();
  rcontact2.setFillColor(green);
  rcontact2.vertex(width-46, height/2-5);
  rcontact2.vertex(width-96, height/2-100);
  rcontact2.vertex(width-101, height/2-100);
  rcontact2.vertex(width-49, height/2);
  rcontact2.vertex(width-46, height/2);
  rcontact2.setStatic(true);
  world.add(rcontact2);
  //basket part 1
  rbasketp1=new FPoly();
  rbasketp1.vertex(width, height/2);
  rbasketp1.vertex(width-50, height/2);
  rbasketp1.vertex(width-50, height/2-5);
  rbasketp1.vertex(width, height/2-5);
  rbasketp1.setStatic(true);
  world.add(rbasketp1);

  //basket part 2
  rbasketp2=new FPoly();
  rbasketp2.vertex(width-50, height/2-5);
  rbasketp2.vertex(width-100, height/2-100);
  rbasketp2.vertex(width-105, height/2-100);
  rbasketp2.vertex(width-53, height/2);
  rbasketp2.vertex(width-50, height/2);
  rbasketp2.setStatic(true);
  world.add(rbasketp2);
}
void ground() {
  floor = new FPoly();

  //plot the vertices of this platform
  floor.vertex(0, 500);
  floor.vertex(width, 500);
  floor.vertex(width, height);
  floor.vertex(0, height);

  // define properties
  floor.setStatic(true);
  floor.setFillColor(brown);
  floor.setFriction(2);

  //put it in the world
  world.add(floor);
}



//===========================================================================================

void draw() {

  if (mode==intro) {
    intro();
    face.show(); 
    rungame=false;
  } else if (mode==game) {
    rungame=true;
    game();
    world.draw();
    world.step();
  } else if(mode==redwin){
    redwin();
    
  }else if(mode==greenwin){
    greenwin();
    
  }


  if (rungame==true) {
   
      //get box2D to calculate all the forces and new positions
    
  }
  //ask box2D to convert this world to processing screen coordinates and draw
}

void keyPressed() {
  if (key == 'w' || key == 'W') wkey=true;
  if (key == 'a' || key == 'A') akey=true;
  if (key == 's' || key == 'S') skey=true;
  if (key == 'd' || key == 'D') dkey=true;
  if (keyCode == UP)upkey=true;
  if (keyCode == DOWN)downkey=true;
  if (keyCode == LEFT)leftkey=true;
  if (keyCode == RIGHT)rightkey=true;
}

void keyReleased() {
  if (key == 'w' || key == 'W') wkey=false;
  if (key == 'a' || key == 'A') akey=false;
  if (key == 's' || key == 'S') skey=false;
  if (key == 'd' || key == 'D') dkey=false;
  if (keyCode == UP)upkey=false;
  if (keyCode == DOWN)downkey=false;
  if (keyCode == LEFT)leftkey=false;
  if (keyCode == RIGHT)rightkey=false;
}
//===========================================================================================
void ball() {
  ball = new FCircle(25);
  ball.setPosition(width/2, 0);
  basketball.resize(25,25);
  ball.attachImage(basketball);
  world.add(ball);
  if (ballhitplayer(leftPlayer )==true || ballhitplayer(rightPlayer )==true) {
    ball.setRestitution(1.6);
  } else ball.setRestitution(1.1);
}

boolean ballhitplayer(FBox player) {
  ArrayList<FContact> contactList = ball.getContacts();
  int i=0;
  while (i<contactList.size()) {
    FContact myContact=contactList.get(i);
    if (myContact.contains(player))
      return true;
    i++;
  }
  return false;
}

boolean leftscore(FCircle basketballball) {
  ArrayList<FContact> contactList = rcontact.getContacts();
  int i=0;
  while (i<contactList.size()) {
    FContact myContact=contactList.get(i);
    if (myContact.contains(basketballball)) {
      lscore=lscore+1;
      return true;
    }

    i++;
  }
  return false;
}
boolean leftscore2(FCircle basketballball2) {
  ArrayList<FContact> contactList = rcontact2.getContacts();
  int i=0;
  while (i<contactList.size()) {
    FContact myContact=contactList.get(i);
    if (myContact.contains(basketballball2)) {
      lscore=lscore+1;
      return true;
    }

    i++;
  }
  return false;
}

boolean rightscore(FCircle basketballball) {
  ArrayList<FContact> contactList = lcontact.getContacts();
  int i=0;
  while (i<contactList.size()) {
    FContact myContact=contactList.get(i);
    if (myContact.contains(basketballball)) {
      rscore=rscore+1;
      return true;
    }
    i++;
  }
  return false;
}
boolean rightscore2(FCircle basketballball2) {
  ArrayList<FContact> contactList = lcontact2.getContacts();
  int i=0;
  while (i<contactList.size()) {
    FContact myContact=contactList.get(i);
    if (myContact.contains(basketballball2)) {
      rscore=rscore+1;
      return true;
    }
    i++;
  }
  return false;
}
void leftPlayer() {
  leftPlayer = new FBox(50, 50);
  leftPlayer.setFillColor(red);
  leftPlayer.setPosition(50, 450);
  world.add(leftPlayer);
}

void rightPlayer() {
  fill(0, 0, 255);
  rightPlayer = new FBox(50, 50);
  rightPlayer.setFillColor(green);
  rightPlayer.setPosition(750, 450);
  world.add(rightPlayer);
}
void handlePlayerInput() {
  float left_vx=leftPlayer.getVelocityX();
  float left_vy=leftPlayer.getVelocityY();
  if (wkey && lhitground(floor)==true)leftPlayer.setVelocity(left_vx, -800);
  if (skey)leftPlayer.setVelocity(left_vx, 1000);
  if (akey)leftPlayer.setVelocity(-200, left_vy);
  if (dkey)leftPlayer.setVelocity(200, left_vy);


  float right_vx=leftPlayer.getVelocityX();
  float right_vy=leftPlayer.getVelocityY();
  if (upkey && rhitground(floor)==true)rightPlayer.setVelocity(right_vx, -800);
  if (downkey)rightPlayer.setVelocity(right_vx, 1000);
  if (leftkey)rightPlayer.setVelocity(-200, right_vy);
  if (rightkey)rightPlayer.setVelocity(200, right_vy);
}

boolean lhitground(FPoly ground) {
  ArrayList<FContact> contactList = leftPlayer.getContacts();
  int i=0;
  while (i<contactList.size()) {
    FContact myContact=contactList.get(i);
    if (myContact.contains(ground))
      return true;
    i++;
  }
  return false;
}

boolean rhitground(FPoly ground) {
  ArrayList<FContact> contactList = rightPlayer.getContacts();
  int i=0;
  while (i<contactList.size()) {
    FContact myContact=contactList.get(i);
    if (myContact.contains(ground))
      return true;
    i++;
  }
  return false;
}
