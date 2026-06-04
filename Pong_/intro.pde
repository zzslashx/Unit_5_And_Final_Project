void intro() {
  drawGradientRect(width/2, height/2, width, height, coolGreen, warmGreen);
  theme.play();

  // web decoration
  stroke(255, 255, 255, 30);
  strokeWeight(3);
  for (int i = width; i >= 10; i -= 30) {
    line(0, i, i, height);
    line(i, 0, width, i);

    line(0, 0, i, height);
    line(0, 0, width, i);
  }

  // title
  fill(white);
  textSize(140);
  text("PONG!", width/2, height/4+150);

  // subtitle
  fill(coolYellow);
  textSize(35);
  text("1v1 your friends! Or play with AI", width/2, height/4 + 75+150);


  // 1-player button
  tactileRect(width/4 - 100, height/2 - 35+150, 200, 70);
  fill(ivoryBlack);
  textSize(35);
  text("1-Player", width/4, height/2+10+150);

  // 2-player button
  tactileRect(width*3/4 - 100, height/2 - 35+150, 200, 70);
  fill(ivoryBlack);
  textSize(35);
  text("2-Player", width*3/4, height/2+10+150);
}
void introClicks() {
  if (mouseX>width*3/4 - 100 && mouseX<width*3/4 - 100+200 && mouseY> height/2 - 35+150 && mouseY< height/2 - 35+150+70) {
    twoPlayer = true;
    mode=GAME;
  }
  if (mouseX>width/4-100 && mouseX<width/4-100+200 && mouseY> height/2 - 35+150 && mouseY< height/2 - 35+150+70) {
    twoPlayer = false;
    mode=GAME;
  }
}
