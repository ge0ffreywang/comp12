//Len Pelletier
//button class
Button mybutton;
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
 mybutton= new Button("blue",100,110,110,100,blue,pink); 
  
  
}
void draw(){
 background(0);
 mybutton.show();
  
}
