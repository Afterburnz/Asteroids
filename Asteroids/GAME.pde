float spawn;

void game() {
  background(black);

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
  if (ufoTimer > 120) {
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

  if (player1.lives == 0) mode =3;
  fill(lightBlue);
  textAlign(LEFT);
  textSize(40);
  text("Lives remaining: " +player1.lives, 25, 50);
  text("Asteroids destroyed: " + score, 25, 110);
  if (score >= 100) mode =4;
}


void gameClicks() {
}
