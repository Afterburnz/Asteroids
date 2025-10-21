class Asteroid extends GameObject {
  float spawn;
  float rotSpeed, angle;
  float r = random(0.5, 2.5);
  float dr = random(5, 25);
  float lr = random(5, 15);

  int [] red = new int[7];
  int [] green = new int[7];
  int [] blue = new int[7];
  int rCount = 0;
  int gCount = 0;
  int bCount = 0;



  Asteroid(float x, float y) {

    super(x, y, 1, 1);

    vel.setMag(random(1, 3));
    vel.rotate(random(TWO_PI));
    lives = 3;
    d = lives*50;
    rotSpeed = random (-2, 2);
    angle = 0;
    while (rCount < red.length) {
      red[rCount] = int(random(0, 255));
      rCount++;
    }

    while (gCount < green.length) {
      green[gCount] = int(random(0, 255));
      gCount++;
    }
    while (bCount < blue.length) {
      blue[bCount] = int(random(0, 255));
      bCount++;
    }
  }
  Asteroid() {

    super(random(width), random(height), 1, 1);
    spawn = random(0, 1);

    vel.setMag(random(1, 3));
    vel.rotate(random(TWO_PI));
    lives = 3;
    d = lives*50;
    rotSpeed = random (-2, 2);
    angle = 0;
    while (rCount < red.length) {
      red[rCount] = int(random(0, 255));
      rCount++;
    }

    while (gCount < green.length) {
      green[gCount] = int(random(0, 255));
      gCount++;
    }
    while (bCount < blue.length) {
      blue[bCount] = int(random(0, 255));
      bCount++;
    }
  }

  Asteroid(float x, float y, int l) {
    super(x, y, 1, 1);
    spawn = random(0, 1);
    vel.setMag(random(1, 3));
    vel.rotate(random(TWO_PI));
    lives = l;
    d = lives*50;
    rotSpeed = random (-2, 2);
    angle = 0;
    while (rCount < red.length) {
      red[rCount] = int(random(0, 255));
      rCount++;
    }

    while (gCount < green.length) {
      green[gCount] = int(random(0, 255));
      gCount++;
    }
    while (bCount < blue.length) {
      blue[bCount] = int(random(0, 255));
      bCount++;
    }
  }

  void show() {
    fill(black);
    int i = 0;
    stroke(red[i], green[i], blue[i]);
    i++;
    strokeWeight(3);

    pushMatrix();

    translate(loc.x, loc.y);


    rotate(radians(angle));

    angle = angle+ r;
    circle(0, 0, d);
    line(0-lives*50/2, 0, 0+lives*50/2, 0);
    line(0, 0-lives*50/2, 0, 0+lives*50/2);
    circle(0-lives*lr, 0+lives*lr, d/dr);
    circle(0+lives*lr, 0-lives*lr, d/dr);
    circle(0-lives*lr, 0-lives*lr, d/dr);
    circle(0+lives*lr, 0+lives*lr, d/dr);
    strokeWeight(1);
    popMatrix();
  }

  void act() {
    loc.add(vel);
    astWrapAround();
    checkForCollisions();
  }
  void checkForCollisions() {
    int i = 0;
    while (i < objects.size()) {
      GameObject obj = objects.get(i);
      if (obj instanceof Bullet && ((Bullet) obj).enemy == false|| obj instanceof Spaceship) {
        if (dist(loc.x, loc.y, obj.loc.x, obj.loc.y) < d/2 + obj.d/2) {
          objects.add(new Asteroid(loc.x, loc.y, lives-1));
          objects.add(new Asteroid(loc.x, loc.y, lives-1));
          lives = 0;
          if (obj instanceof Bullet) obj.lives = 0;
          score++;
        }
      }
      i++;
    }
  }
}
