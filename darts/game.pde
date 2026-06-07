void game() {

  //background
  drawGradientRect(width/2, height/2, width, height, #BA8C63, #9D6C3C);
  if (player2) {
    fill(cyan, 70);
    rect(0, 0, width, height);

    textWithOutline("BLUE'S TURN", width/2, 800, 255, cyan, 50);
  } else {
    fill(brightRed, 20);
    rect(0, 0, width, height);

    textWithOutline("RED'S TURN", width/2, 800, 255, brightRed, 50);
  }
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

  scoring(); //simplified very long code

  //score
  textSize(25);
  fill(cyan);
  textWithOutline("Blue: " + blueScore, 50, height-100,cyan,coolBlue,25);
  fill(brightRed);
  textWithOutline("Red: " + redScore, 50, height-75,brightRed,darkRed,25);
  

  if (xSelected == false) {
    sX += vx;
    if (sX + 12 > 609 || sX - 12 < 178) vx = -vx;
  } else if (ySelected == false) {
    sY += vy;
    if (sY + 12 > 549 || sY - 12 < 117) vy = -vy;
  }
  if (pauseFrame > 0 && frameCount >= pauseFrame && popAlpha<=0) {
    pauseFrame = -1;
    resetForNextPlayer();
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
