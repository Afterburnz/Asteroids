class Spaceship extends GameObject{

  PVector dir; //direction


  Spaceship() {
    super(width/2, height/2,0,0);
    dir = new PVector(0.4, 0);
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
    vel.setMag( vel.mag() * 0.967 );
    if (wKey) vel.add(dir);
    if (sKey) vel.sub(dir);
    

    if (aKey) dir.rotate(-radians(3));
    if (dKey) dir.rotate(radians(3));
  }
  void shoot() {
      if (spacekey) objects.add(new Bullet() );
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
