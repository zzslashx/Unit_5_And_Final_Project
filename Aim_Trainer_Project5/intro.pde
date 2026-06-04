void intro() {
  // sounds
  gameover.pause();
  theme.play();
  
  // background
  drawGradientRect(width/2, height/2, width, height,warmBlue,coolBlue);
  
  // text
  fill(255);
  textSize(90);
  text("AIM TRAINER", width/2, height/4);
  
  fill(200, 220, 255);
  textSize(22);
  text("Test your mouse skills. Get better.", width/2, height/4 + 60);
  
  // target decoration
  stroke(255, 255, 255, 80);
  strokeWeight(2);
  noFill();
  circle(width/2, height/2 - 30, 120);
  circle(width/2, height/2 - 30, 80);
  circle(width/2, height/2 - 30, 20);
  stroke(255, 255, 255, 60);
  line(width/2 - 80, height/2 - 30, width/2 + 80, height/2 - 30);
  line(width/2, height/2 - 110, width/2, height/2 + 50);

  rectMode(CORNER);
  
  // play button
  tactileRect(width/2 - 200, height/2 + height/4 - 50, 200, 100);
  fill(0);
  textSize(50);
  text("START", (width/2) - 100, height/2 + height/4);
  
  // options button
  tactileRect(width/2 + 20, height/2 + height/4 - 50, 200, 100);
  fill(0);
  textSize(45);
  text("OPTIONS", (width/2) + 120, height/2 + height/4);

  // highscore
  if (highscore > 0) {
    fill(255, 215, 0);
    textSize(20);
    text("Best: " + highscore + " pts", width/2, height/2 + height/4 + 80);
  }
  
  rectMode(CENTER);
}

void introClicks() {
  // start button
  if (mouseX > width/2 - 200 && mouseX < width/2 && mouseY > height/2 + height/4 - 50 && mouseY < height/2 + height/4 + 50) {
    randomizeTargets();
    mode = GAME;
  }
  // options button
  if (mouseX > width/2 + 20 && mouseX < width/2 + 220 && mouseY > height/2 + height/4 - 50 && mouseY < height/2 + height/4 + 50) {
    mode = OPTIONS;
  }
}
