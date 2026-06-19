import processing.javafx.*;

//MODE VARIABLES--------------------------------------------------------------------------------
int mode;
final int INTRO=0;
final int GAME=1;
final int PAUSE=2;
final int GAMEOVER=3;

//entities
float paddleX, paddleY, paddleD; //paddle
float ballx, bally, balld; //ball
float vx, vy1;
float x = 0;

int lives = 3;
int numOfHits=0;
int numOfBricksLeft;


//keyboard variables
boolean akey, dkey;

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

//brick variables
Bricks[] myBricks;
int numBricks;


//scoring
int score =0;
void setup() {
  size(900, 800, FX2D);
  mode = INTRO;

  numStars=200;
  myStars = new Star[numStars]; //constructor
  for (int i=0; i<numStars; i++) {
    myStars[i] = new Star();
  }

  numBricks=20;
  myBricks = new Bricks[numBricks]; //constructor
  for (int i=0; i<numBricks; i++) {
    myBricks[i] = new Bricks();
  }
  //surface.setIcon();
  surface.setTitle("Dodge!");

  ///initalize paddles
  paddleX = width/2;
  paddleY = height-50;
  paddleD = 25;

  //initialize keyboard vars
  akey=dkey=false;
  textAlign(CENTER);
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
