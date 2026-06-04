import processing.javafx.*;

//Cheng Cheng
//Block 1-1
//April 15,2026

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;




//MODE VARIABLES--------------------------------------------------------------------------------
int mode;
final int INTRO=0;
final int GAME=1;
final int PAUSE=2;
final int GAMEOVER=3;
final int OPTIONS=4;

//TARGET VARIABLES---------------------------------------------------------------------------
float x, y, d;
float x1, y1, d1;
float x2, y2, d2;
int lives;
int bull, mid, out;
float popupX, popupY, popupValue, popupTimer;
float sliderX, size;
float timer1, timer2, timer3;
int typeOfTarget;
int highscore=0;
int total= bull*3+mid*2+out;
boolean newHighScore = false;
//IMAGES--------------------------------------------------------------
PImage tomato, pizza;
//COLOR PALLETTE-------------------------------------------------------------------------
//Colors
//essential primaries
color warmYellow  = #FFDF00;
color coolYellow  = #F1FF5E;
color white       = #F9F6F0;
color cyan        = #00FFFF;
color warmBlue    = #180A8F;
color coolBlue    = #0055A4;
color pink        = #FF69B4;
//Earth Tones
color brightRed   = #FF0000;
color brightOrange= #FF5F1F;
color warmGreen   = #7BB661;
color coolGreen   = #00A86B;
//black
color ivoryBlack  = #000000;
//sound variables
Minim minim;
AudioPlayer theme, coin, bump, gameover;


void setup() {
  size(800, 800, FX2D);
  frameRate(60);
  imageMode(CENTER);
  textAlign(CENTER, CENTER);
  rectMode(CENTER);

  mode = INTRO;

  //Image Loading
  tomato = loadImage("tomato.png");
  pizza = loadImage("pizza.png");
  //target initialization
  x=random(d/2, width-d/2);
  y=random(d/2, height-d/2);
  d=100;
  x1=random(d/2, width-d/2);
  y1=random(d/2, height-d/2);
  d1=100;
  x2 = random(d/2, width-d/2);
  y2 = random(d/2, height-d/2);
  d2=100;
  bull=0;
  mid=0;
  out=0;
  lives=5;
  typeOfTarget = 1;
  sliderX = map(d, 70, 255, 40, 165);
  timer1 = 180; // 3 seconds at 60fps
  timer2 = 180;
  timer3 = 180;

  //minim
  minim = new Minim(this);
  theme = minim.loadFile("MUSIC.mp3");
  coin = minim.loadFile("coin.wav");
  bump = minim.loadFile("FAILURE.wav");
  gameover = minim.loadFile("gameover.wav");
}

void draw() {
  println(frameRate);
  if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
    
    drawPopup();
  } else if (mode == PAUSE) {
    pause();
  } else if (mode == GAMEOVER) {
    gameover();
  } else if (mode == OPTIONS) {
    options();
    if ( mouseX > 40 && mouseX < 165 && mouseY > height/2 + 15 && mouseY < height/2 + 45) {
      stroke(255);
    } else {
      stroke(0);
    }
  } else {
    println("Error: Mode = " + mode);
  }
}
