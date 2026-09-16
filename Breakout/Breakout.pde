//breakout!
//Cheng Cheng
//May -- 2026
////
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
////////////////////////
import processing.javafx.*;
//Gif variables
PImage[] starry;
int starryFrames;
int f;
//MODE VARIABLES--------------------------------------------------------------------------------
int mode;
final int INTRO=0;
final int GAME=1;
final int PAUSE=2;
final int GAMEOVER=3;

//entities
float paddleX, paddleY, paddleD; //paddle
float ballx, bally, balld; //ball
float vx, vy;
float x = 0;
int score =0;
int lives = 3;
int numOfHits=0;
int numOfBricksLeft;
//brick variables
int[] brickX;
int[] brickY;
boolean[] alive;
int brickD;
int n;
int tempX, tempY;

//keyboard variables
boolean akey, dkey;
//sound variables
Minim minim;
AudioPlayer theme, crack, hit, gameover;
//COLOR PALLETTE-------------------------------------------------------------------------
//Colors

color warmBlue = color(0, 20, 60);
color coolBlue = color(0, 80, 160);
color blue1= #E6F7FF;
color blue2= #BFE9FF;
color blue3= #7FD3FF;
color blue4= #2F7FBF;
color blue5= #1B3F8B;
color pink = #FFC1CC;
color coolYellow = #FFF44F;
color black = color(0);
color purple = #301934;

//star variables
Star[] myStars;
int numStars;

;

void setup() {
  starryFrames = 144;
  starry = new PImage[starryFrames];

  numStars=200;
  myStars = new Star[numStars]; //constructor
  for (int i=0; i<numStars; i++) {
    myStars[i] = new Star();
  }

  int j = 0;
  while (j<starryFrames) {
    starry[j] = loadImage("frame_"+j+"_delay-0.04s.gif");
    j++;
  }

  size(900, 800, FX2D);
  mode = INTRO;

  //surface.setIcon();
  surface.setTitle("Breakout!");

  ///initalize paddles
  paddleX = width/2;
  paddleY = height;
  paddleD = 100;

  //initialize keyboard vars
  akey=dkey=false;

  //initiallize ball

  ballx = width/2;
  bally = height/2+150;
  vx=0;
  vy = 2;
  balld=10;

  textAlign(CENTER);
  //brick
  brickD=50;
  n=45;
  numOfBricksLeft=n;
  brickX = new int[n];
  brickY = new int[n];
  alive = new boolean[n];
  tempX = 150;
  tempY=100;
  int i=0;
  while (i<n) {
    brickX[i] = tempX;
    brickY[i] = tempY;
    alive[i] = true;
    tempX+=75;
    if (tempX>=width-125) {
      tempX=150;
      tempY+=75;
    }
    i++;
  }
  //minim
  minim = new Minim(this);
  theme = minim.loadFile("MUSIC.mp3");
  crack = minim.loadFile("SUCCESS.wav");
  hit = minim.loadFile("FAILURE.wav");
  gameover = minim.loadFile("gameover.wav");
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
