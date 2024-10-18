
import fisica.*;

//palette
color blue   = color(29, 178, 242);
color brown  = color(166, 120, 24);
color green  = color(74, 163, 57);
color red    = color(224, 80, 61);
color yellow = color(242, 215, 16);
//key board
boolean wkey,akey,skey,dkey,upkey,downkey,rightkey,leftkey;
//assets
PImage redBird;
//jumping

FPoly floor; 
FPoly bottomPlatform;

FBox leftPlayer;
FBox rightPlayer;
//fisica
FWorld world;

void setup() {
  //make window
  size(800,600);
  
  //load resources
  redBird = loadImage("red-bird.png");

  //initialise world
  makeWorld();

  //add terrain to world
  ground();
 
 leftPlayer();
 rightPlayer();
}

//===========================================================================================

void makeWorld() {
  Fisica.init(this);
  world = new FWorld();
  world.setGravity(0, 900);
  world.setEdges();
}

//===========================================================================================

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
  floor.setFriction(0.1);

  //put it in the world
  world.add(floor);
}



//===========================================================================================

void draw() {
  println("x: " + mouseX + " y: " + mouseY);
  background(blue);

  //if (frameCount % 20 == 0) {  //Every 20 frames ...
  //  makeCircle();
  //  makeBlob();
  //  makeBox();
  //  makeBird();
  //}
  handlePlayerInput();
  
  world.step();  //get box2D to calculate all the forces and new positions
  world.draw();  //ask box2D to convert this world to processing screen coordinates and draw
}

void keyPressed(){
 if(key == 'w' || key == 'W') wkey=true; 
 if(key == 'a' || key == 'A') akey=true; 
 if(key == 's' || key == 'S') skey=true;
 if(key == 'd' || key == 'D') dkey=true;
 if(keyCode == UP)upkey=true;
 if(keyCode == DOWN)downkey=true;
 if(keyCode == LEFT)leftkey=true;
 if(keyCode == RIGHT)rightkey=true;
}

void keyReleased(){
 if(key == 'w' || key == 'W') wkey=false; 
 if(key == 'a' || key == 'A') akey=false; 
 if(key == 's' || key == 'S') skey=false;
 if(key == 'd' || key == 'D') dkey=false;
 if(keyCode == UP)upkey=false;
 if(keyCode == DOWN)downkey=false;
 if(keyCode == LEFT)leftkey=false;
 if(keyCode == RIGHT)rightkey=false;  
}
//===========================================================================================

void leftPlayer(){
  leftPlayer = new FBox(50, 50);
  leftPlayer.setPosition(50, 450);
   world.add(leftPlayer);
}

void rightPlayer(){
  rightPlayer = new FBox(50, 50);
  rightPlayer.setPosition(750, 450);
   world.add(rightPlayer);
}
void handlePlayerInput(){
  float left_vx=leftPlayer.getVelocityX();
  float left_vy=leftPlayer.getVelocityY();
  if (wkey && lhitground(floor)==true)leftPlayer.setVelocity(left_vx,-1000); 
  if (skey)leftPlayer.setVelocity(left_vx,200);
  if (akey)leftPlayer.setVelocity(-200,left_vy); 
  if (dkey)leftPlayer.setVelocity(200,left_vy);
  
  
   float right_vx=leftPlayer.getVelocityX();
  float right_vy=leftPlayer.getVelocityY();
  if (upkey && rhitground(floor)==true)rightPlayer.setVelocity(right_vx,-1000); 
  if (downkey)rightPlayer.setVelocity(right_vx,200);
  if (leftkey)rightPlayer.setVelocity(-200,right_vy); 
  if (rightkey)rightPlayer.setVelocity(200,right_vy);
}

boolean lhitground(FPoly ground){
  ArrayList<FContact> contactList = leftPlayer.getContacts();
  int i=0;
  while (i<contactList.size()){
   FContact myContact=contactList.get(i);
   if(myContact.contains(ground))
     return true;
   i++;
  }
  return false;
}

boolean rhitground(FPoly ground){
  ArrayList<FContact> contactList = rightPlayer.getContacts();
  int i=0;
  while (i<contactList.size()){
   FContact myContact=contactList.get(i);
   if(myContact.contains(ground))
     return true;
   i++;
  }
  return false;
}
