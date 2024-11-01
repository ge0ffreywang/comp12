void game(){
  background(blue);
  
   println("x: " + mouseX + " y: " + mouseY);
    

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
      ball.setAngularVelocity(0);
      rightPlayer.setPosition(750, 450);
      leftPlayer.setPosition(50, 450);
    }

    handlePlayerInput();
  if (lscore==2 ){
    mode = redwin;
    
  }
  
  if (rscore==2 ){
    mode = greenwin;
    
  }
}
