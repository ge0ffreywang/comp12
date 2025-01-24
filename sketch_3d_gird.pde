import java.awt.Robot;
color black=#000000; //oakplanks
color white=#FFFFFF; //empty space
color dullBlue=#7092be; // mossy bricks
//texture
PImage mossyStone;
PImage oakPlanks;

//map
int gridSize;
PImage map;
Robot rbt;
boolean skipFrame=false;
//keyboard variables
boolean wkey, akey, skey, dkey;

float eyeX, eyeY, eyeZ, focusX, focusY, focusZ, upX, upY, upZ;
//rotaional variables
float leftRightHeadAngle, upDownHeadAngle;
//game obj
ArrayList<GameObjects>objects;
void setup() {
  //create game object list
  objects=new ArrayList<GameObjects>();
  fullScreen(P3D);
  //size(800, 600, P3D);
  textureMode(NORMAL);
  upDownHeadAngle=radians(45);
  wkey=akey=skey=dkey=false;
  eyeX=width/2;
  eyeY=9*height/10;
  eyeZ=0;
  focusX=width/2;
  focusX=height/2;
  focusZ=10;
  upX=0;
  upY=1;
  upZ=0;
  map=loadImage("3Dmap.png");
  mossyStone=loadImage("moss.png");
  oakPlanks=loadImage("oak.jpg");
  textureMode(NORMAL);
  gridSize=100;
  //noCursor();
  try {
    rbt=new Robot();
  }
  catch(Exception e) {
    e.printStackTrace();
  }
  skipFrame=false;
}
void draw() {
  background(0);
  camera(eyeX, eyeY, eyeZ, focusX, focusY, focusZ, upX, upY, upZ);
  //drawFloor();
  pointLight(255, 255, 255, eyeX, eyeY, eyeZ);//color,spotx,spoty,spotz
  drawFocalPoint();
  controlCamera();
  drawFloor(-2000, 2000, height, gridSize);
  drawFloor(-2000, 2000, height-gridSize*4, gridSize);
  drawMap();

  int i=0;
  while (i<objects.size()) {
    GameObjects obj=objects.get(i);
    obj.act();
    obj.show();
    if (obj.lives==0) {
      objects.remove(i);
    } else {
      i++;
    }
  }
}
void drawMap() {
  for (int x=0; x<map.width; x++) {
    for (int y=0; y<map.height; y++) {
      color c=map.get(x, y);
      if (c==dullBlue) {
        textureCube(x*gridSize-2000, height-gridSize, y*gridSize-2000, mossyStone, gridSize);
        textureCube(x*gridSize-2000, height-2*gridSize, y*gridSize-2000, mossyStone, gridSize);
        textureCube(x*gridSize-2000, height-3*gridSize, y*gridSize-2000, mossyStone, gridSize);
      }
      if (c==black) {
        textureCube(x*gridSize-2000, height-gridSize, y*gridSize-2000, oakPlanks, gridSize);
        textureCube(x*gridSize-2000, height-2*gridSize, y*gridSize-2000, oakPlanks, gridSize);
        textureCube(x*gridSize-2000, height-3*gridSize, y*gridSize-2000, oakPlanks, gridSize);
      }
    }
  }
}

void drawFloor(int start, int end, int level, int gap) {
  stroke(255);
  strokeWeight(1);
  int x=start;
  int z=start;
  while (z<end) {
    textureCube(x, level, z, oakPlanks, gap);
    x=x+gap;
    if (x>=end) {
      x=start;
      z=z+gap;
    }
  }
}
void drawFocalPoint() {
  pushMatrix();
  translate(focusX, focusY, focusZ);
  sphere(5);
  popMatrix();
}
//void drawFloor() {
//  stroke(255);
//  for (int x=-2000; x<=2000; x=x+100) {
//    line(x, height, -2000, x, height, 2000);
//    line(-2000, height, x, 2000, height, x);
//  }
//}

void controlCamera() {
  character();


  leftRightHeadAngle=leftRightHeadAngle+(mouseX-pmouseX)*0.01;
  upDownHeadAngle=upDownHeadAngle+(mouseY-pmouseY)*0.01;

  if (skipFrame==false) {
    leftRightHeadAngle=leftRightHeadAngle+(mouseX-pmouseX)*0.01;
    upDownHeadAngle=upDownHeadAngle+(mouseY-pmouseY)*0.01;
  }

  if (upDownHeadAngle>PI/2.5) upDownHeadAngle=PI/2.5;
  if (upDownHeadAngle>-PI/2.5) upDownHeadAngle=-PI/2.5;

  focusX=eyeX+cos (leftRightHeadAngle)*300;
  focusZ=eyeZ+sin(leftRightHeadAngle)*300;
  focusY=eyeY+tan(upDownHeadAngle)*300 ;

  //if (mouseX>width-2) rbt.mouseMove(3, mouseY);
  //else if (mouseX<2) rbt.mouseMove(width-3, mouseY);

  if (mouseX<2) {
    rbt.mouseMove(width-3, mouseY);
    skipFrame=true;
  } else if (mouseX>width-2) {
    rbt.mouseMove(3, mouseX);
  } else {
    skipFrame=false;
  }
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
