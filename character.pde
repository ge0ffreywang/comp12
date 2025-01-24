void character(){
if (wkey && canMoveForward()) {
    eyeX=eyeX+cos(leftRightHeadAngle)*10;
    eyeZ=eyeZ+sin(leftRightHeadAngle)*10;
  }
  if (skey && canMoveBack()) {
    eyeX=eyeX-cos(leftRightHeadAngle)*10;
    eyeZ=eyeZ-sin(leftRightHeadAngle)*10;
  }
  if (akey && canMoveLeft()) {
    eyeX=eyeX-cos(leftRightHeadAngle+radians(90))*10;
    eyeZ=eyeZ-sin(leftRightHeadAngle+ radians(90))*10;
  }
  if (dkey && canMoveRight()) {
    eyeX=eyeX-cos(leftRightHeadAngle-radians(90))*10;
    eyeZ=eyeZ-sin(leftRightHeadAngle-radians(90))*10;
  }








}

boolean canMoveForward() {
  float fwdxM, fwdyM, fwdz,fwdxL,fwdxR;
  int mapxM, mapyM,mapxL,mapxR;
  fwdxM=eyeX+cos (leftRightHeadAngle)*200;
  fwdxL=eyeX+cos (leftRightHeadAngle+radians(20))*200;
  fwdxR=eyeX+cos (leftRightHeadAngle-radians(20))*200;
  fwdz=eyeZ+sin(leftRightHeadAngle)*200;
  fwdyM=eyeY;
 
  mapxM=int(fwdxM+2000)/gridSize;
  mapxL=int(fwdxL+2000)/gridSize;
  mapxR=int(fwdxR+2000)/gridSize;
 // mapxL=int(fwdx+1755)/gridSize;
  //mapxR=int(fwdx+2145)/gridSize;
  mapyM=int(fwdz+2000)/gridSize;
  if (map.get(mapxM, mapyM)==white && map.get(mapxL, mapyM)==white && map.get(mapxR, mapyM)==white) {
    return true;
  } else {
    return false;
  }
}

boolean canMoveLeft() {
  float fwdxM, fwdyM, fwdz,fwdxL,fwdxR;
  int mapxM, mapyM,mapxL,mapxR;
  fwdxM=eyeX+cos (leftRightHeadAngle-radians(90))*200;
  fwdxL=eyeX+cos (leftRightHeadAngle+radians(20)-radians(90))*200;
  fwdxR=eyeX+cos (leftRightHeadAngle-radians(20)-radians(90))*200;
  fwdz=eyeZ+sin(leftRightHeadAngle)*200;
  fwdyM=eyeY;
 
  mapxM=int(fwdxM+2000)/gridSize;
  mapxL=int(fwdxL+2000)/gridSize;
  mapxR=int(fwdxR+2000)/gridSize;
 // mapxL=int(fwdx+1755)/gridSize;
  //mapxR=int(fwdx+2145)/gridSize;
  mapyM=int(fwdz+2000)/gridSize;
  if (map.get(mapxM, mapyM)==white && map.get(mapxL, mapyM)==white && map.get(mapxR, mapyM)==white) {
    return true;
  } else {
    return false;
  }
}

boolean canMoveRight() {
  float fwdxM, fwdyM, fwdz,fwdxL,fwdxR;
  int mapxM, mapyM,mapxL,mapxR;
  fwdxM=eyeX+cos (leftRightHeadAngle+radians(90))*200;
  fwdxL=eyeX+cos (leftRightHeadAngle+radians(20)+radians(90))*200;
  fwdxR=eyeX+cos (leftRightHeadAngle-radians(20)+radians(90))*200;
  fwdz=eyeZ+sin(leftRightHeadAngle)*200;
  fwdyM=eyeY;
 
  mapxM=int(fwdxM+2000)/gridSize;
  mapxL=int(fwdxL+2000)/gridSize;
  mapxR=int(fwdxR+2000)/gridSize;
 // mapxL=int(fwdx+1755)/gridSize;
  //mapxR=int(fwdx+2145)/gridSize;
  mapyM=int(fwdz+2000)/gridSize;
  if (map.get(mapxM, mapyM)==white && map.get(mapxL, mapyM)==white && map.get(mapxR, mapyM)==white) {
    return true;
  } else {
    return false;
  }
}

boolean canMoveBack() {
  float fwdxM, fwdyM, fwdz,fwdxL,fwdxR;
  int mapxM, mapyM,mapxL,mapxR;
  fwdxM=eyeX+cos (leftRightHeadAngle+radians(180))*200;
  fwdxL=eyeX+cos (leftRightHeadAngle+radians(20)+radians(180))*200;
  fwdxR=eyeX+cos (leftRightHeadAngle-radians(20)+radians(180))*200;
  fwdz=eyeZ+sin(leftRightHeadAngle)*200;
  fwdyM=eyeY;
 
  mapxM=int(fwdxM+2000)/gridSize;
  mapxL=int(fwdxL+2000)/gridSize;
  mapxR=int(fwdxR+2000)/gridSize;
 // mapxL=int(fwdx+1755)/gridSize;
  //mapxR=int(fwdx+2145)/gridSize;
  mapyM=int(fwdz+2000)/gridSize;
  if (map.get(mapxM, mapyM)==white && map.get(mapxL, mapyM)==white && map.get(mapxR, mapyM)==white) {
    return true;
  } else {
    return false;
  }
}
