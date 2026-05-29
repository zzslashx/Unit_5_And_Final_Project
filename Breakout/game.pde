void game() {
  background(0);
  image(starry[f], 0, height/2, width, height);
  if (frameCount%1==0)f++;
  if (f==starryFrames) f=0;

  //score + lives

  textSize(25);

  fill(#DA9EF2);
  text("Lives: " + lives, 74, 50);
  text("Lives: " + lives, 76, 50);
  text("Lives: " + lives, 75, 49);
  text("Lives: " + lives, 75, 51);

  fill(255);
  text("Lives: " + lives, 75, 50);

  fill(#DA9EF2);
  text("Score: " + score, width-76, 50);
  text("Score: " + score, width-74, 50);
  text("Score: " + score, width-75, 49);
  text("Score: " + score, width-75, 51);

  fill(255);
  text("Score: " + score, width-75, 50);
  fill(#DA9EF2);

  text("Number of hits: " + numOfHits, width/2-1, 50);
  text("Number of hits: " + numOfHits, width/2+1, 50);
  text("Number of hits: " + numOfHits, width/2, 49);
  text("Number of hits: " + numOfHits, width/2, 51);
  fill(255);
  text("Number of hits: " + numOfHits, width/2, 50);


  fill(#DA9EF2);
  text("Number of Bricks Left: " + numOfBricksLeft, width/2-1, 25);
  text("Number of Bricks Left: " + numOfBricksLeft, width/2+1, 25);
  text("Number of Bricks Left: " + numOfBricksLeft, width/2, 24);
  text("Number of Bricks Left: " + numOfBricksLeft, width/2, 26);
  fill(255);
  text("Number of Bricks Left: " + numOfBricksLeft, width/2, 25);

  //balls
  noStroke();
  fill(255);
  circle(ballx, bally, balld);
  ballx+=vx;
  bally+=vy;

  //collisions
  wallBounce();
  paddleCollision();

  //draw paddle
  fill(pink);
  stroke(255);
  strokeWeight(5);
  circle(paddleX, paddleY, paddleD);
  noStroke();

  //move paddles
  if (paddleX+paddleD/2<=width-3) {
    if (dkey) paddleX+=13;
  }
  if (paddleX-paddleD/2>=3) {
    if (akey) paddleX -=13;
  }
  //bricks
  int i=0;
  while (i<n) {
    if (alive[i]) {
      manageBrick(i);
    } else {
    }
    i++;
  }

  if (score ==n ) mode = GAMEOVER;
  if (lives ==0) mode =GAMEOVER;
}


void gameClicks() {
  mode = PAUSE;
}
