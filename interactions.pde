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
