void game() {

  //background
  drawGradientRect(width/2, height/2, width, height, #BA8C63, #9D6C3C);

  for (int i=50; i<width-50; i+=100) {
    for (int j=0; j<height+100; j+=150) {
      fill(#855E42, 25);
      noStroke();
      rect(i, j, 50, 200);
    }
  }

  //dart board
  pushMatrix();
  scale(0.7);
  translate(width/4, height/6);
  drawDartBoard();
  popMatrix();
  //selector dot
  fill(0, 150);
  noStroke();
  circle(sX, sY, 25);
  strokeWeight(20);
  //selector dot line indicator
  // X axis line
  if (xSelected == false) {
    stroke(#372E37);
  } else {
    stroke(255, 50);
  }
  line(178, 600, 609, 600);
  // Y axis line
  if (xSelected == false) {
    stroke(255, 50);
  } else {
    stroke(#372E37);
  }
  line(80, 117, 80, 549);
  stroke(255);
  strokeWeight(4);
  // center tick marks
  line(394, 590, 394, 610);
  line(69, 333, 91, 333);
  strokeWeight(6.7);
  // moving tick marks
  line(sX, 590, sX, 610);
  line(69, sY, 91, sY);


  if (popAlpha > 0) {
    popAlpha -= 2;
    textSize(36);
    if (overScore) fill(150, popAlpha);         
    else if (player2) fill(brightRed, popAlpha);
    else fill(cyan, popAlpha);
    if (popMultiplier == 1) {
      text(popPoints, popX, popY);
    } else {
      text(popPoints + " x" + popMultiplier + " = " + (popPoints*popMultiplier), popX, popY);
    }
  }
  //score
  textSize(20);
  fill(cyan);
  text("Blue: " + blueScore, width/4*3, height-100);
  fill(brightRed);
  text("Red: " + redScore, width/4*3, height-80);

  if (xSelected == false) {
    sX += vx;
    if (sX + 12 > 609 || sX - 12 < 178) vx = -vx;
  } else if (ySelected == false) {
    sY += vy;
    if (sY + 12 > 549 || sY - 12 < 117) vy = -vy;
  }
  if (pauseFrame > 0 && frameCount >= pauseFrame) {
    pauseFrame = -1;
    resetForNextPlayer();
  }


  if (xSelected==true && ySelected==true && hasScored==false) {
    int points=0;
    hasScored = true;
    float d = dist(394, 332, sX, sY);
    println("d: " + d + " wedge: " + getWedgeScore(sX, sY));
    int basePoints = 0;
    int multiplier = 1;
    if (d >= 92 && d <= 106) multiplier = 3;
    else if (d >= 166 && d <= 184) multiplier = 2;
    if (d > 190) basePoints = 0;
    else if (d <= 8) basePoints = 50;
    else if (d <= 20) basePoints = 25;
    else basePoints = getWedgeScore(sX, sY);
    points = basePoints * multiplier;
    // popup text
    if (d > 200) {
      popPoints = 0;
      popMultiplier = 1;
    } else if (d <= 8) {
      popPoints = 50;
      popMultiplier = 1;
    } else if (d <= 20) {
      popPoints = 25;
      popMultiplier = 1;
    } else {
      popPoints = basePoints;
      popMultiplier = multiplier;
    }
    popX = sX;
    popY = sY;
    popAlpha = 255;
    overScore = false;
    if (player2) redScore -= points;
    if (!player2) blueScore -= points;
    if (redScore < 0) {
      redScore += points;
      overScore = true;
    }
    if (blueScore < 0) {
      blueScore += points;
      overScore = true;
    }
    if (blueScore == 0) mode = GAMEOVER;
    if (redScore == 0) mode = GAMEOVER;
  }
}


void gameClicks() {
  println(mouseX, mouseY);
  if (xSelected == false) {
    xSelected = true;
    vx = 0;
    vy = ballSpeed;
  } else if (ySelected == false) {
    ySelected = true;
    vy = 0;
    pauseFrame = frameCount + 120;
  }
}
