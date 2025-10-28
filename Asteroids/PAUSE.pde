void pause() {
  background(black);
 
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
