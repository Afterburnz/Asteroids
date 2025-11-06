class Particle extends GameObject {
  int timer = 120;
  int dia;

  int rCount = 0;
  int gCount = 0;
  int bCount = 0;

  Particle(float x, float y, int d, int time) {
    super(new PVector(x, y), new PVector(random(-3, 3), random(-3, 3)));
    dia = d;
    lives = 1;
    timer = time;
    rCount = int(random(0, 255));
    gCount =  int(random(0, 255));
    bCount =  int(random(0, 255));
  }
  Particle(float lx, float ly, float vx, float vy, int d, int time) {
    super(lx, ly, vx, vy);
    dia = d;
    lives = 1;
    timer = time;
  }
  void show() {
    drawParticle();
  }
  void act() {
    move();
    timer --;
    if (timer <=0) lives = 0;
  }
  void move() {
    loc.x = loc.x + vel.x;
    loc.y = loc.y + vel.y;
  }

  void drawParticle() {
    noStroke();
    fill(rCount, gCount, bCount, map(timer, 0, 120, 0, 255));
    circle(loc.x, loc.y, dia);

    fill(purple, map(timer, 0, 120, 0, 255));
    circle(loc.x, loc.y, dia);
  }
}
