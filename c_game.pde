void game() {
  background(255);
  
   // Draw the field background
  drawField();
  
  //goal
  fill(255);
  stroke(0);
  
  //player
  redkickman();
  redgoaly();
  bluekickman();
  bluegoaly();
  //ball
  stroke(0);
  fill(0);
  circle(ballx, bally, balld);

//scoring
textSize(32);
fill(0);
text("Red: " + redscore, 100, 50);
text("Blue: " + bluescore, width - 100, 50);

  //ball movement
  ballx=ballx+vx;
  bally=bally+vy;

  vy=vy*0.990001;
  vx=vx*0.990001;

  if (bally<balld/2 || bally>height-balld/2) {
    vy = vy*-1.1;
    vx=vx*1.1;
  }

 
   if (ballx<balld/2) {
    ballx=400;
    bally=400;
     bluekickmanX=500; bluekickmanY=300;
     redkickmanX=300; redkickmanY=300;
     
     bluegoalyX=700; bluegoalyY=300;
     redgoalyX=100; redgoalyY=300;
    bluescore++;
    vx=random(-5,5);
    vy=random(-5,5);
  } else if (ballx>width-balld/2) {
    ballx=400;
    bally=400;
    bluekickmanX=500; bluekickmanY=300;
     redkickmanX=300; redkickmanY=300;
     
     bluegoalyX=700; bluegoalyY=300;
     redgoalyX=100; redgoalyY=300;
    redscore++;
    vx=random(-5,5);
    vy=random(-5,5);
  }

  //stop red paddle
  if (redkickmanY<0+40) {
    redkickmanY=redkickmanY+5;
  }
  if (redkickmanY>height-40) {
    redkickmanY=redkickmanY-5;
  }
  if (redgoalyY<0+40) {
    redgoalyY=redgoalyY+5;
  }
  if (redgoalyY>height-40) {
    redgoalyY=redgoalyY-5;
  }

  if (redkickmanX<185+40) {
    redkickmanX=redkickmanX+5;
  }
  if (redkickmanX>width-40-185) {
    redkickmanX=redkickmanX-5;
  }
  if (redgoalyX<40) {
    redgoalyX=redgoalyX+5;
  }
  if (redgoalyX>185-40) {
    redgoalyX=redgoalyX-5;
  }

  //stop blue
  if (bluekickmanY<40) {
    bluekickmanY=bluekickmanY+5;
  }
  if (bluegoalyY<40) {
    bluegoalyY=bluegoalyY+5;
  }
  if (bluekickmanY>height-40) {
    bluekickmanY=bluekickmanY-5;
  }
  if (bluegoalyY>height-40) {
    bluegoalyY=bluegoalyY-5;
  }

  if (bluekickmanX<40+185) {
    bluekickmanX=bluekickmanX+5;
  }
  if (bluekickmanX>width-40-185) {
    bluekickmanX=bluekickmanX-5;
  }
  if (bluegoalyX<width+40-185) {
    bluegoalyX=bluegoalyX+5;
  }
  if (bluegoalyX>width-40) {
    bluegoalyX=bluegoalyX-5;
  }
  println(dist(redkickmanX, redkickmanY, ballx, bally), balld/2+80/2);
  fill(0);
  //circle(Redx, Redy, 100);

  //red player bouncing 100,300
  if (dist(redkickmanX, redkickmanY, ballx, bally)<=balld/2+80/2) {

    vx=(ballx-redkickmanX)/4;
    vy=(bally-redkickmanY)/4;
  }
  if (dist(redgoalyX, redgoalyY, ballx, bally)<=balld/2+80/2) {

    vx=(ballx-redgoalyX)/4;
    vy=(bally-redgoalyY)/4;
  }

  if (dist(bluekickmanX, bluekickmanY, ballx, bally)<=balld/2+80/2) {

    vx=(ballx-bluekickmanX)/4;
    vy=(bally-bluekickmanY)/4;
  }
  
   if (dist(bluegoalyX, bluegoalyY, ballx, bally)<=balld/2+80/2) {

    vx=(ballx-bluegoalyX)/4;
    vy=(bally-bluegoalyY)/4;
  }

  //winning
  if(redscore==3){
    mode=REDWIN;
    
  }
  if(bluescore==3){
   mode=BLUEWIN; 
    
  }
}

void drawField() {
  // Draw alternating vertical stripes (light and dark green)
  int stripeWidth = 80; // Wider stripes
  for (int i = 0; i < width; i += stripeWidth) {
    if ((i / stripeWidth) % 2 == 0) {
      fill(#2ecc71); // Light green
    } else {
      fill(#27ae60); // Dark green
    }
    noStroke();
    rect(i, 0, stripeWidth, height); // Draw vertical stripe covering full height
  }

  // Draw center line
  stroke(255); // White center line
  strokeWeight(15);
  line(width / 2, 0, width / 2, height);

  // Draw center circle
  noFill();
  stroke(255); // White for center circle
  strokeWeight(15);
  ellipse(width / 2, height / 2, 120, 120);

  // Draw goal lines instead of rectangles
  stroke(255);
  strokeWeight(15);

 line(185, 0, 185, height);
 rect(width-185, 0, width-185, height);
}



void gameClicks() {
}
