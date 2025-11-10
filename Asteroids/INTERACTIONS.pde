



void keyPressed() {
  if (key == 'w') wKey = true;
  if (key == 's') sKey = true;
  if (key == 'd') dKey = true;
  if (key == 'a') aKey = true;
  if (key == ' ') spacekey = true;
  if (key == '0') zeroKey = true;
}
void keyReleased() {
  if (key == 'w') wKey = false;
  if (key == 's') sKey = false;
  if (key == 'd') dKey = false;
  if (key == 'a') aKey = false;
  if (key == ' ') spacekey = false;
  if ( key=='0') zeroKey = false;
  if (key == 'p') mode = 2;
  if (key == 'e' && tpTimer <= 0) {
    tpTimer = 600;
    player1.teleport();
  }
}

void click() {
  mouseReleased = false;
  if (mousePressed) wasPressed = true;
  if (wasPressed && !mousePressed) {
    mouseReleased = true;
    wasPressed = false;
  }
}
