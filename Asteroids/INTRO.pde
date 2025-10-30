PImage i;
PImage[] gif;
int numberOfFrames = 30;
int t = 0;

void intro() {
  background(black);
  fill(white);
  imageMode(CENTER);
  gif = new PImage[numberOfFrames];


  t = t+1;
  if (t>=numberOfFrames) t = 0;
  gif[t] = loadImage("frame_"+t+"_delay-0.04s.gif");

  image(gif[t], 500, 500, width, height);

  textAlign(CENTER);
  textSize(90);
  fill(lightBlue);
  text("Asteroids from Temu", 500, 100);
  fill(lightRed);
  textSize(70);
  text("Break 100 asteroids to win!", 500, 200);
  fill(lightPurple);
  textSize(60);
  text("p to pause & e to teleport", 500, 660);
  if (myButtons[0].clicked && mode ==0) mode =1;

  myButtons[0].show();
}
