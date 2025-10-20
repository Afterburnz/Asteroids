class Bullet extends GameObject {

  int timer;
 boolean enemy;
  Bullet() {

    super(player1.loc.copy(), player1.dir.copy());
    vel.setMag(10);
    timer = 120;
    d = 5;
  }

  Bullet(float lx, float ly, float vx, float vy, boolean enemyBullet) {
    super(lx, ly, vx, vy);
    vel = new PVector(player1.loc.x - loc.x, player1.loc.y - loc.y);
    vel.setMag(10);
    vel.add(player1.vel);
    timer = 120;
    d = 5;
    enemy = enemyBullet;
  }

  void show() {
    fill(black);
    stroke(white);
    strokeWeight(2);
    circle(loc.x, loc.y, d);
  }

  void act() {
    loc.add(vel);
    wrapAround();
    timer--;
    if (timer == 0) lives = 0;
  }
}
