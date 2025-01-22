void gameover() {
  background(0);
  imageMode(CORNER); //<>//
  image(gameOver, 0, 0); //<>//
  if (!resetOnce) {                              //<>//
    sound.gameOverAudio.play();
    resetOnce = true;
  } else {
    if (!sound.gameOverAudio.isPlaying()) {
      respawnx=0;
      respawny=100;
      doublejump=2;
      zoom=1.3;
      gridSize=32;
      setup();
    }
  }
}

void gameoverClicks() {
  mode=INTRO;
}
