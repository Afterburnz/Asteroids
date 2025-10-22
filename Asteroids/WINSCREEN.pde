
void winscreen() {
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
  text("GG", 500, 250);
  if (myButtons[1].clicked && mode ==4) {
    mode =0;
    commence();
  }
  myButtons[1].show();
}
