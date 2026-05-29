void gameover() {
  gameover.play();
  //drawGradientRect(width/2, height/2, width, height, color(0, 20, 60), color(0, 80, 160));
  image(starry[f],0,0,width,height);
  if(frameCount%1==0)f++; 
  if(f==starryFrames) f=0;
  textSize(100);
  fill(255);
  if(lives==0){ 
    text("YOU LOSE!", width/2, height/2-130);
  }else{
  text("YOU WIN!", width/2, height/2-100);
  }
  textSize(35);
  text("<click to continue>", width/2, height/2+100);
}

void gameoverClicks() {
  mode=INTRO;
  score =0;
  lives = 3;
  for (int i =0; i<n; i++)
    alive[i]=true;
    theme.rewind();
    gameover.rewind();
    gameover.pause();
    theme.play();
}
