class Star {

  //instance variables or fields
  float x, y, vx, vy, size;
  int r, g, b;

  //constructor: special function that defines how
  //             a object of this class is born.
  //             Defines inifial values for its fields.
  Star() {
    x = random(0, width);
    y = random(0, height);
    vx = 0;
    vy = random(1, 5);
    size = vy;
    r = (int) random(0, 180);
    g = (int) random(0, 180);
    b = 255;
  }

  //behaviour functions: these define what a star does
  void show() {
    fill(r, g, b);
    square(x, y, size);
  }

  void act() {
    y +=vy;
    if (y > height+size) {
      y=-size;
      size=vy;
    }
    //size+=2;
  }
}
