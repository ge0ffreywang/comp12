void m3() {
  background(255);
  imageMode(CORNER);
  image(youWin, 0, 0);
  if (!resetOnce) {
    sound.youWinAudio.play();
    resetOnce = true;
  } else {
    if (!sound.youWinAudio.isPlaying()) {
      respawnx=0;
      respawny=-300;
      doublejump=2;
      zoom=1.5;
      gridSize=32;

      setup();
    }
  }
}

void m3Clicks() {
}
