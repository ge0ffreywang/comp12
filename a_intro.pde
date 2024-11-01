
void intro(){
  background(255);
  textSize(48);
  textAlign(CENTER);
  fill(#F09850);
  text("Basketball Game", width / 2, height / 2 - 100);
  textSize(15);
  
  tactileR(350,225, 100, 50);
  rect(350,225, 100, 50);
  fill(0);
  text("start", 400,255);
   
}

void introClicks(){
  if(mouseX>350 && mouseX<440 && mouseY>225 && mouseY<275){
  mode=game;
  }
  
  
}


class Gif {
  PImage[] frames;
  int numFrames;
  int speed;
  int currentFrame;
  float x, y, w, h;

  Gif(String pre, String post, int n, int s, float _x, float _y ) {
    frames= new PImage[n];
    numFrames = n;
    speed = s;
    currentFrame = 0;
    x= _x;
    y= _y;

    int i = 0;
    while (i < numFrames) {
      frames[i]=loadImage(pre + i + post);
      i++;
    }
    
    w=frames[0].width;
    h=frames[0].height;
  }
  
   Gif(String pre, String post, int n, int s, float _x, float _y , float _w, float _h) {
   this(pre,post,n,s,_x,_y);
   w= _w;
   h= _h;
   }
   
   void show(){
     if(currentFrame == numFrames)currentFrame = 0;
     image(frames[currentFrame],x,y,w,h);
     if (frameCount % speed == 0)currentFrame++;
   }
}
