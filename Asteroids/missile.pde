class Missile extends GameObject {

  int timer;
  Missile(float x,float y,float targetX, float targetY) {

    
    super(new PVector(x,y), new PVector(targetX,targetY)); 

    vel.setMag(10);
    timer = 67;
    d = 20;
  }
  

  void show() {
    drawMissile();
  }

  void act() {
    loc.add(vel);
    wrapAround();
    timer--;
    if (timer == 0) lives = 0;
  }
  void drawMissile(){
    fill(black);
    stroke(white);
    strokeWeight(2);
    circle(loc.x, loc.y, d);
  }
}
