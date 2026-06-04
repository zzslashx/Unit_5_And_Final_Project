class Ripple {

  //instance variables or fields
  float x, y, size, alpha;
  int r, g, b;

  //constructor: special function that defines how
  //             a object of this class is born.
  //             Defines inifial values for its fields.
  Ripple() {
    x = random(width);
    y = random(height);
    size = random(200);
    r = int(random(0, 30));
    g = int(random(150, 220));
    b = int(random(200, 255));
  }
  //behaviour functions: these define what a ripple does

  void show() {
    noFill();
    alpha = map(size, 0, 200, 255, 0);
    stroke(r, g, b, alpha);
    ellipse(x, y, size, size/2);
  }

  void act() {
    size += 3;
    if (size >= 200) {
      if (mode == GAME) {
        if (mousePressed) {
          x = mouseX;
          y = mouseY;
        }
      }
      if (mode == INTRO) {
        x = random(width);
        y = random(height);
        //x=mouseX;
        //y=mouseY;
      }
      size = 0;
    }
  }
}
