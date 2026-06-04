class Trail {
  float x, y, alpha, size;

  Trail(float x, float y) {
    this.x = x;
    this.y = y;
    alpha = 255;
    size = random(5, 15);
  }

  void show() {
    noStroke();
    fill(0, 200, 255, alpha);
    circle(x, y, size);
  }

  void act() {
    alpha -= 5;
    size *= 0.98;
  }
}
