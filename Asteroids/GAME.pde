void game() {
  background(black);

  if (asteroidTimer > 300) {
    objects.add(new Asteroid());
    asteroidTimer = 0;
  }
  asteroidTimer ++;
  int i =0;
  while (i < objects.size()) {
    GameObject currentObject = objects.get(i);
    currentObject.act();
    currentObject.show();
    if (currentObject.lives == 0)
      objects.remove(i);
    else

      i++;
  }
}

void gameClicks() {
}
