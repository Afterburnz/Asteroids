import java.util.ArrayList;

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

void setup() {
  size(1000, 1000);
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
  println(objects.size());
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
}
