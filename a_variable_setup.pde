void v_setup(){
  
  
}
void redkickman() {
  strokeWeight(1);
  fill(255, 0, 0);
  stroke(255, 0, 0);
  circle(redkickmanX, redkickmanY, 80); // Body

  // Left leg
  fill(255);
  stroke(255, 0, 0);
  rect(redkickmanX + leftredLeg - 40, redkickmanY - 60, 40, 20);

  // Right leg
  rect(redkickmanX + rightredleg, redkickmanY + 40, 40, 20);

  // Move player
  if (wkey) redkickmanY -= 5;
  if (skey) redkickmanY += 5;
  if (akey) redkickmanX -= 5;
  if (dkey) redkickmanX += 5;

  // Move legs
  if (wkey || skey || akey || dkey) {
    // Left leg
    leftredLeg += RedkickmanLeftlegvelocity;
    if (leftredLeg >= 40 || leftredLeg <= 0) {
      RedkickmanLeftlegvelocity *= -1;
    }

    // Right leg
    rightredleg += RedkickmanRightlegvelocity;
    if (rightredleg <= -40 || rightredleg >= 0) {
      RedkickmanRightlegvelocity *= -1;
    }
  }
}

void redgoaly() {
  fill(255, 0, 0);
  stroke(255, 0, 0);
  circle(redgoalyX, redgoalyY, 80); // Body

  // Left leg
  fill(255);
  stroke(255, 0, 0);
  rect(redgoalyX + redgoalyLeftleg - 40, redgoalyY - 60, 40, 20);

  // Right leg
  rect(redgoalyX + redgoalyRightleg, redgoalyY + 40, 40, 20);

  // Move player
  if (wkey) redgoalyY -= 5;
  if (skey) redgoalyY += 5;
  if (akey) redgoalyX -= 5;
  if (dkey) redgoalyX += 5;

  // Move legs
  if (wkey || skey || akey || dkey) {
    // Left leg
    redgoalyLeftleg += RedgoalyLeftlegVelocity;
    if (redgoalyLeftleg >= 40 || redgoalyLeftleg <= 0) {
      RedgoalyLeftlegVelocity *= -1;
    }

    // Right leg
    redgoalyRightleg += RedgoalyRightlegVelocity;
    if (redgoalyRightleg <= -40 || redgoalyRightleg >= 0) {
      RedgoalyRightlegVelocity *= -1;
    }
  }
}

void bluekickman() {
  fill(0, 0, 255);
  stroke(0, 0, 255);
  circle(bluekickmanX, bluekickmanY, 80); // Body

  // Left leg
  fill(255);
  stroke(0, 0, 255);
  rect(bluekickmanX + bluekickmanLeftLeg - 40, bluekickmanY - 60, 40, 20);

  // Right leg
  rect(bluekickmanX + bluekickmanRightLeg, bluekickmanY + 40, 40, 20);

  // Move player
  if (upkey) bluekickmanY -= 5;
  if (downkey) bluekickmanY += 5;
  if (leftkey) bluekickmanX -= 5;
  if (rightkey) bluekickmanX += 5;

  // Move legs
  if (upkey || downkey || leftkey || rightkey) {
    // Left leg
    bluekickmanLeftLeg += bluekickmanLeftlegVelocity;
    if (bluekickmanLeftLeg >= 40 || bluekickmanLeftLeg <= 0) {
      bluekickmanLeftlegVelocity *= -1;
    }

    // Right leg
    bluekickmanRightLeg += bluekickmanRightlegVelocity;
    if (bluekickmanRightLeg <= -40 || bluekickmanRightLeg >= 0) {
      bluekickmanRightlegVelocity *= -1;
    }
  }
}

void bluegoaly() {
  fill(0, 0, 255);
  stroke(0, 0, 255);
  circle(bluegoalyX, bluegoalyY, 80); // Body

  // Left leg
  fill(255);
  stroke(0, 0, 255);
  rect(bluegoalyX + bluegoalyLeftLeg - 40, bluegoalyY - 60, 40, 20);

  // Right leg
  rect(bluegoalyX + bluegoalyRightLeg, bluegoalyY + 40, 40, 20);

  // Move player
  if (upkey) bluegoalyY -= 5;
  if (downkey) bluegoalyY += 5;
  if (leftkey) bluegoalyX -= 5;
  if (rightkey) bluegoalyX += 5;

  // Move legs
  if (upkey || downkey || leftkey || rightkey) {
    // Left leg
    bluegoalyLeftLeg += bluegoalyLeftlegVelocity;
    if (bluegoalyLeftLeg >= 40 || bluegoalyLeftLeg <= 0) {
      bluegoalyLeftlegVelocity *= -1;
    }

    // Right leg
    bluegoalyRightLeg += bluegoalyRightlegVelocity;
    if (bluegoalyRightLeg <= -40 || bluegoalyRightLeg >= 0) {
      bluegoalyRightlegVelocity *= -1;
    }
  }
}


void keyPressed(){
  if (key=='w' || key=='W') wkey=true;
  if (key=='s' || key=='S') skey=true;
  if (key=='a' || key=='A') akey=true;
  if (key=='d' || key=='D') dkey=true; 
 
  if (keyCode==UP) upkey=true;
  if (keyCode==DOWN) downkey=true;
  if (keyCode==LEFT) leftkey=true;
  if (keyCode==RIGHT) rightkey=true;
}

void keyReleased(){
  if (key=='w' || key=='W') wkey=false;
  if (key=='s' || key=='S') skey=false;
  if (key=='a' || key=='A') akey=false;
  if (key=='d' || key=='D') dkey=false; 
  
  if (keyCode==UP) upkey=false;
  if (keyCode==DOWN) downkey=false;
  if (keyCode==LEFT) leftkey=false;
  if (keyCode==RIGHT) rightkey=false;
}
void v_setupClicks(){
  
  
}

void tactileR(int x,int y,int w,int h){
  if(mouseX>x && mouseX<x+w && mouseY > y && mouseY < y+h){
    strokeWeight(7);
   stroke(255); 
  }else{
    strokeWeight(2);
   stroke(255); 
  }
}
