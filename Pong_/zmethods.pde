void drawGradientRect(float cx, float cy, float w, float h, color c1, color c2) {
  noStroke();
  float x = cx - w / 2.0;  //math !! to make center top left
  float y = cy - h / 2.0;
  for (int i = 0; i < h; i++) {
    float t = map(i, 0, h, 0, 1);
    color c = lerpColor(c1, c2, t);
    stroke(c);
    line(x, y + i, x + w, y + i);
  }
}

void tactileRect(int x, int y, int w, int h) {
  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
    fill(255, 255, 0);
  } else {
    fill(255);
  }
  stroke(0);
  strokeWeight(5);
  rect(x, y, w, h);
}

void paddleCollision() {
  if (dist(leftx, lefty, ballx, bally) <= leftd/2 + balld/2+5) {
    vx = (ballx - leftx) / 5;
    vy = (bally - lefty) / 5;

    score.rewind();
    score.play();
    random = color(int(random(1, 255)), int(random(1, 255)), int(random(1, 255)), int(random(100, 155)));
  }
  if (dist(rightx, righty, ballx, bally) <= rightd/2 + balld/2+5) {
    vx = (ballx - rightx) / 5;
    vy = (bally - righty) / 5;

    score.rewind();
    score.play();
    random = color(int(random(1, 255)), int(random(1, 255)), int(random(1, 255)), int(random(150, 255)));
  }
}
void wallBounce() {
  if (bally - balld/2 <= 0) {
    bally = balld/2;
    vy = abs(vy);
    random = color(int(random(1, 255)), int(random(1, 255)), int(random(1, 255)), int(random(150, 255)));
  }
  if (bally + balld/2 >= height) {
    bally = height - balld/2;
    vy = -abs(vy);
    random = color(int(random(1, 255)), int(random(1, 255)), int(random(1, 255)), int(random(150, 255)));
  }
  if (!waitingReset) {
    if (ballx - balld/2 < 0-balld/2) {
      rightScore++;
      showSignal();
      waitingReset = true;
      resetTimer = 180;
      vx = 0;
      vy = 0;
      hit.rewind();
      hit.play();
    }
    if (ballx + balld/2 > width+balld/2) {
      leftScore++;
      showSignal();
      waitingReset = true;
      resetTimer = 180;
      vx = 0;
      vy = 0;
      if (twoPlayer) {
        hit.rewind();
        hit.play();
      }
      if (!twoPlayer) {
        score.rewind();
        score.play();
      }
    }
  }
}

void resetBall() {
  lefty=righty=height/2;
  ballx = width/2;
  bally = height/2;
  if (random(-1, 1) > 0) {
    vx = 5;
  } else {
    vx = -5;
  }
  vy = random(-5, 5);
  random = color(int(random(1, 255)), int(random(1, 255)), int(random(1, 255)), int(random(150, 255)));
}
void showSignal() {
  signalTimer = 255; // trigger it
}

void drawSignal() {
  if (signalTimer > 0) {
    textSize(100);
    fill(255, signalTimer);
    text("SCORE!", width/2, height/2);
    signalTimer -= 3;
  }
}
void resetEverything() {
  leftScore = 0;
  rightScore = 0;
  waitingReset = false;
  resetTimer = 0;
  signalTimer = 0;
  ballx = width/2;
  bally = height/2;
  vx = 5;
  vy = 3;
  lefty = height/2;
  righty = height/2;
  theme.rewind();
  score.rewind();
  gameover.rewind();
}
