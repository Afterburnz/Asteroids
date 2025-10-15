import java.util.ArrayList;

int score = 0;
final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
final int ENDSCREEN = 3;
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

int asteroidTimer = 0;

void setup() {
  size(1000, 1000);
  textAlign(CENTER, CENTER);
  rectMode(CENTER);
  objects = new ArrayList();

  player1 = new Spaceship();
  objects.add(player1);




}

void draw() {
  println(objects.size());
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
