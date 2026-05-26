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
  text("BREAKOUT", width/2, height/4 + 100);
  x = map(sin(frameCount * 0.05), -1, 1, 50, 150);



  // subtitle
  fill(coolYellow);
  textSize(35);
  text("break the blocks to win!", width/2, height/4 + 75+150);


  // start button
  tactileRect(width/2 - 100, height/2 - 35+150, 200, 70);
  fill(black);
  textSize(35);
  text("PLAY", width/2, height/2+10+150);
}
void introClicks() {

  if (mouseX>width/2-100 && mouseX<width/2-100+200 && mouseY>height/2-35+150 && mouseY< height/2 - 35+150+70) {
    mode=GAME;
  }
}
