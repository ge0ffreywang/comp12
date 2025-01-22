PImage reverseImage( PImage image ) {
  PImage reverse;
  reverse = createImage(image.width, image.height, ARGB );

  for ( int i=0; i < image.width; i++ ) {
    for (int j=0; j < image.height; j++) {
      int xPixel, yPixel;
      xPixel = image.width - 1 - i;
      yPixel = j;
      reverse.pixels[yPixel*image.width+xPixel]=image.pixels[j*image.width+i] ;
    }
  }
  return reverse;
}

void mouseRelease() {
  if (mode == INTRO) {
    introClicks();
  } else if (mode == M1) {
    m1Clicks();
  } else if (mode == M2) {
    m2Clicks();
  } else if (mode == WIN) {
    winClicks();
  } else if (mode == GAMEOVER) {
    gameoverClicks();
  }
  else if (mode == CHOOSE) {
    chooseClicks();
  }else if (mode == M3) {
    m3Clicks();
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
      frames[i].resize(1067,800);
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
