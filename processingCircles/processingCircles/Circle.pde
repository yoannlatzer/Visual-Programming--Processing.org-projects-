class Circle {
  float radius;
  float rspeed = randomGaussian();
  float x;
  float y;
  float opp;
  color c0;

  Circle(float xTemp, float yTemp, float radiusTemp, float oppTemp, color colorTemp) {
    x = xTemp;
    y = yTemp;
    opp = oppTemp;
    radius = radiusTemp;
    c0 = colorTemp;
  }

  void update() {
    radius = radius + rspeed;
    if (radius <= 1 || radius >= 700) {
      rspeed = rspeed * -1;
      if (opp > 0) {
        opp -= 80;
      } else {opp += 80;}
    }
    
  }

  void display() {
    fill(c0, opp);
    stroke(255);
    strokeWeight(0.3);
    ellipse(x, y, radius, radius);

  }
}