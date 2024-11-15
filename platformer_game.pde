import fisica.*;
FWorld world;
//set sensor
color white      =#FFFFFF;
color black      =#000000;
color red        =#FF0000;
color darkblue   =#0000FF;
color orange     =#F0A000;
color brown      =#996633;
color purple     =#f702f7;
color lavared    =#ff0045;
color lblue      =#00f7ff;
color treebrown  =#f05716;
color green      =#00f008;
color midgreen   =#007006;
color sidegreen  =#7cf782;
color yellow     =#e5f018;



PImage map, ice, stone, treeTrunk;
float zoom=1.5;
int gridSize=32;
boolean upkey, downkey, leftkey, rightkey, wkey, akey, skey, dkey, spacekey, qkey, ekey;
FPlayer player;
void setup() {
  size(800, 800);
  Fisica.init(this);
  world= new FWorld(-2000, -2000, 4000, 4000);
  world.setGravity(0, 900);
  map=loadImage("pixil-frame-0.png");
  loadWorld(map);
  loadPlayer();
}
void loadWorld(PImage img) {
  for (int y=0; y<img.height; y++) {
    for (int x=0; x<img.width; x++) {
      color c=map.get(x, y);
      FBox b=new FBox(gridSize, gridSize);
      b.setPosition(x*gridSize, y*gridSize);
      if (c==black) {
       
        b.setStatic(true);
        b.setGrabbable(false);
        b.setName("stone");
        world.add(b);
      }
      if (c==lavared) {

        b.setStatic(true);
        b.setGrabbable(false);
        b.setName("lavablock");
        world.add(b);
        
      }
      if (c==lblue) {

        b.setStatic(true);
        b.setGrabbable(false);
        b.setName("ice");
        world.add(b);
        
      }
      if (c==green) {

        b.setStatic(true);
        b.setGrabbable(false);
        b.setName("treeleave'");
        world.add(b);
        
      }
       if (c==midgreen) {

        b.setStatic(true);
        b.setGrabbable(false);
        b.setName("midtree");
        world.add(b);
        
      }
    }
  }
}

void loadPlayer() {
  player = new FPlayer();
  world.add(player);
}
void draw() {
  background(white);
  drawWorld();
  player.act();
}

void drawWorld() {
  pushMatrix();
  translate(-player.getX()*zoom+width/2, -player.getY()*zoom+height/2);
  scale(zoom);
  world.step();
  world.draw();


  popMatrix();
}
