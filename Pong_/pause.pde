void pause() {
  drawGradientRect(width/2, height/2, width, height, warmBlue, coolBlue);
  textSize(100);
  text("PAUSED", width/2, height/2);
  textSize(50);
  text("Click to resume", width/2, height/2+50);
}
void pauseClicks() {

  mode = GAME;
}
