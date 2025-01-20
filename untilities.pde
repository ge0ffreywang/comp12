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
  } else if (mode == M3) {
    m3Clicks();
  } else if (mode == GAMEOVER) {
    gameoverClicks();
  }
}
