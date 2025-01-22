void m2() {
  background(0);
  face.show();
  drawWorld();
  actWorld();
  player.act();
  for (int i = 0; i < 5; i++) {
    image(noheart, i*40 + 20, 30, 30, 30);
  }

  for (int i = 0; i < lives; i++) {
    image(heart, i*40 + 20, 30, 30, 30);
  }
}

void m2Clicks() {
  mode=M3;
  pause=1;
}
