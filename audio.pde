class SoundTrack {

  // DECLARES MINIM CLASS...
  Minim minim;

  // BUNCH OF SOUNDS OF THE GAMES...
  AudioPlayer homeAudio, levelAudio, gameOverAudio, youWinAudio;
  AudioPlayer marioJumpAudio, marioKickAudio, marioDeadAudio;
  AudioPlayer coinCollectAudio;
  AudioPlayer courseClearAudio;

  SoundTrack(PApplet theApplet) {

    minim = new Minim(theApplet);

    homeAudio = minim.loadFile("sounds/home.wav");
    levelAudio = minim.loadFile("sounds/levelBackgroundMusic.wav");
    gameOverAudio = minim.loadFile("sounds/gameOver.wav");
    youWinAudio = minim.loadFile("sounds/youWin.wav");

    marioJumpAudio = minim.loadFile("sounds/marioJump.wav");
    marioKickAudio = minim.loadFile("sounds/marioKick.wav");
    marioDeadAudio = minim.loadFile("sounds/marioDies.wav");
    courseClearAudio = minim.loadFile("sounds/courseClear.wav");
    coinCollectAudio = minim.loadFile("sounds/CoinCollection.wav");
  }
}
