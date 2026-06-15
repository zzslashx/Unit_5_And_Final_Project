void game() {
  drawGradientRect(width/2, height/2, width, height, warmGreen, coolGreen);

  // hopeful ring
  stroke(255, 255, 255, 15);
  strokeWeight(67.7);
  noFill();
  circle(width/2, height/2, 700);



  // top
  for (int i = 0; i < width; i += 15) {
    fill(255, 25);
    line(width/2, height/2, i, 0);
  }
  // left
  for (int i = 0; i < height; i += 15) {
    line(width/2, height/2, 0, i);
  }
  // right
  for (int i = 0; i < height; i += 15) {
    line(width/2, height/2, width, i);
  }
  // bottom
  for (int i = 0; i < width; i += 15) {
    line(width/2, height/2, i, height);
  }

  fill(115, 162, 84, 55);
  noStroke();
  circle(width/2, height/2, 700);

  //riples
  for (int i=0; i<numRipples; i++) {
    noFill();
    strokeWeight(1.5);
    myRipples[i].show();
    myRipples[i].act();
  }
  //separating line
  stroke(0);
  strokeWeight(6);
  for (int i=0; i<height; i+=20) {
    line(width/2, i, width/2, i+10);
  }

  //timer before reset
  if (waitingReset) {
    textSize(50);
    fill(255);
    text(resetTimer/60, width/2, 100);
  }

  //scores
  fill(0);
  textSize(50);
  text(leftScore, width/4, height/4); //left
  text(rightScore, width/4*3, height/4);

  //when score
  drawSignal();
  if (waitingReset) {
    resetTimer--;
    if (resetTimer <= 0) {
      if (leftScore >= 3 || rightScore >= 3) {
        mode = GAMEOVER;
        gameover.play();
      } else {
        resetBall();
      }
      waitingReset = false;
    }
  }


  //balls
  stroke(0);
  strokeWeight(2);
  fill(random);
  circle(ballx, bally, balld);
  ballx+=vx;
  bally+=vy;

  //collisions
  wallBounce();
  paddleCollision();

  //draw paddles
  fill(255);

  circle(leftx, lefty, leftd);
  circle(rightx, righty, rightd);
  if (twoPlayer==true) {
    if (!waitingReset) {
      //move paddles
      if (lefty+leftd/2<=height-3) {
        if (skey) lefty+=9;
      }
      if (lefty-leftd/2>=3) {
        if (wkey) lefty -=9;
      }
      if (righty-rightd/2>=3) {
        if (upkey) righty-=9;
      }
      if (righty+rightd/2<=height-3) {
        if (downkey) righty+=9;
      }
    }
  }
  if (twoPlayer==false) {
    if (!waitingReset) {
      if (lefty+leftd/2<=height-3) {
        if (skey) lefty+=9;
      }
      if (lefty-leftd/2>=3) {
        if (wkey) lefty -=9;
      }
      if (righty < bally) righty += 8;
      if (righty > bally) righty -= 8;
    }
  }
}
void gameClicks() {
  mode = PAUSE;
}
