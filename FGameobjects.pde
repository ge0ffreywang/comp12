

class FGameObject extends FBox {
  final int L=-1;
  final int R=1;
  FGameObject() {
    super(gridSize, gridSize);
  }
  FGameObject(float x, float y) {
    super(x, y);
  }

  void act() {
  }
  void hammer() {
  }
  boolean isTouching(String n) {
    ArrayList<FContact> contacts=getContacts();
    for (int i=0; i< contacts.size(); i++) {
      FContact fc= contacts.get(i);
      if (fc.contains(n)) {
        return true;
      }
    }
    return false;
  }

  boolean sensorTouching(FBox s, String n) {
    ArrayList<FContact> contacts=s.getContacts();
    for (int i=0; i< contacts.size(); i++) {
      FContact fc= contacts.get(i);
      if (fc.contains(n)) {
        return true;
      }
    }
    return false;
  }
}
