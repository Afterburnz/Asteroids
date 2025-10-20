class Ufo extends GameObject {
  float spawn;
  int cooldown;
  Ufo(float x, float y) {
    super(x, y, 1, 1);
    vel.setMag(random(1, 3));
    lives = 3;
    d = lives*50;
  }
  Ufo() {

    super(random(width), random(height), 1, 1);
    spawn = random(0, 1);

    vel.setMag(random(1, 3));
    vel.rotate(random(TWO_PI));
    lives = 3;
    d = lives*50;
  }
  Ufo(float x, float y, int l) {
    super(x, y, 1, 1);
    spawn = random(0, 1);
    vel.setMag(random(1, 3));
    vel.rotate(random(TWO_PI));
    lives = l;
    d = lives*50;
  }
  void show () {
    stroke(white);
    strokeWeight(3);
    pushMatrix();
    translate(loc.x, loc.y);
    fill(pink);
    circle(0, -lives*15, d/2);
    fill(lightRed);
    circle(0, -lives*12.5, d/4);
    fill(orange);
    ellipse(0, 0, 10*d/11, d/2);

    strokeWeight(1);
    popMatrix();
  }


  void act() {
    loc.add(vel);
    astWrapAround();
    shoot();
    checkForCollisions();
  }

  void shoot() {
    cooldown --;
    if (cooldown <= 0) {
      objects.add(new Bullet(loc.x,loc.y,player1.loc.x - loc.x, player1.loc.y - loc.y,true));
      cooldown = 60;
    }
  }
  void checkForCollisions() {
    int i = 0;
    while (i < objects.size()) {
      GameObject obj = objects.get(i);
      if (obj instanceof Bullet && ((Bullet) obj).enemy == false|| obj instanceof Spaceship) {
        if (dist(loc.x, loc.y, obj.loc.x, obj.loc.y) < d/2 + obj.d/2) {
          objects.add(new Ufo(loc.x, loc.y, lives-1));
          lives = 0;
          if (obj instanceof Bullet) obj.lives = 0;
          score++;
        }
      }
      i++;
    }
  }
}
