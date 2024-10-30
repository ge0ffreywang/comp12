void gameover(){
  background(255);
  textSize(50);
  textAlign(CENTER);
  fill(#F09850);
  text("you win", width / 2, height / 2 - 100);
  textSize(15);
  text("click anywhere to proceed", width / 2, height / 2-50);
}

void gameoverClicks(){
  mode=intro;
  lscore=0;
  rscore=0;
  
  
}
