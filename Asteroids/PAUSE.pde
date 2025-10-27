void pause(){
  background(black);
  
  textAlign(CENTER);
  textSize(125);
  fill(pink);
  pushMatrix();
  translate(width/2, 400);
  scale(1, 4); // 1 = normal width, 2 = double height
  text("PAUSED", 0, 0);
  popMatrix();
}
