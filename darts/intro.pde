void intro() {

  //// background
  //drawGradientRect(width/2, height/2, width, height, #BA8C63, 0);

  ////dart board decoration
  //pushMatrix();
  //scale(0.7);
  //translate(width/2-200, -320);
  //drawDartBoard();
  //popMatrix();
  image(introScreen, 0, 0, width, height);
  
  // text
  textWithOutline("DARTS", width/2, height/4+50, 255, gold, 150);
  textWithOutline("For Two Players!", width/2, height/4+150, gold, 0, 45);


  //information:
  textWithOutline("Take turns throwing darts and be the first to score 301 points. \n The last dart must hit the exact score. ", width/2, height/2+50, #BA8C63, 255, 25);
  textWithOutline("The middle ring gives tripple the score and the outer ring gives double.", width/2, height/2+120, #BA8C63, 255, 23);

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

  textWithOutline("START", width/2, height/2 + height/4-5, fill, gold, 50);
}

void introClicks() {
  if (mouseX > width/2-100 && mouseX < width/2-100+200 && mouseY > height/2 + height/4 - 75/2 && mouseY < height/2 + height/4 - 75/2+75) {
    mode=GAME;
    int i=0;
    while (i<random(5)) {
      resetForNextPlayer();
    }
    redScore=startScore;
    blueScore=startScore;
  }
}
