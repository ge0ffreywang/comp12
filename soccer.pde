//mode frame work
int mode;
final int INTRO   =1;
final int GAME    =2;
final int PAUSE   =3;
final int REDWIN=4;
final int V_SETUP =5;
final int BLUEWIN =6;
//player setup
//red
float redkickmanX,redkickmanY,redgoalyX,redgoalyY;

//blue
float bluekickmanX,bluekickmanY,bluegoalyX,bluegoalyY;
//score
float redscore,bluescore;
//legs
//red
float leftredLeg,rightredleg,redgoalyLeftleg,redgoalyRightleg;
//blue
float bluekickmanLeftLeg,bluekickmanRightLeg,bluegoalyLeftLeg,bluegoalyRightLeg;
//variable to move the legs

//red
float RedkickmanLeftlegvelocity,RedkickmanRightlegvelocity,RedgoalyLeftlegVelocity,RedgoalyRightlegVelocity;
//blue
float bluekickmanLeftlegVelocity,bluekickmanRightlegVelocity,bluegoalyLeftlegVelocity,bluegoalyRightlegVelocity;
//player movements
boolean wkey,skey,akey,dkey,upkey,downkey,leftkey,rightkey;

float ballx,bally,balld;//ball 

//TARGET VARIBLES
float vx, vy;//target velosity
void setup(){
  size(800,600);
  mode=INTRO;
  
  //initialize keyboard variable(player movements)
  wkey=skey=akey=dkey=upkey=downkey=leftkey=rightkey=false;
  //score setup
  redscore=0;
  bluescore=0;
  //initialize red player 1legs;
  leftredLeg=0;
  rightredleg=0;
  redkickmanX=300; redkickmanY=300;
  RedkickmanLeftlegvelocity=1;
  RedkickmanRightlegvelocity=-1;
  //initialize red player 2legs;
  redgoalyLeftleg=0;
  redgoalyRightleg=0;
  redgoalyX=100; redgoalyY=300;
  RedgoalyLeftlegVelocity=1;
  RedgoalyRightlegVelocity=-1;
  
  //initialize right player1 legs;
  bluekickmanLeftLeg=0;
  bluekickmanRightLeg=0;
  bluekickmanX=500; bluekickmanY=300;
  bluekickmanLeftlegVelocity=1;
  bluekickmanRightlegVelocity=-1;
  //initialize right player2 legs;
  bluegoalyLeftLeg=0;
  bluegoalyRightLeg=0;
  bluegoalyX=700; bluegoalyY=300;
  bluegoalyLeftlegVelocity=1;
  bluegoalyRightlegVelocity=-1;
  //initialize ball
  ballx=400;
  bally=400;
  balld=30;
  //ball's velocity setup
  vx=5;
  vy=5;
}

void draw(){
  if (mode==INTRO){
    intro();
  }else if(mode==GAME){
    game();
  }else if(mode==PAUSE){
    pause();
  }else if(mode==REDWIN){
    redwin();
  }else if(mode==V_SETUP){
    v_setup();
  }else if(mode==REDWIN){
    redwin();
  }else if(mode==BLUEWIN){
    bluewin();
  }else {
   println("mode error:" +mode);
  }
}
