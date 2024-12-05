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
color cgoomba     =#dba423;
color gwall      =#23d9d0;
PImage map, ice, stone, treeTrunk, treeLeaves, lefttree, midtree, righttree, spike, tramp, bridge;

PImage[] idle;
PImage[] jump;
PImage[] run;
PImage[] action;
PImage[] goomba;

float zoom=1.5;
int gridSize=32;
boolean upkey, downkey, leftkey, rightkey, wkey, akey, skey, dkey, spacekey, qkey, ekey;
FPlayer player;
ArrayList<FGameObject> terrain;
ArrayList<FGameObject> enemies;
void setup() {
  size(800, 800);
  Fisica.init(this);
  world= new FWorld(-2000, -2000, 4000, 4000);
  world.setGravity(0, 900);
  terrain=new ArrayList<FGameObject>();
  enemies=new ArrayList<FGameObject>();
  loadImages();
  loadWorld(map);
  loadPlayer();
}

void loadImages() {
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
  bridge=loadImage("images/bridge_center.png");

  idle = new PImage [2];
  idle[0] = loadImage ("images/idle0.png") ;
  idle[1] = loadImage ("images/idle1.png") ;
  jump = new PImage [1];
  jump [0] = loadImage ("images/jump0.png");
  run = new PImage [3] ;
  run [0] = loadImage ("images/runright0.png") ;
  run [1] = loadImage ("images/runright1.png");
  run [2] = loadImage("images/runright2.png") ;

  action=idle;

  //ememies-----
  goomba= new PImage[2];
  goomba[0]=loadImage("images/goomba0.png");
  goomba[0].resize(gridSize, gridSize);
  goomba[1]=loadImage("images/goomba1.png");
  goomba[1].resize(gridSize, gridSize);
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
      } else if (c==gwall) {
        b.setName("gwall");
        b.attachImage(stone);
        world.add(b);
         b.setStatic(true);
        b.setGrabbable(false);
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
        ice.resize(gridSize, gridSize);
        b.attachImage(ice);
        world.add(b);
      }
      if (c==green && w == green && e==green) {//normal

        b.setStatic(true);
        b.setGrabbable(false);
        // b.setSensor(true);
        b.attachImage(treeLeaves);
        b.setName("avgtreeleave'");
        world.add(b);
      }
      if (c==green && w != green) {//l

        b.setStatic(true);
        b.setGrabbable(false);
        // b.setSensor(true);
        b.attachImage(lefttree);
        b.setName("leftleave'");
        world.add(b);
      }
      if (c==green && e != green) {//right

        b.setStatic(true);
        b.setGrabbable(false);
        //b.setSensor(true);
        b.attachImage(righttree);
        b.setName("rightleave");
        world.add(b);
      }
      if (c==green && s==treebrown) {//mid piece

        b.setStatic(true);
        //b.setSensor(true);
        b.setGrabbable(false);
        b.attachImage(midtree);
        b.setName("midtree");
        world.add(b);
      }
      if (c==purple) {

        b.setStatic(true);
        b.setGrabbable(false);
        b.setName("trampoline");
        tramp.resize(gridSize, gridSize);
        b.attachImage(tramp);
        world.add(b);
      }
      if (c==yellow) {
        FBridge br = new FBridge(x*gridSize, y*gridSize);
        terrain.add(br);
        world.add(br);
      }
      if (c==cgoomba) {
        FGoomba gmb= new FGoomba(x*gridSize, y*gridSize);
        enemies.add(gmb);
        world.add(gmb);
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
  actWorld();
  player.act();
}

void actWorld() {
  player.act();
  for (int i=0; i< terrain.size(); i++) {
    FGameObject t = terrain.get(i);
    t.act();
  }

  for (int i=0; i< enemies.size(); i++) {
    FGameObject e = enemies.get(i);
    e.act();
  }
}
void drawWorld() {
  pushMatrix();
  translate(-player.getX()*zoom+width/2, -player.getY()*zoom+height/2);
  scale(zoom);
  world.step();
  world.draw();
  popMatrix();
}
