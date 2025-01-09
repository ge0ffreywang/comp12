PImage diamond;
float rotx, roty;
void setup() {
  size(800, 800, P3D);
  diamond=loadImage("diamond.png");
}
void draw(){
background(0);
  
pushMatrix();
translate(width/2,height/2,0);
scale(200);
rotateX(rotx);
rotateY(roty);

noStroke();

beginShape(QUADS);
texture(diamond);

//top
vertex();
vertex();
vertex();
vertex();
//bottom

//front

//back
endShape();

popMatrix();
}

void mouseDragged() {
  rotx=rotx+(pmouseY-mouseY )*0.01;
  roty=roty+(pmouseX-mouseX )*-0.01;
}
