void game(){
  world.draw();
  world.step();
  
  println("x: " + mouseX + " y: " + mouseY);
  background(blue);

  // Display the scores
  fill(255);  // White color for the text
  textSize(32);
  textAlign(CENTER);

  // Left Player Score
  text("Left Player: " + lscore, width / 4, 50);

  // Right Player Score
  text("Right Player: " + rscore, 3 * width / 4, 50);
  //reset after scoring
  
  if (leftscore(ball)==true || leftscore2(ball)==true || rightscore(ball)==true || rightscore2(ball)==true) {
    ball.setPosition(width/2, 0);
    ball.setVelocity(0, 0);
    rightPlayer.setPosition(750, 450);
    leftPlayer.setPosition(50, 450);
  }
  handlePlayerInput();
}

void gameClicks(){
  
  
  
}
