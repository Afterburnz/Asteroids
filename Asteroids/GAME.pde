void game(){
  background(black);
  player1.show();
  player1.act();
  
  int i =0;
  while (i < bullets.size()) {
    Bullet currentBullet = bullets.get(i);
    currentBullet.act();
    currentBullet.show();
    i++;
  }
  
}

void gameClicks(){
  
}
