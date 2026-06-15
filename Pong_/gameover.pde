void gameover() {
  drawGradientRect(width/2, height/2, width, height, color(0, 20, 60), color(0, 80, 160));

  textSize(150);
  fill(255);
  if (twoPlayer) {
    if (leftScore > rightScore)
      text("LEFT WINS", width/2, height/2);
    if (rightScore>leftScore)
      text("RIGHT WINS", width/2, height/2);
  }
  if (!twoPlayer) {
    if (leftScore > rightScore)
      text("YOU WIN!", width/2, height/2);
    if (rightScore>leftScore)
      text("AI WINS!", width/2, height/2);
  }
  textSize(50);
  text("Click to continue", width/2, height/2+100);
}

void gameoverClicks() {
  mode=INTRO;
  gameover.rewind();
  gameover.pause();
  resetEverything();
}
