void pause() {
  //drawGradientRect(width/2, height/2, width, height, warmBlue, coolBlue);
  theme.pause();
  crack.pause();
  hit.pause();
  image(starry[f],0,0,width,height);
  if(frameCount%1==0)f++; 
  if(f==starryFrames) f=0;
  fill(255);
  textSize(100);
  text("PAUSED", width/2, height/2-100);
  textSize(35);
  text("<Click to resume>", width/2, height/2+50);
}
void pauseClicks() {
theme.play();
  mode = GAME;
}
