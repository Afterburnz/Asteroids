final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
final int GAMEOVER = 3;
int mode = 1;

boolean wKey, sKey, dKey, aKey;

Spaceship player1;

color black = #000000;
color white = #ffffff;
color purple = #a440de;
color lightPurple = #d285ff;
void setup(){
  size(1000,1000);
  textAlign(CENTER,CENTER);
  rectMode(CENTER);
  player1 = new Spaceship();
}

void draw(){
  if (mode==INTRO) {
    intro();
  } else if (mode==GAME) {
    game();
  } else if (mode ==PAUSE) {
    pause();
  } else {
    endscreen();
  }
}
  
