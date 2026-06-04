void options() {
  //background + text
  drawGradientRect(width/2, height/2, width, height, warmYellow, coolYellow);
  textSize(85);
  text("OPTIONS", width/2, 100);
  textSize(25);
  //indicator
  x=150;
  y=(height/2)+200;
  if(typeOfTarget ==1)
  displayTarget(width/2-50, height-100);
  if(typeOfTarget ==2)
  image(tomato,width/2-50,height-100,d,d);
  if(typeOfTarget==3)
  image(pizza,width/2-50,height-100,d,d);

  
  //slider
  fill(0);
  text("Size of target", 100, height-150);
  controlSlider();
  if (mouseX > 40 && mouseX < 165 && mouseY > height-115 && mouseY < height-85) {
    stroke(255);
  } else {
    stroke(0);
  }
  fill(0);
  strokeWeight(5);
  line(40, (height-100), 165, (height-100));
  circle(sliderX, (height-100), 15);


  //Type of target selection
textSize(50);
text("Type of target:", width/2, 200);
imageMode(CENTER);
rectMode(CORNER);

// normal target box
tactileRect(95*2-175/2, 185*2-175/2+10, 175, 175);
displayTarget67(95*2, 190*2, 155);

// tomato box
tactileRect(width/2+5-175/2, height/2-20-175/2, 175, 175);
image(tomato, width/2+5, height/2-15, 175, 175);

// pizza box
tactileRect(width/2+210-175/2, height/2-20-175/2, 175, 175);
image(pizza, width/2+210, height/2-20, 175, 175);

rectMode(CORNER);


  //Draw Back Button
  fill(255);
  stroke(0);
  strokeWeight(3);
  rect(width-140-60, height-100-25, 120, 50);
  tactileRect(width-140-60, height-100-25, 120, 50);
  fill(0);
  textSize(40);
  text("BACK", width-140, height-105);
}

void optionsClicks() {
  if (mouseX > 40 && mouseX < 165 && mouseY > height-115 && mouseY < height-85) {
    controlSlider();
  }
    // normal target box
  if (mouseX > 95*2-175/2 && mouseX < 95*2-175/2+175 && 
      mouseY > 185*2-175/2+10 && mouseY < 185*2-175/2+10+175) {
    typeOfTarget = 1;
  }
  // tomato box
  if  (mouseX > width/2+5-175/2 && mouseX < width/2+5+175/2 && 
      mouseY > height/2-20-175/2 && mouseY < height/2-20+175/2) {
    typeOfTarget = 2;
  }
  // pizza box
  if (mouseX > width/2+210-175/2 && mouseX < width/2+210+175/2 && 
      mouseY > height/2-20-175/2 && mouseY < height/2-20+175/2) {
    typeOfTarget = 3;
  }
  if (mouseX>width-140-60 && mouseX<width-140+60 && mouseY>height-100-25 && mouseY<height-100+25) {
    mode=INTRO;
  }
}

void controlSlider() {
  if (mousePressed && mouseX > 40 && mouseX < 165 && mouseY > height-115 && mouseY < height-85) {
    sliderX = mouseX;
  } else {
    stroke(0);
  }
  d = map(sliderX, 40, 165, 50, 150);
  d1 = map(sliderX, 40, 165, 50, 150);
  d2 = map(sliderX, 40, 165, 50, 150);
}
