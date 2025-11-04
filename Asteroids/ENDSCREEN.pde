float x2 [] = new float[1000];
float y2 [] = new float[1000];
int xCount2 = 0;
int yCount2 = 0;
int [] red2 = new int[1000];
int [] green2 = new int[1000];
int [] blue2 = new int[1000];
int rCount2 = 0;
int gCount2 = 0;
int bCount2 = 0;
void endscreen() {
  background(black);
  while (xCount2 < x2.length) {
    x2[xCount2] = random(width);
    xCount2++;
  }

  while (yCount2 < y2.length) {
    y2[yCount2] = random(height);
    yCount2++;
  }
  while (rCount2 < red2.length) {
    red2[rCount2] = int(random(0, 255));
    rCount2++;
  }

  while (gCount2 < green2.length) {
    green2[gCount2] = int(random(0, 255));
    gCount2++;
  }
  while (bCount2 < blue2.length) {
    blue2[bCount2] = int(random(0, 255));
    bCount2++;
  }

  int c = 0;

  while (c < 1000) {
    noStroke();
    fill(red2[c],green2[c],blue2[c]);
    square(x2[c], y2[c], 5);
    c++;
  }
  fill(purple);
  textAlign(CENTER);
  pushMatrix();
  translate(width/2, 250);
  scale(2.75, 1.5);
  text("Your bad", 0, 0);
  popMatrix();
  textSize(45);
  fill(lightPurple);
  if (score == 1)  text(score + " asteroid was successfully destroyed", 500, 800);
  else text(score + " asteroids were successfully destroyed", 500, 800);
  if (myButtons[1].clicked && mode ==3) {
    mode =0;
    commence();
  }
  myButtons[1].show();
}
