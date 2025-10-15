



void keyPressed() {
  if (key == 'w') wKey = true;
  if (key == 's') sKey = true;
  if (key == 'd') dKey = true;
  if (key == 'a') aKey = true;
  if (key == ' ') spacekey = true;
}
void keyReleased() {
  if (key == 'w') wKey = false;
  if (key == 's') sKey = false;
  if (key == 'd') dKey = false;
  if (key == 'a') aKey = false;
  if (key == ' ') spacekey = false;
  if (keyCode == ENTER && mode ==0) mode =1;
}
