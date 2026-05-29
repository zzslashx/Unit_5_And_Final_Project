void gameover() {
  gameover.play();
  theme.rewind();
  theme.pause();

  //drawGradientRect(width/2, height/2, width, height, color(0, 20, 60), color(0, 80, 160));
  image(starry[f], 0, 0, width, height);
  if (frameCount%1==0)f++;
  if (f==starryFrames) f=0;
  textSize(100);
  fill(255);
  if (lives==0) {
    fill(#DA9EF2);
    text("YOU LOSE!", width/2-1, height/2-130);
    text("YOU LOSE!", width/2+1, height/2-130);
    text("YOU LOSE!", width/2, height/2-131);
    text("YOU LOSE!", width/2, height/2-129);
    fill(255);
    text("YOU LOSE!", width/2, height/2-130);
  } else {
    fill(#DA9EF2);
    text("YOU WIN!", width/2-1, height/2-130);
    text("YOU WIN!", width/2+1, height/2-130);
    text("YOU WIN!", width/2, height/2-131);
    text("YOU WIN!", width/2, height/2-129);
    fill(255);
    text("YOU WIN!", width/2, height/2-130);
    textSize(25);
    fill(#DA9EF2);
    text("You beat the game in: " + numOfHits + " hits!", width/2-1, height/2-60);
    text("You beat the game in: " + numOfHits + " hits!", width/2+1, height/2-60);
    text("You beat the game in: " + numOfHits + " hits!", width/2, height/2-61);
    text("You beat the game in: " + numOfHits + " hits!", width/2, height/2-59);
    fill(255);
    text("You beat the game in: " + numOfHits + " hits!", width/2, height/2-60);
  }
  textSize(35);
  fill(#DA9EF2);
  text("<click to continue>", width/2-1, height/2+100);
  text("<click to continue>", width/2+1, height/2+100);
  text("<click to continue>", width/2, height/2+99);
  text("<click to continue>", width/2, height/2+101);
  fill(255);
  text("<click to continue>", width/2, height/2+100);
}

void gameoverClicks() {
  mode=INTRO;
  score =0;
  lives = 3;
  for (int i =0; i<n; i++) {
    alive[i]=true;
  }
  theme.rewind();
  gameover.rewind();
  gameover.pause();
  theme.play();
  ballx = width/2;
  bally = height/2+150;
  numOfHits=0;
  numOfBricksLeft=n;
  paddleX=width/2;
}
