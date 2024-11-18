class FPlayer extends FBox{
  
  FPlayer(){
    super(gridSize,gridSize);
    setPosition(300,0);
    setFillColor(red);
  }
  void act(){
    float vy= getVelocityY(); 
    float vx= getVelocityX(); 
   if(akey) setVelocity(-500,vy);
   if(dkey)setVelocity(500,vy);
   if (wkey)setVelocity(vx, -500);
  if (skey)setVelocity(vx, 500);
  if (touchingSpikes()) {
    setPosition(300, 0);
  }
  }
  
  boolean touchingSpikes() {
    ArrayList<FBox> playercontactlist= getTouching();
    for (int i = 0; i < playercontactlist.size(); i++) {
     FBox boxincontact = playercontactlist.get(i);
     if (boxincontact.getName() == "spikes") {
       return true;
     }
    }
   return false;
  }
}
