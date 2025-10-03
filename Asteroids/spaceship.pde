class Spaceship {
  PVector loc; //location
  PVector vel; //velocity
  PVector dir; //direction


  Spaceship() {
    loc = new PVector(width/2, height/2);
    vel = new PVector(0, 0);
    dir = new PVector(0.1, 0);
  }

  void show() {
    pushMatrix();
    translate(loc.x, loc.y);
    rotate(dir.heading());
    drawShip();
    popMatrix();
  }
  void drawShip() {
    fill(lightPurple);
    stroke(purple);
    strokeWeight(2);
    triangle(-5, -15, -5, 15, 20, 0);
    line(-5, -15, 5, -15);
    line(-5, 15, 5, 15);
    strokeWeight(1);
    line(0, -12, 0, 12);
    strokeWeight(2);
    triangle(-10, -10, -10, 10, 30, 0);
    strokeWeight(1);
    line(-6, -8, -6, 8);
    line(-6, 0, 30, 0);
    circle(15, 0, 5);
  }


  void act() {
    move();
    shoot();
    checkForCollisions();
  }
  void move() {
    loc.add(vel);
    if (wKey) vel.add(dir);

    if (aKey) dir.rotate(-radians(3));
    if (dKey) dir.rotate(radians(3));
  }
  void shoot() {
  }
  void checkForCollisions() {
    if (loc.x > width) {
      loc.x = 0;
    }
    if (loc.x < 0) {
      loc.x = width;
    }
    if (loc.y > height) {
      loc.y = 0;
    }
    if (loc.y < 0) {
      loc.y = height;
    }
  }
}
