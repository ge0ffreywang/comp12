import fisica.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;


SoundTrack sound;
PFont font;
FWorld world;
int mode;
int lives;
final int INTRO = 0;
final int M1 = 1;
final int M2 = 2;
final int M3 = 3;
final int GAMEOVER = 4;
float respawnx=0, respawny=-300;
int doublejump=2;
boolean starOn=false;

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
color fire       =#3f09d6;
color hammerBro  =#4c9915;
color cthwomp    =#ffe8a3;
color crespawn   =#c9fc9f;
color cflag      =#5e0000;
color cheart     =#e8af13;
color cghost     =#ff80ff;
color cstar      =#de95d5;
Button playButton;
PImage map1, map2;
PImage homeScreen, gameOver, youWin;//here
PImage  ice, stone, treeTrunk, treeLeaves, lefttree, midtree, righttree, spike, tramp, bridge, hammer, flag, heart, noheart, ghost, noghost;
PImage star;
PImage[] idle;
PImage[] jump;
PImage[] run;
PImage[] idleStar;
PImage[] jumpStar;
PImage[] runStar;
PImage[] action;
PImage[] goomba;
PImage[] lava;
PImage[] hammerbropic;
PImage[] thwomp;
PImage[] respawn;
PImage[] map;
float zoom=1.5;
int gridSize=32;
boolean upkey, downkey, leftkey, rightkey, wkey, akey, skey, dkey, spacekey, qkey, ekey;
boolean resetOnce;
FPlayer player;
ArrayList<FGameObject> terrain;
ArrayList<FGameObject> enemies;
void setup() {
  size(800, 800);
  mode=INTRO;
  lives=5;      //move the line here otherwise keep playing the sound if dead
  resetOnce=false;
  Fisica.init(this);
  sound = new SoundTrack(this);
  world= new FWorld(-2000, -2000, 4000, 4000);
  world.setGravity(0, 900);
  terrain=new ArrayList<FGameObject>();
  enemies=new ArrayList<FGameObject>();
  playButton = new Button(new PVector(width/2, height/2+50), "images/playGame.png");
  loadImages();
  loadWorld(map1);
  //loadWorld(map2);
  //loadWorld(map[1]);
  loadPlayer();
  //font = loadFont("BerlinSansFBDemi-Bold-48.vlw");
}

void loadImages() {
  homeScreen = loadImage("images/homeScreen.png");
  gameOver = loadImage("images/gameOver.png");
  youWin = loadImage("images/youWin.png");
  map1=loadImage("pixil-frame-0.png");
  map2=loadImage("map2.png");
  spike=loadImage("images/spike.png");
  ice=loadImage("images/blueBlock.png");
  stone=loadImage("images/stone0.png");
  stone.resize(gridSize, gridSize);
  treeTrunk=loadImage("images/tree_trunk.png");
  treeLeaves=loadImage("images/treetop_center.png");
  lefttree=loadImage("images/treetop_w.png");
  midtree=loadImage("images/tree_intersect.png");
  righttree=loadImage("images/treetop_e.png");
  tramp=loadImage("images/slime.png");
  bridge=loadImage("images/bridge.png");
  bridge.resize(gridSize, gridSize);
  hammer=loadImage("images/hammer.png");

  flag = loadImage("images/flag.png");
  flag.resize(gridSize, gridSize);
  heart = loadImage("images/heart.png");
  heart.resize(gridSize, gridSize);
  noheart = loadImage("images/noHeart.png");
  noheart.resize(gridSize, gridSize);
  ghost=loadImage("images/ghost.png");
  ghost.resize(gridSize, gridSize);          
  noghost=loadImage("images/noghost.png");
  star=loadImage("images/star.png"); 
  star.resize(gridSize, gridSize); 
  respawn = new PImage [2];
  respawn[0] = loadImage ("images/lucky.png") ;
  respawn[0].resize(gridSize, gridSize);
  respawn[1] = loadImage ("images/lucky1.png") ;
  respawn[1].resize(gridSize, gridSize);
  idle = new PImage [2];
  idle[0] = loadImage ("images/idle0.png") ;
  idle[1] = loadImage ("images/idle1.png") ;
  jump = new PImage [1];
  jump [0] = loadImage ("images/jump0.png");
  run = new PImage [3] ;
  run [0] = loadImage ("images/runright0.png") ;
  run [1] = loadImage ("images/runright1.png");
  run [2] = loadImage("images/runright2.png") ;
  idleStar = new PImage[2];
  idleStar[0] = loadImage("images/idleStar0.png");
  idleStar[1] = loadImage("images/idleStar1.png");

  jumpStar = new PImage[1];
  jumpStar[0] = loadImage("images/jumpStar0.png");

  runStar = new PImage[3];
  runStar[0] = loadImage("images/runStar0.png");
  runStar[1] = loadImage("images/runStar1.png");
  runStar[2] = loadImage("images/runStar2.png");
  action=idle;

  //ememies-----
  goomba= new PImage[2];
  goomba[0]=loadImage("images/goomba0.png");
  goomba[0].resize(gridSize, gridSize);
  goomba[1]=loadImage("images/goomba1.png");
  goomba[1].resize(gridSize, gridSize);
  hammerbropic= new PImage[2];
  hammerbropic[0]=loadImage("images/hammerbro0.png");
  hammerbropic[0].resize(gridSize, gridSize);
  hammerbropic[1]=loadImage("images/hammerbro1.png");
  hammerbropic[1].resize(gridSize, gridSize);
  //fire
  lava= new PImage[6];
  lava[0]=loadImage("images/lava0.png");
  lava[0].resize(gridSize, gridSize);
  lava[1]=loadImage("images/lava1.png");
  lava[1].resize(gridSize, gridSize);
  lava[2]=loadImage("images/lava2.png");
  lava[2].resize(gridSize, gridSize);
  lava[3]=loadImage("images/lava3.png");
  lava[3].resize(gridSize, gridSize);
  lava[4]=loadImage("images/lava4.png");
  lava[4].resize(gridSize, gridSize);
  lava[5]=loadImage("images/lava5.png");
  lava[5].resize(gridSize, gridSize);

  thwomp= new PImage[2];
  thwomp[0]=loadImage("images/thwomp0.png");
  thwomp[0].resize(gridSize*2, gridSize*2);
  thwomp[1]=loadImage("images/thwomp1.png");
  thwomp[1].resize(gridSize*2, gridSize*2);

  map= new PImage[3];
  map[0]=loadImage("pixil-frame-0.png");
  map[1]=loadImage("map2.png");
}
void loadWorld(PImage img) {
  for (int y=0; y<img.height; y++) {
    for (int x=0; x<img.width; x++) {
      color c=img.get(x, y);                        //   map1-->img: swich map1 to map2, as smae as the following three lines
      color s=img.get(x, y+1);// color below
      color w=img.get(x-1, y);// color left
      color e=img.get(x+1, y);// color right
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
      if (c==fire) {
        lava a = new lava(x*gridSize, y*gridSize);
        terrain.add(a);
        world.add(a);
      }
      if (c==cgoomba) {
        FGoomba gmb= new FGoomba(x*gridSize, y*gridSize, goomba);
        enemies.add(gmb);
        world.add(gmb);
      }

      if (c==hammerBro) {
        HammerBro gmb= new HammerBro(x*gridSize, y*gridSize, hammerbropic);
        enemies.add(gmb);
        world.add(gmb);
      }
      if (c==cthwomp) {
        FThwomp gmb= new FThwomp((x+0.5)*gridSize, (y+0.5)*gridSize);
        enemies.add(gmb);
        world.add(gmb);
      }
      if (c==crespawn) {
        Respawn a = new Respawn(x*gridSize, y*gridSize);
        terrain.add(a);
        world.add(a);
      }
      if (c == cflag) {
        Fflag flag = new Fflag(x*gridSize, y*gridSize);
        terrain.add(flag);
        world.add(flag);
      }
      if (c==cghost) {
        ghost gmb= new ghost(x*gridSize, y*gridSize, goomba);
        enemies.add(gmb);
        world.add(gmb);
      }
      if (c == cheart) {
        Fheart flag = new Fheart(x*gridSize, y*gridSize);
        terrain.add(flag);
        world.add(flag);
      }
      if (c == cstar) {
        FStar flag = new FStar(x*gridSize, y*gridSize);
        terrain.add(flag);
        world.add(flag);
      }
    }
  }
}

void resetWorld(PImage newMap) {
  for (FGameObject obj : terrain) {
    world.remove(obj);
  }
  terrain.clear();
  for (FGameObject obj : enemies) {
    world.remove(obj);
  }
  enemies.clear();

  loadWorld(newMap);

  // Reset player position and other states
  player.setPosition(respawnx, respawny);
  player.setVelocity(0, 0);
}

void loadPlayer() {
  player = new FPlayer();
  world.add(player);
}
void mousePressed() {
  if (mode == INTRO) {
    if (playButton.buttonPressed()) {
      mode = M1;
      imageMode(CORNER);
      sound.homeAudio.close();
    }
  }
}
void draw() {

  if (lives==0) {
    mode = GAMEOVER;
    sound.marioDeadAudio.play();
    sound.marioDeadAudio.rewind();
  }

  if (mode == INTRO) {
    intro();
    if (!sound.homeAudio.isPlaying()) {
      sound.homeAudio.rewind();
      sound.homeAudio.play();
    }
  } else if (mode == M1) {
    m1();
    if (!sound.levelAudio.isPlaying()) {
      sound.levelAudio.rewind();
      sound.levelAudio.play();
    }
  } else if (mode == M2) {
    m2();
    if (!sound.levelAudio.isPlaying()) {
      sound.levelAudio.rewind();
      sound.levelAudio.play();
    }
  } else if (mode == M3) {
    sound.levelAudio.close();
    m3();
  } else if (mode == GAMEOVER) {
    sound.levelAudio.close();
    gameover();
  }
}

void actWorld() {
  player.act();
  for (int i=0; i< terrain.size(); i++) {
    FGameObject t = terrain.get(i);
    t.act();
  }

  for (int j=0; j< enemies.size(); j++) {
    FGameObject e = enemies.get(j);
    e.act();
    e.hammer();
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
