float spawn;
float x [] = new float[100];
float y [] = new float[100];
int xCount = 0;
int yCount = 0;
void game() {
  background(black);
  while (xCount < x.length) {
    x[xCount] = random(width);
    xCount++;
  }

  while (yCount < y.length) {
    y[yCount] = random(height);
    yCount++;
  }

  int c = 0;

  while (c < 100) {
    noStroke();
    fill(white);
    square(x[c], y[c], 10);
    c++;
  }

  if (asteroidTimer > 300) {
    asteroidTimer = 0;
    spawn = random(0, 1);
    if (spawn <= 0.25) {
      objects.add(new Asteroid(0, random(height)));
    }
    if (spawn > 0.25 && spawn <=0.50) {
      objects.add(new Asteroid(1000, random(height)));
    }
    if (spawn > 0.50 && spawn <=0.75) {
      objects.add(new Asteroid(random(width), 0));
    }
    if (spawn >0.75) {
      objects.add(new Asteroid(random(width), 1000));
    }
  }
  if (ufoTimer > 750) {
    ufoTimer = 0;
    spawn = random(0, 1);
    if (spawn <= 0.25) {
      objects.add(new Ufo(0, random(height)));
    }
    if (spawn > 0.25 && spawn <=0.50) {
      objects.add(new Ufo(1000, random(height)));
    }
    if (spawn > 0.50 && spawn <=0.75) {
      objects.add(new Ufo(random(width), 0));
    }
    if (spawn >0.75) {
      objects.add(new Ufo(random(width), 1000));
    }
  }
  asteroidTimer ++;
  ufoTimer ++;
  int i =0;
  fill(lightBlue);
  textAlign(LEFT);
  textSize(40);
  text("Lives remaining: " +player1.lives, 25, 50);
  fill(lightRed);
  text("Asteroids destroyed: " + score, 25, 110);
  rectMode(CORNER);
  stroke(white);
  strokeWeight(2);
  fill(pink);
  text("Teleport:", 25, 180);
  rect(225, 135, 250, 60);
  textAlign(CENTER, CENTER);
  textSize(40);
  fill(purple);
  text("Ready", 350, 165);

  textAlign(LEFT);
  fill(lightPurple);
  rect(225, 135, map(max(0, tpTimer), 0, 600, 0, 250), 60);

  while (i < objects.size()) {
    GameObject currentObject = objects.get(i);
    currentObject.act();
    currentObject.show();
    if (currentObject.lives == 0) {
      objects.remove(i);
    } else {

      i++;
    }
  }

  if (player1.lives <=0) mode =3;


  if (score >= 100) mode = WINSCREEN;

  player1.show();
}
