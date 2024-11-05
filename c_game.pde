void game() {
  background(255);
  //goal
  fill(255);
  stroke(0);
  rect(0, 175, 185, 250);
  rect(width-185, 175, 185, 250);
  //player
  leftkickman();
  rightkickman();
  //ball
  stroke(0);
  fill(0);
  circle(ballx, bally, balld);

//scoring
textSize(32);
fill(0);
text("Red: " + redscore, 50, 50);
text("Blue: " + bluescore, width - 150, 50);

  //ball movement
  ballx=ballx+vx;
  bally=bally+vy;

  vy=vy*0.990001;
  vx=vx*0.990001;

  if (bally<balld/2 || bally>height-balld/2) {
    vy = vy*-1.1;
    vx=vx*1.1;
  }

  if ((ballx<balld/2 || ballx>width-balld/2) && (bally<175 || bally>425)) {
    vy = vy*1.1;
    vx=vx* -1.1;
  } else if (ballx<balld/2 && 175<bally  &&  bally<425) {
    ballx=400;
    bally=400;
     bluex=500; bluey=300;
     Redx=300; Redy=300;
    bluescore++;
  } else if (ballx>width-balld/2 && 175<bally  &&  bally<425) {
    ballx=400;
    bally=400;
     bluex=500; bluey=300;
     Redx=300; Redy=300;
    redscore++;
  }

  //stop red paddle
  if (Redy<0+40) {
    Redy=Redy+5;
  }
  if (Redy>height-40) {
    Redy=Redy-5;
  }

  if (Redx<40) {
    Redx=Redx+5;
  }
  if (Redx>width-40) {
    Redx=Redx-5;
  }

  //stop blue
  if (bluey<40) {
    bluey=bluey+5;
  }
  if (bluey>height-40) {
    bluey=bluey-5;
  }

  if (bluex<40) {
    bluex=bluex+5;
  }
  if (bluex>width-40) {
    bluex=bluex-5;
  }

  println(dist(Redx, Redy, ballx, bally), balld/2+80/2);
  fill(0);
  //circle(Redx, Redy, 100);

  //red player bouncing 100,300
  if (dist(Redx, Redy, ballx, bally)<=balld/2+80/2) {

    vx=(ballx-Redx)/4;
    vy=(bally-Redy)/4;
  }

  if (dist(bluex, bluey, ballx, bally)<=balld/2+80/2) {

    vx=(ballx-bluex)/4;
    vy=(bally-bluey)/4;
  }

  //scoring
}





void gameClicks() {
}
