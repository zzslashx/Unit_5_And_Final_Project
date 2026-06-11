void gameover() {

  if (redScore==0) {
    drawGradientRect(width/2, height/2, width, height, brightRed, darkRed);
    textWithOutline("RED WINS", width/2, height/2-50, 255, brightRed, 100);
  }
  if (blueScore==0) {
    drawGradientRect(width/2, height/2, width, height, cyan, coolBlue);
    textWithOutline("BLUE WINS", width/2, height/2-50, 255, cyan, 100);
  }
  textWithOutline(">Click to play again", width/2, height/2 + 100, gold, 255, 25);
}

void gameoverClicks() {
  mode=INTRO;
  resetForNextPlayer();
}
