void game() {
  score++;
  fill(0,50);
  rect(0,0,width,height);
  textSize(25);
  fill(255);
  text("Lives: " + lives, 50,50);
  text("Score: " + score, width-100,50);
  text("Level: " + int(score/1000 + 1), width/2, 50);
  //draw paddle
  fill(pink);
  stroke(255);
  strokeWeight(5);
  circle(paddleX, paddleY, paddleD);
  fill(0);
  noStroke();
  rect(paddleX-paddleD/2, paddleY-paddleD/2+(paddleD/4)*3, paddleD, paddleD/2);
  noStroke();
  
   //bricks falling
  for (int i=0; i<numBricks; i++) {
    myBricks[i].show();
    myBricks[i].act();
  }
  //move paddles
  if (paddleX+paddleD/2<=width-3) {
    if (dkey) paddleX+=7;
  }
  if (paddleX-paddleD/2>=3) {
    if (akey) paddleX -=7;
  }
  
  if(lives<=0) mode=GAMEOVER;
}

void gameClicks() {
  mode=PAUSE;
}
