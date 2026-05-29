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
  if (dist(paddleX, paddleY, ballx, bally) <= paddleD/2 + balld/2) {
    vx = (ballx - paddleX) / 5;
    vy = (bally - paddleY) / 5;
  }
}


void wallBounce() {
  if (bally - balld/2 <= 0) {
    bally = balld/2;
    vy = abs(vy);
  }
  if (bally + balld/2 >= height) {
    lives--;
    bally=height/2+150;
    ballx=width/2;
    vy=2;
    vx=0;
    hit.rewind();
    hit.play();
    paddleX=width/2;
  }

  if (ballx - balld/2 < 0) {
    ballx = balld/2;
    vx=abs(vx);
  }
  if (ballx + balld/2 > width) {
    ballx=width-balld/2;
    vx=-abs(vx);
  }
}

void manageBrick(int i) {

  if (brickY[i] ==100) fill(blue1);
  if (brickY[i]==175) fill(blue2);
  if (brickY[i] ==250) fill(blue3);
  if (brickY[i]==325) fill(blue4);
  if (brickY[i]==400) fill(blue5);
  circle(brickX[i], brickY[i], brickD);

  if (dist(brickX[i], brickY[i], ballx, bally) <= brickD/2 + balld/2) { //brick collisions
    vx = (ballx - brickX[i]) / 3;
    vy = (bally - brickY[i]) / 3;
    alive[i]=false;
    crack.rewind();
    crack.play();
    score++;
  }
}
