boolean wkey, akey, skey, dkey;
float eyeX, eyeY, eyeZ, focusX, focusY, focusZ, upX, upY, upZ;
float leftRightHeadAngle, upDownHeadAngle;

void setup() {
  size(800, 600, P3D);
  textureMode(NORMAL);
  wkey=akey=skey=dkey=false;
  eyeX=width/2;
  eyeY=height/2;
  eyeZ=0;
  focusX=width/2;
  focusX=height/2;
  focusZ=10;
  upX=0;
  upY=1;
  upZ=0;
  leftRightHeadAngle=radians(270);
  //  noCursor();
}
void draw() {
  background(0);
  camera(eyeX, eyeY, eyeZ, focusX, focusY, focusZ, upX, upY, upZ);
  drawFloor();
  drawFocalPoint();
  controlCamera();
}
void drawFocalPoint(){
  pushMatrix();
  translate(focusX,focusY,focusZ);
  sphere(5);
  popMatrix();
}
void drawFloor() {
  stroke(255);
  for (int x=-2000; x<=2000; x=x+100) {
    line(x, height, -2000, x, height, 2000);
    line(-2000, height, x, 2000, height, x);
  }
}

void controlCamera() {
  if (wkey) eyeZ=eyeZ-10;
  if (skey) eyeZ=eyeZ+10;
  if (akey) eyeX=eyeX-10;
  if (dkey) eyeX=eyeX+10;

  leftRightHeadAngle=leftRightHeadAngle+(mouseX-pmouseX)*0.01;
  upDownHeadAngle=upDownHeadAngle+(mouseY-pmouseY)*0.01;
  if(upDownHeadAngle>PI/2.5) upDownHeadAngle=PI/2.5;
  if(upDownHeadAngle>-PI/2.5) upDownHeadAngle=-PI/2.5;
  
  focusX=eyeX+cos (leftRightHeadAngle)*300;
  focusZ=eyeZ+sin(leftRightHeadAngle)*300;
  focusY=eyeY+tan(upDownHeadAngle)*300 ;
  println(eyeX, eyeY, eyeZ);
}

void keyPressed() {
  if (key == 'w' || key == 'W') wkey=true;
  if (key == 'a' || key == 'A') akey=true;
  if (key == 's' || key == 'S') skey=true;
  if (key == 'd' || key == 'D') dkey=true;
 
  if (keyCode == UP)wkey=true;
  if (keyCode == DOWN)skey=true;
  if (keyCode == LEFT)akey=true;
  if (keyCode == RIGHT)dkey=true;
}

void keyReleased() {
  if (key == 'w' || key == 'W') wkey=false;
  if (key == 'a' || key == 'A') akey=false;
  if (key == 's' || key == 'S') skey=false;
  if (key == 'd' || key == 'D') dkey=false;
 if (keyCode == UP)wkey=false;
  if (keyCode == DOWN)skey=false;
  if (keyCode == LEFT)akey=false;
  if (keyCode == RIGHT)dkey=false;
}
