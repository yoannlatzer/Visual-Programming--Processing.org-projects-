class Triangle {
  float x;
  float y;
  float offsetX;
  float offsetY;
  color rose = color(229, 93, 135);
  color water = color(95, 195, 228);
  color c;

  Triangle(int i) {
    x = width/2;
    y = height - 150;
    offsetX = 20;
    offsetY = 50;
    if (i != 0) {
      c = color(0);
    } else {
      c = lerpColor(rose, water, randomGaussian());
    }
  }

  void run() {
    fill(c);
    noStroke();
    triangle(x, y - offsetY, x + offsetX, y, x - offsetX, y);
    offsetX += 1;
    offsetY += 1;
  }
}