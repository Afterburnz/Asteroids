
void winscreen() {
  background(black);
  noStroke();

  float lx = 0;
  float ly=0;
  float lr=0;
  float lb=0;
  while(lb<=255){
    stroke(lr,0,lb);
    line(lx,ly,width,ly);
    ly+=3;
    lr+=0.5;
    lb+=0.75;
  }  
  
  
  
  fill(white);
  textAlign(CENTER);
  textSize(250);
  text("GG", 500, 250);
  if (myButtons[1].clicked && mode ==4) {
    mode =0;
    commence();
  }
  myButtons[1].show();
}
