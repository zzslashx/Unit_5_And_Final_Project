void gameover() {

  if (redScore==0) {

    drawGradientRect(width/2, height/2, width, height, brightRed, darkRed);
    textWithOutline("RED WINS", width/2, height/2, 255, brightRed, 50);
  }
  if (blueScore==0) {
    drawGradientRect(width/2, height/2, width, height, cyan, coolBlue);
    textWithOutline("BLUE WINS", width/2, height/2, 255, cyan, 50);
  }
}

void gameoverClicks() {
  mode=INTRO;
}
