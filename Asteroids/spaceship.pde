class Spaceship extends GameObject {
  int shield = 0;
  PVector dir; //direction
  int cooldown;
  int missileCooldown;

  Spaceship() {
    super(width/2, height/2, 0, 0);
    dir = new PVector(0.4, 0);
    cooldown = 0;
    missileCooldown = 0;
  }

  void show() {
    pushMatrix();
    translate(loc.x, loc.y);
    rotate(dir.heading());
    drawShip();
    popMatrix();
  }
  void drawShip() {
    int c = 0;
    int c2= 0;

    while (c<5) {
      objects.add(new Particle(player1.loc.x-5, player1.loc.y, 0, 0, 5, 30));
      c++;
    }
    while (c2<5) {
      objects.add(new Particle(player1.loc.x+5, player1.loc.y, 0, 0, 5, 30));
      c2++;
    }

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
    if (shield < 0) checkForCollisions();
    else {
      shield --;
      fill(lightBlue);
      stroke(blue);
      circle(loc.x, loc.y, 2 * shield/3);
    }
    wrapAround();
    tpTimer --;
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
    cooldown --;
    missileCooldown --;
    if (spacekey && cooldown <= 0) {
      objects.add(new Bullet() );
      cooldown = 15;
    }
    if (zeroKey && missileCooldown <=0) {
      shootMissile();
      missileCooldown =167;
    }
  }
  void checkForCollisions() {
    int i = 0;
    while (i < objects.size()) {
      GameObject obj = objects.get(i);
      if (obj instanceof Asteroid) {
        if (dist(loc.x, loc.y, obj.loc.x, obj.loc.y)< 5 + obj.d/2) {
          shield =120;
          player1.lives --;
        }
      }
      if (obj instanceof Ufo) {
        if (dist(loc.x, loc.y, obj.loc.x, obj.loc.y)< 5 + obj.d/2) {
          shield =120;
          player1.lives --;
        }
      }
      if (obj instanceof Bullet && ((Bullet) obj).enemy == true) {
        if (dist(loc.x, loc.y, obj.loc.x, obj.loc.y)< 7.5+obj.d/2) {
          shield =120;
          player1.lives --;
        }
      }
      i++;
    }
  }

  void teleport() {
    int t =0;
    boolean found = true;
    while (found == true && t<100) {
      int i = 0;

      found = false;
      while (i < objects.size()) {
        GameObject obj = objects.get(i);


        player1.loc.x = random(width);
        player1.loc.y = random(height);
        if (obj instanceof Asteroid) {
          if (dist(loc.x, loc.y, obj.loc.x, obj.loc.y)< 5 + obj.d/2) {
            player1.loc.x = random(width);
            player1.loc.y = random(height);
            found = true;
          }
        }
        if (obj instanceof Ufo) {
          if (dist(loc.x, loc.y, obj.loc.x, obj.loc.y)< 5 + obj.d/2) {
            player1.loc.x = random(width);
            player1.loc.y = random(height);
            found = true;
          }
        }
        if (obj instanceof Bullet && ((Bullet) obj).enemy == true) {
          if (dist(loc.x, loc.y, obj.loc.x, obj.loc.y)< 10+obj.d/2) {
            player1.loc.x = random(width);
            player1.loc.y = random(height);
            found = true;
          }
        }
        
        i++;
        t++;
      }
    }
  }
  void shootMissile() {
    int i=0;
    float closest = 10000000;
    GameObject closestObject = player1;
    while (i<objects.size()) {
      GameObject obj = objects.get(i);
      if (obj instanceof Asteroid ||obj instanceof Ufo) {
        if (dist(loc.x, loc.y, obj.loc.x, obj.loc.y) <= closest) {
          closest = dist(loc.x, loc.y, obj.loc.x, obj.loc.y);
          closestObject = obj;
        }
      }
      i++;
    }
    objects.add(new Missile(loc.x, loc.y, closestObject.loc.x - loc.x, closestObject.loc.y - loc.y));
  }
}
