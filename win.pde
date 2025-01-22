void win() {
  background(255);
  imageMode(CORNER);
  image(youWin, 0, 0);
  if (!resetOnce) {
    sound.youWinAudio.play();
    resetOnce = true;
  } else {
    if (!sound.youWinAudio.isPlaying()) {
      respawnx=100;
      respawny=50;
      doublejump=2;
      zoom=1.3;
      gridSize=32;

      setup();
    }
  }
}

void winClicks() {
}
