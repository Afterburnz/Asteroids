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
  myButtons[0] = new Button("Press to start", 500, 500, 600, 300, lightRed, blue);
  myButtons[1] = new Button("Press to replay", 500, 500, 600, 300, lightRed, blue);
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
  if (myButtons[0].clicked && mode ==0) mode =1;
  if (myButtons[1].clicked && mode ==3 || mode==4) mode =1;
  click();
}
