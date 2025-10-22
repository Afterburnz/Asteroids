void endscreen() {
  background(black);
  fill(white);
  imageMode(CENTER);
  gif = new PImage[numberOfFrames];


  t = t+1;
  if (t>=numberOfFrames) t = 0;
  gif[t] = loadImage("frame_"+t+"_delay-0.04s.gif");
  image(gif[t], 500, 500, width, height);
  textAlign(CENTER);
  textSize(60);
  text("U DEAD", 500, 250);
  textSize(45);
  if (score == 1)  text(score + " asteroid was successfully destroyed", 500, 800);
  else text(score + " asteroids were successfully destroyed", 500, 800);
  if (myButtons[1].clicked && mode ==3) {
    mode =0;
    commence();
  }
  myButtons[1].show();
}
