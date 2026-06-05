void gameover() {
  fill(0);
  if (redScore==0) {
    drawGradientRect(width/2, height/2, width, height, brightRed, pink);
    textSize(50);
    text("RED WINS", width/2, height/2);
  }
  if (blueScore==0) {
    drawGradientRect(width/2, height/2, width, height, cyan, coolBlue);
    textSize(50);
    text("BLUE WINS", width/2, height/2);
  }
}

void gameoverClicks() {
  mode=INTRO;
  
}
