void game() {

  //visuals
  drawGradientRect(width/2, height/2, width, height, color(0, 20, 60), color(0, 80, 160));
  for (int i = width; i >= 10; i -= 10) {
    strokeWeight(2);
    line(0, i, i, 0);
    line(width, i, i, 0);
    line(0, i, i, height);
    line(width, i, i, height);
  }
  //ripples
  for (int i = 0; i < 5; i++) {
    myRipples[i].show();
    myRipples[i].act();
  }
  //trail
  trail[trailIndex] = new Trail(mouseX, mouseY);
  trailIndex = (trailIndex + 1) % trail.length;
  for (int i = 0; i < trail.length; i++) {
    trail[i].show();
    trail[i].act();
  }

  //pause button
  stroke(0);
  fill(255);
  circle(width-100, 100, 90);
  //2 lines signalling its pause button
  if (mode==GAME) {
    strokeWeight(8);
    line(width-110, 90, width-110, 110);
    line(width-85, 90, width-85, 110);
  }
  if (mode==PAUSE) {
    fill(0);
    triangle(width-115, 70, width-115, 130, width-70, 100);
  }
  total= bull*3+mid*2+out;
  //score + lives
  textSize(25);
  text("BUllSEYE (3 points): " + bull, 150, 100);
  text("Inner Rings (2 points): " + mid, 150, 125);
  text("Outer Rings (1 point): " + out, 150, 150);
  text("total points: " + total, 150, 175);
  text("Lives: " + lives, 150, 200);

  displayTarget1();
  displayTarget2();
  displayTarget3();
  if (lives <= 0) {
    total = bull*3 + mid*2 + out;
    if (lives <= 0) {
      total = bull*3 + mid*2 + out;
      if (total > highscore) {
        highscore = total;
        newHighScore = true;
      } else {
        newHighScore = false;
      }
      gameover.rewind();
      gameover.play();
      theme.pause();
      resetVariables();
      mode = GAMEOVER;
    }
  }
  //move targets
  if (movingTarget) {
    x += tvx;
    y += tvy;
    if (x - d/2 <= 0 || x + d/2 >= width) tvx *= -1;
    if (y - d/2 <= 0 || y + d/2 >= height) tvy *= -1;

    x1 += tvx1;
    y1 += tvy1;
    if (x1 - d1/2 <= 0 || x1 + d1/2 >= width) tvx1 *= -1;
    if (y1 - d1/2 <= 0 || y1 + d1/2 >= height) tvy1 *= -1;

    x2 += tvx2;
    y2 += tvy2;
    if (x2 - d2/2 <= 0 || x2 + d2/2 >= width) tvx2 *= -1;
    if (y2 - d2/2 <= 0 || y2 + d2/2 >= height) tvy2 *= -1;
  }
}
void gameClicks() {
  boolean hit = false;

  // target 1
  if (dist(mouseX, mouseY, x, y) < d/8) {
    tvx *= 1.1;
    tvy *= 1.1;
    timer1=timerDuration;
    bull ++;
    popupValue = 3;
    hit = true;
    x = random(d/2, width-d/2);
    y = random(d/2, height-d/2);
  } else if (dist(mouseX, mouseY, x, y) < d/4) {
    tvx *= 1.1;
    tvy *= 1.1;
    timer1=timerDuration;
    mid ++;
    popupValue = 2;
    hit = true;
    x = random(d/2, width-d/2);
    y = random(d/2, height-d/2);
  } else if (dist(mouseX, mouseY, x, y) < d/2) {
    tvx *= 1.1;
    tvy *= 1.1;
    timer1=timerDuration;
    out ++;
    popupValue = 1;
    hit = true;
    x = random(d/2, width-d/2);
    y = random(d/2, height-d/2);
  }

  // target 2
  else if (dist(mouseX, mouseY, x1, y1) < d1/8) {
    tvx1 *= 1.1;
    tvy1 *= 1.1;
    timer2=timerDuration;
    bull ++;
    popupValue = 3;
    hit = true;
    x1 = random(d/2, width-d/2);
    y1 = random(d/2, height-d/2);
  } else if (dist(mouseX, mouseY, x1, y1) < d1/4) {
    tvx1 *= 1.1;
    tvy1 *= 1.1;
    timer2=timerDuration;
    mid ++;
    popupValue = 2;
    hit = true;
    x1 = random(d/2, width-d/2);
    y1 = random(d/2, height-d/2);
  } else if (dist(mouseX, mouseY, x1, y1) < d1/2) {
    tvx1 *= 1.1;
    tvy1 *= 1.1;
    timer2=timerDuration;
    out ++;
    popupValue = 1;
    hit = true;
    x1 = random(d/2, width-d/2);
    y1 = random(d/2, height-d/2);
  }

  // target 3
  else if (dist(mouseX, mouseY, x2, y2) < d2/8) {
    tvx2 *= 1.1;
    tvy2 *= 1.1;
    timer3=timerDuration;
    bull ++;
    popupValue = 3;
    hit = true;
    x2 = random(d/2, width-d/2);
    y2 = random(d/2, height-d/2);
  } else if (dist(mouseX, mouseY, x2, y2) < d2/4) {
    tvx2 *= 1.1;
    tvy2 *= 1.1;
    timer3=timerDuration;
    mid ++;
    popupValue = 2;
    hit = true;
    x2 = random(d/2, width-d/2);
    y2 = random(d/2, height-d/2);
  } else if (dist(mouseX, mouseY, x2, y2) < d2/2) {
    tvx2 *= 1.1;
    tvy2 *= 1.1;
    timer3=timerDuration;
    out ++;
    popupValue = 1;
    hit = true;
    x2 = random(d/2, width-d/2);
    y2 = random(d/2, height-d/2);
  }

  // popup and sound
  if (hit==true) {
    popupX = mouseX;
    popupY = mouseY;
    popupTimer = 50;
    coin.rewind();
    coin.play();
  } else if (dist(width-100, 100, mouseX, mouseY) < 45) {
    mode = PAUSE;
  } else {
    lives--;
    bump.rewind();
    bump.play();
  }
}
void mousePressed() {
  if (mode == GAME) {
    for (int i = 0; i < numRipples; i++) {
      myRipples[i].x = mouseX;
      myRipples[i].y = mouseY;
      myRipples[i].size = i * (1000 / numRipples);
    }
  }
}
