class Particle extends GameObject {
  int timer;
  int dia;

  int [] red = new int[7];
  int [] green = new int[7];
  int [] blue = new int[7];
  int rCount = 0;
  int gCount = 0;
  int bCount = 0;
  Particle(float x, float y, int d, int time) {
    super(new PVector(x, y), new PVector(random(3, -3), random(3, -3)));
    dia = d;
    lives = 1;
    timer = time;
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
    noStroke();
    int i = 0;
   
    fill(red[i], green[i], blue[i],map(timer,0,120,0,255));
    i++;
    circle(loc.x,loc.y,d);
  }
}
