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
}
void gameClicks() {
  boolean hit = false;

  // target 1
  if (dist(mouseX, mouseY, x, y) < d/8) {
    timer1=180;
    bull ++;
    popupValue = 3;
    hit = true;
    x = random(d/2, width-d/2);
    y = random(d/2, height-d/2);
  } else if (dist(mouseX, mouseY, x, y) < d/4) {
    timer1=180;
    mid ++;
    popupValue = 2;
    hit = true;
    x = random(d/2, width-d/2);
    y = random(d/2, height-d/2);
  } else if (dist(mouseX, mouseY, x, y) < d/2) {
    timer1=180;
    out ++;
    popupValue = 1;
    hit = true;
    x = random(d/2, width-d/2);
    y = random(d/2, height-d/2);
  }

  // target 2
  else if (dist(mouseX, mouseY, x1, y1) < d1/8) {
    timer2=180;
    bull ++;
    popupValue = 3;
    hit = true;
    x1 = random(d/2, width-d/2);
    y1 = random(d/2, height-d/2);
  } else if (dist(mouseX, mouseY, x1, y1) < d1/4) {
    timer2=180;
    mid ++;
    popupValue = 2;
    hit = true;
    x1 = random(d/2, width-d/2);
    y1 = random(d/2, height-d/2);
  } else if (dist(mouseX, mouseY, x1, y1) < d1/2) {
    timer2=180;
    out ++;
    popupValue = 1;
    hit = true;
    x1 = random(d/2, width-d/2);
    y1 = random(d/2, height-d/2);
  }

  // target 3
  else if (dist(mouseX, mouseY, x2, y2) < d2/8) {
    timer3=180;
    bull ++;
    popupValue = 3;
    hit = true;
    x2 = random(d/2, width-d/2);
    y2 = random(d/2, height-d/2);
  } else if (dist(mouseX, mouseY, x2, y2) < d2/4) {
    timer3=180;
    mid ++;
    popupValue = 2;
    hit = true;
    x2 = random(d/2, width-d/2);
    y2 = random(d/2, height-d/2);
  } else if (dist(mouseX, mouseY, x2, y2) < d2/2) {
    timer3=180;
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
