class Triangle {

  float x;
  float y;
  float offsetX;
  float offsetY;
  color c;

  Triangle(int col) {
    x = width/2;
    y = height/2 + 50;
    offsetX = 20;
    offsetY = 50;
    if(col % 2 != 0){
      c = color(229, 93, 135);
    }
    else{
      c = color(95, 195, 228);
    }
  }

  void drawShape() {
    fill(c);
    noStroke();
    triangle(x, y - offsetY, x + offsetX, y, x - offsetX, y);
  }

  void runOffset(float incr) {
    drawShape();
    offsetX += incr;
    offsetY += incr;
  }
}