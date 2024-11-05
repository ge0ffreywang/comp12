//mode frame work
int mode;
final int INTRO   =1;
final int GAME    =2;
final int PAUSE   =3;
final int GAMEOVER=4;
final int V_SETUP =5;
//player setup
//red
float Redx,Redy;

//blue
float bluex,bluey;
//score
float redscore,bluescore;
//legs
//red
float redlegup,redlegdown;
//blue
float bluelegup,bluelegdown;
//variable to move the legs

//red
float redleftlegvelocity,redrightlegvelocity;
//blue
float blueleftlegvelocity,bluerightlegvelocity;
//player movements
boolean wkey,skey,akey,dkey,upkey,downkey,leftkey,rightkey;

float ballx,bally,balld;//ball 

//TARGET VARIBLES
float vx, vy;//target velosity
void setup(){
  size(800,600);
  mode=GAME;
  
  //initialize keyboard variable(player movements)
  wkey=skey=akey=dkey=upkey=downkey=leftkey=rightkey=false;
  //score setup
  redscore=0;
  bluescore=0;
  //initialize left player legs;
  redlegup=0;
  redlegdown=0;
  Redx=300; Redy=300;
  redleftlegvelocity=1;
  redrightlegvelocity=-1;
  
  //initialize right player legs;
  bluelegup=0;
  bluelegdown=0;
  bluex=500; bluey=300;
  blueleftlegvelocity=1;
  bluerightlegvelocity=-1;
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
  }else if(mode==GAMEOVER){
    gameover();
  }else if(mode==V_SETUP){
    v_setup();
  }else {
   println("mode error:" +mode);
  }
}
