


void pause() {
  background(black);

  stroke(white);
  strokeWeight(20);
  float by = 0;
  while (by <= height) {
    line(0, by, 1000, by);
    by=by+100;
  }
  float bx = -1000;
  stroke(black);
  while(bx<=width){
    line(bx,0,bx+1000,height);
    bx = bx+100;
}
  float bx2 = 2000;
  stroke(black);
  while(bx2 >=-0){
    line(bx2,0,bx2-1000,height);
    bx2 = bx2-100;
}
  textAlign(CENTER);
  textSize(125);
  fill(pink);
  pushMatrix();
  translate(width/2, 400);
  scale(1, 4);
  text("PAUSED", 0, 0);
  popMatrix();
  if (myButtons[2].clicked && mode ==2) mode =1;
  myButtons[2].show();
}
