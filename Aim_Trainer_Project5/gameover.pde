void gameover() {
  drawGradientRect(width/2, height/2, width, height, brightRed, brightOrange);
  textSize(100);
  fill(255);
  text("GAMEOVER :c", width/2, height/2 - 100);
  textSize(40);
  if (newHighScore) {
    text("New High Score: " + highscore, width/2, height/2);
  }
  fill(255);
  stroke(0);
  strokeWeight(3);
  rectMode(CORNER);
  rect(width/2-100, height/2-35 + 150, 200, 70);
  tactileRect(width/2-100, height/2-35 + 150, 200, 70);
  rectMode(CENTER);
  fill(0);
  textSize(35);

  text("PLAY AGAIN", width/2, height/2 + 150);
}

void gameoverClicks() {
  // play again button
  if (mouseX > width/2 - 100 && mouseX < width/2 + 100 &&
    mouseY > height/2 + 115 && mouseY < height/2 + 185) {
    resetVariables();
    theme.rewind();
    theme.play();
    mode = INTRO;
  }
}
