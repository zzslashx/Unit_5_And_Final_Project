void intro() {

  // background
  drawGradientRect(width/2, height/2, width, height, #BA8C63, 0);

  // text
  fill(255);
  textSize(90);
  text("DARTS", width/2, height/4);



  // web decoration
  stroke(255, 255, 255, 30);
  strokeWeight(3);
  for (int i = width; i >= 10; i -= 30) {
    line(0, i, i, height);
    line(i, 0, width, i);

    line(0, 0, i, height);
    line(0, 0, width, i);
  }

  // play button
  tactileRect(width/2-100, height/2 + height/4 - 75/2, 200, 75);
  fill(0);
  textSize(45);
  text("START", (width/2), height/2 + height/4-5);
}

void introClicks() {
  if (mouseX > width/2-100 && mouseX < width/2-100+200 && mouseY > height/2 + height/4 - 75/2 && mouseY < height/2 + height/4 - 75/2+75) {
    mode=GAME;
    resetForNextPlayer();
    redScore=301;
    blueScore=301;
  }
}
