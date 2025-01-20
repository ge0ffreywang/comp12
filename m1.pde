void m1() {
  background(white);
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

void m1Clicks() {
}
