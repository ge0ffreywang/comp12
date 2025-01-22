class Fheart extends FGameObject {

  Fheart(float x, float y) {
    super();
    setPosition(x, y);
    setName("lheart");
    attachImage(heart);
    setStatic(true);
    setSensor(true);
  }

  void act() {
    if (isTouching("player")) {
      setStatic(false);
      lives=5+5;
      score=score+150;
    }
  }
}
