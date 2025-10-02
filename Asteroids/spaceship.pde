class Spaceship {
  PVector loc; //location
  PVector vel; //velocity
  PVector dir; //direction
  
  
  Spaceship() {
    loc = new PVector(width/2, height/2);
    vel = new PVector(0,0);
    dir = new PVector(1,0);
  }
  
  void show(){
     pushMatrix();
     translate(loc.x,loc.y);
     drawShip();
     popMatrix();
  }
  void drawShip(){
    fill(black);
    stroke(white);
    strokeWeight(2);
    triangle(-10,-10,-10,10,30,0);
    circle(15,0,5);
  }
  
  
  void act(){
    move();
    shoot();
    checkForCollisions();
  }
  void move(){
  }
  void shoot(){
  }
  void checkForCollisions(){
  }
}
