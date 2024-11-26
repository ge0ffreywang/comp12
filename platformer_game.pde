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
color green      =#7cf782;
color yellow     =#e5f018;


PImage map, ice, stone, treeTrunk,treeLeaves,lefttree,midtree,righttree,spike,tramp;
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
  spike=loadImage("images/spike.png");
  ice=loadImage("images/blueBlock.png");
  stone=loadImage("images/brick.png");
  treeTrunk=loadImage("images/tree_trunk.png");
  treeLeaves=loadImage("images/treetop_center.png");
  lefttree=loadImage("images/treetop_w.png");
  midtree=loadImage("images/tree_intersect.png");
  righttree=loadImage("images/treetop_e.png");
  tramp=loadImage("images/trampoline.png");
  
  loadWorld(map);
  loadPlayer();
}
void loadWorld(PImage img) {
  for (int y=0; y<img.height; y++) {
    for (int x=0; x<img.width; x++) {
      color c=map.get(x, y); 
      color s=map.get(x, y+1);// color below
      color w=map.get(x-1, y);// color left
      color e=map.get(x+1, y);// color right
      FBox b=new FBox(gridSize, gridSize);
      b.setPosition(x*gridSize, y*gridSize);
      if (c==black) {
       
        b.setStatic(true);
        b.setGrabbable(false);
        b.setName("stone");
        b.attachImage(stone);
        world.add(b);
      }
      if (c==lavared) {
        
        b.setStatic(true);
        b.setGrabbable(false);
        b.setName("spikes");
        b.attachImage(spike);
        world.add(b);
        
      }
      if (c==treebrown) {
        b.setSensor(true);
        b.setStatic(true);
        b.setGrabbable(false);
        b.setName("treetrunk");
        b.attachImage(treeTrunk);
        world.add(b);
        
      }
      if (c==lblue) {

        b.setStatic(true);
        b.setGrabbable(false);
        b.setName("ice");
        b.attachImage(ice);
        world.add(b);
        
      }
      if (c==green && w == green && e==green) {//normal

        b.setStatic(true);
        b.setGrabbable(false);
        b.setSensor(true);
        b.attachImage(treeLeaves);
        b.setName("avgtreeleave'");
        world.add(b);
        
      }
      if (c==green && w != green) {//l

        b.setStatic(true);
        b.setGrabbable(false);
        b.setSensor(true);
        b.attachImage(lefttree);
        b.setName("leftleave'");
        world.add(b);
        
      }
      if (c==green && e != green) {//right

        b.setStatic(true);
        b.setGrabbable(false);
        b.setSensor(true);
        b.attachImage(righttree);
        b.setName("rightleave");
        world.add(b);
        
      }
       if (c==green && s==treebrown) {//mid piece

        b.setStatic(true);
        b.setSensor(true);
        b.setGrabbable(false);
        b.attachImage(midtree);
        b.setName("midtree");
        world.add(b);
        
      }
      if (c==purple) {
       
        b.setStatic(true);
        b.setGrabbable(false);
        b.setName("trampoline");
        b.attachImage(tramp);
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
