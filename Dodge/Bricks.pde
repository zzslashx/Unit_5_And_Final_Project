class Bricks {

  //instance variables or fields
  float x, y, vx, vy, size;
  int r, g, b;

  //constructor: special function that defines how
  //             a object of this class is born.
  //             Defines inifial values for its fields.
  Bricks() {
    x = random(0, width);
    y = random(-1000, 0);
    vx = 0;
    vy = vy1 = score%1000*5/2+5;
    size = 25;
    r = 255;
    g = 255;
    b = (int) random(180, 256);
  }

  //behaviour functions: these define what a star does
  void show() {
    fill(r, g, b);
    circle(x, y, size);
  }

  void act() {
    size=int((score/1000))*3+25;
    y +=vy;
    vy = vy1 = 5 + (score / 1000) * 1.5;
    if (y > height+size) {
      y=random(0, -100);
      x=random(0, width);
    }
    if (dist(x, y, paddleX, paddleY) < size/2+paddleD/2) {
      lives--;
      y=random(0,-100);
    }
  }
}
