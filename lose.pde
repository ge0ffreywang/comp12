void gameover() {
  background(255);
  imageMode(CORNER); //<>//
  image(gameOver, 0, 0); //<>//
  if (!resetOnce) {                              // Do it once... //<>//
    sound.gameOverAudio.play();
    resetOnce = true;
  } else {
    if (!sound.gameOverAudio.isPlaying()) {
      respawnx=0;
      respawny=-300;
      doublejump=2;
      zoom=1.5;
      gridSize=32;
      setup();
    }
  }
}

void gameoverClicks() {
  mode=INTRO;
}
