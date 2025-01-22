void choose() {
  image(chooseScreen, 0, 0);
  textAlign(CENTER);
  textSize(25);


  fill(255);
  rect(210, 160, 380, 100);
  image(frame, 200, 150, 400, 120);
  fill(0);
  text("Press 2 for Map 1", 400, 215);

  fill(255);
  rect(210, 335, 380, 100);
  image(frame, 200, 325, 400, 120);
  fill(0);
  text("Press 3 for Map 2", 400, 390);

  fill(255);
  rect(210, 510, 380, 100);
  image(frame, 200, 500, 400, 120);
  fill(0);
  text("Press 4 for Map 3", 400, 565);

  textAlign(LEFT, BASELINE);
}

void chooseClicks() {
}


void keyPressed() {
  if (key == 'w' || key == 'W') wkey=true;
  if (key == 'a' || key == 'A') akey=true;
  if (key == 's' || key == 'S') skey=true;
  if (key == 'd' || key == 'D') dkey=true;
  if (key == 'q' || key == 'Q') qkey=true;
  if (key == 'e' || key == 'E') ekey=true;
  if (key==' ')spacekey=true;
  if (keyCode == UP)wkey=true;
  if (keyCode == DOWN)skey=true;
  if (keyCode == LEFT)akey=true;
  if (keyCode == RIGHT)dkey=true;
  if (mode == CHOOSE) {
    if (key == '2') {
      println("Loading Map 1...");
      loadPlayer();
      loadWorld(map1);
      mode=M2;
    } else if (key == '3') {
      println("Loading Map 2...");
      loadPlayer();
      loadWorld(map2);
      mode=M2;
    } else if (key == '4') {
      println("Loading Map 3...");
      loadPlayer();
      loadWorld(map3);
      mode=M2;
    }
  }
}

void keyReleased() {
  if (key == 'w' || key == 'W') wkey=false;
  if (key == 'a' || key == 'A') akey=false;
  if (key == 's' || key == 'S') skey=false;
  if (key == 'd' || key == 'D') dkey=false;
  if (key == 'q' || key == 'Q') qkey=false;
  if (key == 'e' || key == 'E') ekey=false;
  if (key==' ')spacekey=false;
  if (keyCode == UP)wkey=false;
  if (keyCode == DOWN)skey=false;
  if (keyCode == LEFT)akey=false;
  if (keyCode == RIGHT)dkey=false;
}
