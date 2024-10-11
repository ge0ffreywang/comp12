import fisica.*;
//cloud
float cloudx;
//palette
color blue   = color(29, 178, 242);
color brown  = color(166, 120, 24);
color green  = color(74, 163, 57);
color red    = color(224, 80, 61);
color yellow = color(242, 215, 16);

float gravity,newbody; 
//assets
PImage redBird,greenbox;

FPoly topPlatform; 
FPoly bottomPlatform;

//fisica
FWorld world;

void setup() {
  //make window
  fullScreen();
  
  //load resources
  redBird = loadImage("red-bird.png");
  greenbox= loadImage("4vqecc.jpg");
  //initialise world
  makeWorld();
  //checkpoint variable
  gravity=1;
  newbody=1;
  //add terrain to world
  makeTopPlatform();
  makeBottomPlatform();
}

//===========================================================================================

void makeWorld() {
  Fisica.init(this);
  world = new FWorld();

}

//===========================================================================================

void makeTopPlatform() {
  topPlatform = new FPoly();
  
  //plot the vertices of this platform
  topPlatform.vertex(-100, height*.1);
  topPlatform.vertex(width*0.8, height*0.4);
  topPlatform.vertex(width*0.8, height*0.4+100);
  topPlatform.vertex(-100, height*0.1+100);

  // define properties
  topPlatform.setStatic(true);
  topPlatform.setFillColor(brown);
  topPlatform.setFriction(0.1);

  //put it in the world
  world.add(topPlatform);
  
}

//===========================================================================================

void makeBottomPlatform() {
  bottomPlatform = new FPoly();

  //plot the vertices of this platform
  bottomPlatform.vertex(width+100, height*0.6);
  bottomPlatform.vertex(300, height*0.8);
  bottomPlatform.vertex(300, height*0.8+100);
  bottomPlatform.vertex(width+100, height*0.6+100);

  // define properties
  bottomPlatform.setStatic(true);
  bottomPlatform.setFillColor(brown);
  bottomPlatform.setFriction(0);

  //put it in the world
  world.add(bottomPlatform);
  
  
}


//===========================================================================================

void draw() {
    if(gravity==1){
  world.setGravity(0, 900);
  }else{
   world.setGravity(0, 0); 
  }
  
 while(cloudx>width+100){
   cloudx=-100; 
  }
  cloudx=cloudx+5;
  //could 1
  fill(255);
  
  
  println("x: " + mouseX + " y: " + mouseY);
  background(blue);
  rect(1800,400,50,50);
  rect(400,400,50,50);
  circle(cloudx,200,50);
  if (frameCount % 20 == 0) {  //Every 20 frames ...
  if(newbody==1){
    makeCircle();
    makeBlob();
    makeBox();
    makeBird();
  } 
}
 
  world.step();  //get box2D to calculate all the forces and new positions
  world.draw();  //ask box2D to convert this world to processing screen coordinates and draw
  
  circle(cloudx,600,50);
}


//===========================================================================================

void makeCircle() {
  FCircle circle = new FCircle(50);
  circle.setPosition(random(width), -5);

  //set visuals
  circle.setStroke(0);
  circle.setStrokeWeight(2);
  circle.setFillColor(red);

  //set physical properties
  circle.setDensity(0.2);
  circle.setFriction(1);
  circle.setRestitution(1);

  //add to world
  if(newbody==1){
  world.add(circle);
  }
}

//===========================================================================================

void makeBlob() {
  FBlob blob = new FBlob();

  //set visuals
  blob.setAsCircle(random(width), -5, 50);
  blob.setStroke(0);
  blob.setStrokeWeight(2);
  blob.setFillColor(yellow);

  //set physical properties
  blob.setDensity(0.2);
  blob.setFriction(1);
  blob.setRestitution(0.25);

  //add to the world
  if(newbody==1){
  world.add(blob);
  }
}

//===========================================================================================

void makeBox() {
  FBox box = new FBox(25, 100);
  box.setPosition(random(width), -5);

  //set visuals
  box.setStroke(0);
  box.setStrokeWeight(2);
  //set visuals
  greenbox.resize(25,100);
  box.attachImage(greenbox);
  //box.setFillColor(green);

  //set physical properties
  box.setDensity(0.2);
  box.setFriction(1);
  box.setRestitution(1.5);
  if(newbody==1){
  world.add(box);
  }
}

//===========================================================================================

void makeBird() {
  FCircle bird = new FCircle(48);
  bird.setPosition(random(width), -5);

  //set visuals
  bird.attachImage(redBird);

  //set physical properties
  bird.setDensity(0.8);
  bird.setFriction(1);
  bird.setRestitution(0.5);
  world.add(bird);
  
}

void mouseReleased(){
 if(mouseX>1800 && mouseX < 1850 && mouseY>400 && mouseY<450){
   newbody=newbody*-1;
 }
  if(mouseX>400 && mouseX < 450 && mouseY>400 && mouseY<450){
   gravity=gravity*-1;
 }
  
  
}
