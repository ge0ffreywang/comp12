void bluewin(){
   background(255);
  textSize(50);
  textAlign(CENTER);
  fill(0,0,255);
  text("blue win", width / 2, height / 2 - 100);
  textSize(15);
  tactileR(350,225, 100, 50);
  rect(350,225, 100, 50);
  fill(0);
  text("restart", 400,255);
  
}

void bluewinClicks(){
  if(mouseX>350 && mouseX<440 && mouseY>225 && mouseY<275){
  
  mode=INTRO;
  redscore=0;
  bluescore=0;
  }
  
}
