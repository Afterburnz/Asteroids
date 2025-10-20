class GameObject {
  PVector loc;
  PVector vel;
  int lives;
  float d;
  
  GameObject(float lx, float ly, float vx, float vy) {
    loc = new PVector(lx, ly);
    vel = new PVector(vx, vy);
    lives = 3;
  }

  GameObject(PVector l, PVector v) {
    loc = l;
    vel = v;
    lives =1;
  }

  void act () {
  }

  void show() {
  }

  void wrapAround() {
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
  void astWrapAround() {
    if (loc.x > width+75) {
      loc.x = -75;
    }
    if (loc.x < -75) {
      loc.x = width+75;
    }
    if (loc.y > height+75) {
      loc.y = -75;
    }
    if (loc.y < -75) {
      loc.y = height+75;
    }
  }  
}
