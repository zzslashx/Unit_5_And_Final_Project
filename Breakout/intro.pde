void intro() {
  drawGradientRect(width/2, height/2, width, height, blue5, pink);
  // sounds

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
  fill(255);
  textSize(x);
  textAlign(CENTER, CENTER);

  fill(#DA9EF2);
  for (int x = -3; x <= 3; x += 3) {
    for (int y = -3; y <= 3; y += 3) {
      text("BREAKOUT", (width/2) + x, (height/4 + 100) + y);
    }
  }

  fill(255);
  text("BREAKOUT", width/2, height/4 + 100);


  x = 100 + sin(frameCount * 0.05) * 50;


  // subtitle
  fill(coolYellow);
  textSize(25);
  text("Hit the ball and break the blocks to win!", width/2, height/4 + 75+150);

  //play info
  textSize(35);
  fill(#DA9EF2);
  text("<click to play>", width/2-1, height/2+100);
  text("<click to play>", width/2+1, height/2+100);
  text("<click to play>", width/2, height/2+99);
  text("<click to play>", width/2, height/2+101);
  fill(255);
  text("<click to play>", width/2, height/2+100);
}
void introClicks() {

  mode = GAME;
}
