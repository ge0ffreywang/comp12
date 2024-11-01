void greenwin(){
  background(255);
  textSize(50);
  textAlign(CENTER);
  fill(green);
  text("green win", width / 2, height / 2 - 100);
  textSize(15);
  tactileR(350,225, 100, 50);
  rect(350,225, 100, 50);
  fill(0);
  text("restart", 400,255);
}

void greenwinClicks(){
  if(mouseX>350 && mouseX<440 && mouseY>225 && mouseY<275){
  
  mode=intro;
  lscore=0;
  rscore=0;
  }
  
}
