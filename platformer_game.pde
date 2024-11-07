import fisica.*;
FWorld world;

color white = #FFFFFF;
color black = #000000;
color green = #00FF00;
color red   = #FF0000;
color blue  = #0000FF;
color orange= #F0A000;
color brown = #996633;

PImage map;
int gridSize=32;
boolean upkey,downkey,leftkey,rightkey,wkey,akey,skey,dkey,spacekey,qkey,ekey;
FPlayer player;
void setup() {
  size(800, 800);
  Fisica.init(this);
  world= new FWorld(-2000, -2000, 2000, 2000);
  world.setGravity(0, 900);
  map=loadImage("pixil-frame-0.png");
  loadWorld(map);
  loadPlayer();
}
void loadWorld(PImage img){
  for (int y=0; y<img.height; y++) {
    for (int x=0; x<img.width; x++) {
      color c=map.get(x, y);
      if (c==black) {
        FBox b=new FBox(gridSize, gridSize);
        b.setPosition(x*gridSize, y*gridSize);
        b.setStatic(true);
        b.setGrabbable(false);
        world.add(b);
      }
    }
  }
    
}

void loadPlayer(){
 player = new FPlayer(); 
  
  
  
}
void draw() {
  background(white);
  world.step();
  world.draw();
}
