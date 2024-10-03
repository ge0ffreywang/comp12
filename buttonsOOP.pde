//Len Pelletier
//button class
Button[] mybutton;
//color pallette
color blue = #28E7ED;
color green= #CEF255;
color pink = #F76DDC;
color yellow=#FFF387;
color black =#000000;
color white =#FFFFFF;

boolean mouseReleased;
boolean wasPressed;



void setup(){
size(800,800); 
 mybutton[1]= new Button("blue",100,110,110,100,blue,pink); 
 mybutton[2]= new Button("green",500,110,400,100,green,yellow);
  
}
void draw(){
  click();
 mybutton[1].show();
 mybutton[1].clicked();
 mybutton[2].show();
 mybutton[2].clicked();
}
