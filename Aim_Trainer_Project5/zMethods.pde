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
void displayTarget(int x, int y) {
  //draws the target to press
  // outermost ring
  if (typeOfTarget == 1) {
    stroke(0);
    strokeWeight(3);
    fill(255, 255, 255);
    circle(x, y, d);
    noStroke();
    // second ring
    fill(255, 0, 0);
    circle(x, y, d * 0.75);
    // third ring
    fill(255, 255, 255);
    circle(x, y, d * 0.5);
    // bullseye
    fill(255, 0, 0);
    circle(x, y, d * 0.25);
  } else if (typeOfTarget ==2)
    image(tomato, width/2-50+0.1, height-100+0.1, d, d);
  else if (typeOfTarget ==3)
    image(pizza, width/2-50, height-100, d, d);
}
void displayTarget67(int x, int y, int d) {
  //draws the target to press
  // outermost ring
  stroke(0);
  strokeWeight(3);
  fill(255, 255, 255);
  circle(x, y, d);
  noStroke();
  // second ring
  fill(255, 0, 0);
  circle(x, y, d * 0.75);
  // third ring
  fill(255, 255, 255);
  circle(x, y, d * 0.5);
  // bullseye
  fill(255, 0, 0);
  circle(x, y, d * 0.25);
}


void displayTarget1() {
  timer1--;
  if (timer1 <= 0) {
    lives--;
    bump.rewind();
    bump.play();
    x = random(d/2, width-d/2);
    y = random(d/2, height-d/2);
    timer1 = 180;
  }
  // draw timer ring to show time left
  stroke(255, 0, 0);
  strokeWeight(5);
  noFill();
  arc(x, y, d + 20, d + 20, -HALF_PI, -HALF_PI + TWO_PI * (timer1/180.0));

  if (typeOfTarget == 1) {
    stroke(0);
    strokeWeight(3);
    fill(255, 255, 255);
    circle(x, y, d);
    noStroke();
    // second ring
    fill(255, 0, 0);
    circle(x, y, d * 0.75);
    // third ring
    fill(255, 255, 255);
    circle(x, y, d * 0.5);
    // bullseye
    fill(255, 0, 0);
    circle(x, y, d * 0.25);
  } else if (typeOfTarget == 2) {
    image(tomato, x, y, d, d);
  } else if (typeOfTarget == 3) {
    image(pizza, x, y, d, d);
  }
}

void displayTarget2() {
  timer2--;
  if (timer2 <= 0) {
    lives--;
    bump.rewind();
    bump.play();
    x1 = random(d1/2, width-d1/2);
    y1 = random(d1/2, height-d1/2);
    timer2 = 180;
  }
  // draw timer ring to show time left
  stroke(255, 0, 0);
  strokeWeight(5);
  noFill();
  arc(x1, y1, d1 + 20, d1 + 20, -HALF_PI, -HALF_PI + TWO_PI * (timer2/180.0));
  if (typeOfTarget==1) {
    stroke(0);
    strokeWeight(3);
    fill(255, 255, 255);
    circle(x1, y1, d1);
    noStroke();
    fill(255, 0, 0);
    circle(x1, y1, d1 * 0.75);
    fill(255, 255, 255);
    circle(x1, y1, d1 * 0.5);
    fill(255, 0, 0);
    circle(x1, y1, d1 * 0.25);
  } else if (typeOfTarget ==2) {
    image(tomato, x1, y1, d1, d1);
  } else if (typeOfTarget ==3) {
    image(pizza, x1, y1, d1, d1);
  }
}

void displayTarget3() {
  timer3--;
  if (timer3 <= 0) {
    lives--;
    bump.rewind();
    bump.play();
    x2 = random(d2/2, width-d2/2);
    y2 = random(d2/2, height-d2/2);
    timer3 = 180;
  }
  // draw timer ring to show time left
  stroke(255, 0, 0);
  strokeWeight(5);
  noFill();
  arc(x2, y2, d2 + 20, d2 + 20, -HALF_PI, -HALF_PI + TWO_PI * (timer3/180.0));
  if (typeOfTarget ==1) {
    stroke(0);
    strokeWeight(3);
    fill(255, 255, 255);
    circle(x2, y2, d2);
    noStroke();
    fill(255, 0, 0);
    circle(x2, y2, d2 * 0.75);
    fill(255, 255, 255);
    circle(x2, y2, d2 * 0.5);
    fill(255, 0, 0);
    circle(x2, y2, d2 * 0.25);
  } else if (typeOfTarget ==2) {
    image(tomato, x2, y2, d2, d2);
  } else if (typeOfTarget ==3) {
    image(pizza, x2, y2, d2, d2);
  }
}
void drawPopup() {
  if (popupTimer > 0) {
    textSize(55);
    textAlign(CENTER, CENTER);
    fill(255, 255, 255, popupTimer * 3); // fades out
    text("+" + (int)popupValue, popupX, popupY - (50 - popupTimer)); // floats up
    popupTimer--;
  }
}
void resetVariables() {
  theme.rewind();
  gameover.rewind();
  bull=0;
  mid=0;
  out=0;
  lives=3;
  timer1=180;
  timer2=180;
  timer3=180;
  total=0;
}

void randomizeTargets() {
  d = 100;
  x = random(d/2, width-d/2);
  y = random(d/2, height-d/2);

  d1 = 100;
  x1 = random(d1/2, width-d1/2);
  y1 = random(d1/2, height-d1/2);

  d2 = 100;  // make sure d2 exists as a variable!
  x2 = random(d2/2, width-d2/2);
  y2 = random(d2/2, height-d2/2);
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
