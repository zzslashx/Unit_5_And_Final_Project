void pause() {
  theme.pause();
  textSize(100);
  text("PAUSED", width/2, height/2);
  fill(255);
  circle(width-100, 100, 90);
  fill(0);
  triangle(width-115, 70, width-115, 130, width-70, 100);
}
void pauseClicks() {

  if (dist(width-100, 100, mouseX, mouseY)<40) { //pause button
    mode=GAME;
    theme.rewind();
    theme.play();
  }
}
