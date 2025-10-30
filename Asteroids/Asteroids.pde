//make ship particles behind ship
//add design (menu screen/asteroids)
//some new features if time

import java.util.ArrayList;
Button [] myButtons;
int score = 0;
final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
final int ENDSCREEN = 3;
final int WINSCREEN = 4;
int mode = 0;

boolean wKey, sKey, dKey, aKey, spacekey;
int tpTimer = 0;
Spaceship player1;

ArrayList <GameObject> objects;

color black = #000000;
color white = #ffffff;
color purple = #a440de;
color lightPurple = #d285ff;
color lightBlue = #388eff;
color blue = #024bab;
color orange = #ff9500;
color pink = #ff4dbe;
color lightRed = #ff3d4a;

int asteroidTimer = 0;
int ufoTimer = 0;

boolean mouseReleased;
boolean wasPressed;
void setup() {
  size(1000, 1000);
  myButtons=new Button[6];
  myButtons[0] = new Button("Press to start", width/2, 850, 600, 300, lightRed, blue);
  myButtons[1] = new Button("Press to replay", 500, 500, 600, 300, lightRed, blue);
  myButtons[2] = new Button("Continue", 500, 700, 600, 300, blue, lightRed);
  textAlign(CENTER, CENTER);
  rectMode(CENTER);
  objects = new ArrayList();

  player1 = new Spaceship();
  objects.add(player1);

  PFont mono;
  mono = createFont("AMORIA.otf", 128);
  textFont(mono);
}

void draw() {
  if (mode==INTRO) {
    intro();
  } else if (mode==GAME) {
    game();
  } else if (mode ==PAUSE) {
    pause();
  } else if (mode==ENDSCREEN) {
    endscreen();
  } else {
    winscreen();
  }


  click();
}

void commence() {
  player1=new Spaceship();
  objects = new ArrayList();
  objects.add(player1);
  asteroidTimer = 0;
  ufoTimer = 0;
  score = 0;
  player1.lives = 3;
}
