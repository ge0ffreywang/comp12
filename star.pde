class FStar extends FGameObject {
 
  FStar(float x, float y) {
    super();
    setPosition (x, y);
    setName("star");
    attachImage(star);
    setStatic(true);
    setSensor(true);
  }

  void act () {
    if (isTouching("player")) {
      terrain.remove(this);
      world.remove(this);
      score=score+300;

    immune = true;

 
    }
    
  }
  
  
}

 
