class Bullet extends GameObject{

  
  
  Bullet() {
  
    super(player1.loc.copy(), player1.dir.copy());
    vel.setMag(10);
  }
  
  void show(){
    fill(black);
    stroke(white);
    strokeWeight(2);
    circle(loc.x,loc.y,5);
  }
  
  void act(){
    loc.add(vel);
  }
  
  
}
