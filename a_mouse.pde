void mouseReleased(){
  if (mode==INTRO){
    introClicks();
  }else if(mode==GAME){
    gameClicks();
  }else if(mode==PAUSE){
    pauseClicks();
  }else if(mode==REDWIN){
    redwinClicks();
  }else if(mode==V_SETUP){
    v_setupClicks();
  }else if(mode==REDWIN){
    redwinClicks();
  }else if(mode==BLUEWIN){
    bluewinClicks();
  }else {
   println("mode error:" +mode);
  }
}
