void game() {
 background(0);
  image(starry[f],0,height/2,width,height);
  if(frameCount%1==0)f++; 
  if(f==starryFrames) f=0;

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
    if (dkey) paddleX+=10;
  }
  if (paddleX-paddleD/2>=3) {
    if (akey) paddleX -=10;
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
