import fisica.*;
Fworld world;

color white = #FFFFFF;
color black = #000000;
color green = #00FF00;
color red   = #FF0000;
color blue  = #0000FF;
color orange= #F0A000;
color brown = #996633;

PImage map;
int gridSize=32;

void setup() {
  size(600, 600);
  Fisica.init(this);
  world= new FWorld(-2000, -2000, 2000, 2000);
  world.setGravity(0, 900);
  map=loadImage("pixilart.pixil");
  for (int y=0; y<map.height; y++) {
    for (int x=0;, x<map.width; x++) {
      color c=map.get(x, y);
      if (c==black) {
        FBox b=new FBox(gridSize, gridSize);
        b.setPosition(x*gridSize, y*gridSize);
        b.setStatic(true);
        world.add(b);
      }
    }
  }
}

void draw() {
  world.step();
  world.draw();
}
