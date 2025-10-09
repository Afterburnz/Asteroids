class Asteroid extends GameObject {

  float rotSpeed, angle;
  float r = random(0.5, 2.5);
  float dr = random(5,25);
  float lr = random(5,15);
  Asteroid() {
    super(random(width), random(height), 1, 1);
    vel.setMag(random(1, 3));
    vel.rotate(random(TWO_PI));
    lives = 3;
    d = lives*50;
    rotSpeed = random (-2, 2);
    angle = 0;
  }

  Asteroid(float x, float y, int l) {
    super(x, y, 1, 1);
    vel.setMag(random(1, 3));
    vel.rotate(random(TWO_PI));
    lives = l;
    d = lives*50;
    rotSpeed = random (-2, 2);
    angle = 0;
  }

  void show() {
    fill(black);
    stroke(white);
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
      if (obj instanceof Bullet) {
        if (dist(loc.x, loc.y, obj.loc.x, obj.loc.y) < d/2 + obj.d/2) {
          objects.add(new Asteroid(loc.x, loc.y, lives-1));
          objects.add(new Asteroid(loc.x, loc.y, lives-1));
          lives = 0;
          obj.lives = 0;
        }
      }
      i++;
    }
  }
}
