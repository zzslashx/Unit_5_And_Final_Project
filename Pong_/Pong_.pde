//Pong!
//Cheng Cheng
//May -- 2026

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

import processing.javafx.*;
//MODE VARIABLES--------------------------------------------------------------------------------
int mode;
final int INTRO=0;
final int GAME=1;
final int PAUSE=2;
final int GAMEOVER=3;

//1 or 2 player
boolean twoPlayer;
//entities
float leftx, lefty, leftd, rightx, righty, rightd; //paddels
float ballx, bally, balld; //ball
float vx, vy;
//timers
float signalTimer = 0;
float resetTimer = 0;
boolean waitingReset = false;
//scoring
int leftScore = 0;
int rightScore = 0;
//collision
boolean collided =false;
//keyboard variables
boolean wkey, skey, upkey, downkey;
//COLOR PALLETTE-------------------------------------------------------------------------
//Colors
//essential primaries
color warmYellow  = #FFDF00;
color coolYellow  = #F1FF5E;
color white       = #F9F6F0;
color cyan        = #00FFFF;
color warmBlue    = color(0, 20, 60);
color coolBlue    = color(0, 80, 160);
color pink        = #FF69B4;
//Earth Tones
color brightRed   = #FF0000;
color brightOrange= #FF5F1F;
color warmGreen   = #7BB661;
color coolGreen   = #00A86B;
//black
color ivoryBlack  = #000000;

color random = color(int(random(1, 255)), int(random(1, 255)), int(random(1, 255)), int(random(150, 255)));
//ripple
Ripple[] myRipples;
int numRipples;
//sound variables
Minim minim;
AudioPlayer theme, score, hit, gameover;
;

void setup() {
  size(1000, 600, FX2D);
  mode = INTRO;

  //surface.setIcon();
  surface.setTitle("Pong Game");

  ///initalize paddles
  leftx = 0;
  lefty = height/2;
  leftd = 90;
  rightx = width;
  righty = height/2;
  rightd = 90;

  //initialize keyboard vars
  wkey=skey=upkey=downkey=false;

  //initiallize ball
  ballx = width/2;
  bally = height/2;
  resetBall();
  balld=25;
  textAlign(CENTER);


  //minim
  minim = new Minim(this);
  theme = minim.loadFile("MUSIC.mp3");
  score = minim.loadFile("SUCCESS.wav");
  hit = minim.loadFile("FAILURE.wav");
  gameover = minim.loadFile("gameover.wav");

  numRipples=10;
  myRipples = new Ripple[numRipples]; //constructor
  for (int i=0; i<numRipples; i++) {
    myRipples[i] = new Ripple();
  }
}

void draw() {
  if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == PAUSE) {
    pause();
  } else if (mode == GAMEOVER) {
    gameover();
  } else {
    println("Error: Mode = " + mode);
  }
}
