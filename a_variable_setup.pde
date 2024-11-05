void v_setup(){
  
  
}
void leftkickman(){
  fill(255,0,0);
  stroke(255,0,0);
  circle(Redx,Redy,80);
  fill(255);
  stroke(255,0,0);
  //left leg
  
  rect(Redx+redlegup-40,Redy-60,40,20);
  //right leg
  rect(Redx+redlegdown,Redy+40,40,20);
  //move player
  if (wkey==true)Redy=Redy-5;
  if (skey==true)Redy=Redy+5;
  if (akey==true)Redx=Redx-5;
  if (dkey==true)Redx=Redx+5;
  //move plyer legs
  //left leg
   translate(0,0);
   if(wkey==true || skey==true || akey==true || dkey==true){
 //left leg
   redlegup=redlegup+redleftlegvelocity;
    if(redlegup==40){
    redleftlegvelocity=redleftlegvelocity*-1;
    } else if(redlegup==0){
    redleftlegvelocity=redleftlegvelocity*-1;
    }
    
    //right leg
     translate(0,0);
   redlegdown=redlegdown+redrightlegvelocity;
    if(redlegdown==0){
    redrightlegvelocity=redrightlegvelocity*-1;
    } else if(redlegdown==-40){
    redrightlegvelocity=redrightlegvelocity*-1;
    }
 }
}

void rightkickman(){
  fill(0,0,255);
   stroke(0,0,255);
  circle(bluex,bluey,80);
  //left leg
  fill(255);
  stroke(0,0,255);
  rect(bluex+bluelegup-40,bluey-60,40,20);
  //right leg
  rect(bluex+bluelegdown,bluey+40,40,20);
  //move player
  if (upkey==true)bluey=bluey-5;
  if (downkey==true)bluey=bluey+5;
  if (leftkey==true)bluex=bluex-5;
  if (rightkey==true)bluex=bluex+5;
  //move plyer legs
  //left leg
   translate(0,0);
   if(upkey==true || downkey==true || leftkey==true || rightkey==true){
 //left leg
   bluelegup=bluelegup+blueleftlegvelocity;
    if(bluelegup==40){
    blueleftlegvelocity=blueleftlegvelocity*-1;
    } else if(bluelegup==0){
    blueleftlegvelocity=blueleftlegvelocity*-1;
    }
    
    //right leg
     translate(0,0);
   bluelegdown=bluelegdown+bluerightlegvelocity;
    if(bluelegdown==0){
    bluerightlegvelocity=bluerightlegvelocity*-1;
    } else if(bluelegdown==-40){
    bluerightlegvelocity=bluerightlegvelocity*-1;
    }
 }
}

void p1legs(){
 translate(0,0);
 translate(0,0);
 //left leg
 redlegup=redlegup+redleftlegvelocity;
  if(redlegup==40){
  redleftlegvelocity=redleftlegvelocity*-1;
  } else if(redlegup==0){
  redleftlegvelocity=redleftlegvelocity*-1;
  }
 //left leg
 redlegup=redlegup+redleftlegvelocity;
  if(redlegup==40){
  redleftlegvelocity=redleftlegvelocity*-1;
  } else if(redlegup==0){
  redleftlegvelocity=redleftlegvelocity*-1;
  }
}

void keyPressed(){
  if (key=='w' || key=='W') wkey=true;
  if (key=='s' || key=='S') skey=true;
  if (key=='a' || key=='A') akey=true;
  if (key=='d' || key=='D') dkey=true; 
 
  if (keyCode==UP) upkey=true;
  if (keyCode==DOWN) downkey=true;
  if (keyCode==LEFT) leftkey=true;
  if (keyCode==RIGHT) rightkey=true;
}

void keyReleased(){
  if (key=='w' || key=='W') wkey=false;
  if (key=='s' || key=='S') skey=false;
  if (key=='a' || key=='A') akey=false;
  if (key=='d' || key=='D') dkey=false; 
  
  if (keyCode==UP) upkey=false;
  if (keyCode==DOWN) downkey=false;
  if (keyCode==LEFT) leftkey=false;
  if (keyCode==RIGHT) rightkey=false;
}
void v_setupClicks(){
  
  
}
