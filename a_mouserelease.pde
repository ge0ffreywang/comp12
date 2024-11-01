void mouseReleased(){
  if (mode==intro){
    introClicks();
  }else if(mode==redwin){
 redwinClicks ();   
  }else if(mode==greenwin){
    greenwinClicks();
    
  }
}
void tactileR(int x,int y,int w,int h){
  if(mouseX>x && mouseX<x+w && mouseY > y && mouseY < y+h){
    strokeWeight(7);
   stroke(255); 
  }else{
    strokeWeight(2);
   stroke(255); 
  }
}
