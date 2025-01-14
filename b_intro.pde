void intro(){
  background(255);
  textSize(48);
  textAlign(CENTER);
  fill(#F09850);
  text("soccer Game", width / 2, height / 2 - 100);
  textSize(15);
  
  tactileR(350,225, 100, 50);
  rect(350,225, 100, 50);
  fill(0);
  text("start", 400,255);
  strokeWeight(2);
}

void introClicks(){
  if(mouseX>350 && mouseX<440 && mouseY>225 && mouseY<275){
  mode=GAME;
  }
  
}
