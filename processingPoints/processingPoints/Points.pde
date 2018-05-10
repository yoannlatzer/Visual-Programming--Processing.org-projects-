// Example Code: https://processing.org/examples/bouncybubbles.html

class Points {

  float radius;
  float x, y;
  float vx;
  float vy;
  float speedX = 0;
  float speedY = 0;
  float gravity = 0.02;
  float maxSpeed = 2;
  float spring = 0.05;
  float friction = -0.9;
  float opp;
  color c0;
  int id;
  Points[] others;

  Points(float xTemp, float yTemp, float speedXTemp, float speedYTemp, float radiusTemp, float oppTemp, color colorTemp, int idTemp, Points[] othersTemp) {
    x = xTemp;
    y = yTemp;
    speedX = speedXTemp;
    speedY = speedYTemp;
    radius = radiusTemp;
    opp = oppTemp;
    c0 = colorTemp;
    id = idTemp;
    others = othersTemp;
  }
  
  void collide() {
      for (int i = id + 1; i < pointsNumber; i ++) {
        float dx = others[i].x - x;
        float dy = others[i].y - y;
        float distance = sqrt(dx*dx + dy*dy);
        float minDist = others[i].radius/2 + radius/2;
        if (distance < minDist) {
          float angle = atan2(dy, dx);
          float targetX = x + cos(angle) * minDist;
          float targetY = y + sin(angle) * minDist;
          float ax = (targetX - others[i].x) * spring;
          float ay = (targetY - others[i].y) * spring;
          vx -= ax;
          vy -= ay;
          others[i].vx += ax;
          others[i].vy += ay;
          c0 = color(255,255,255);
        }
          
      }
  }

  void update() {
    
    x += speedX;
    y += speedY;
    
    x += vx;
    y += vy;
    
    y += gravity;
       
    if (x + radius/2 > width) {
      x = width - radius/2;
      vx *= friction;
      speedX = speedX * -1;
    }
    
    if (x - radius/2 < 0) {
      x= radius/2;
      speedX = speedX * -1;
      vx *= friction;
    }
    
    if (y + radius/2 > height) {
      y = height - radius/2;
      vy *= friction;
      speedY = speedY * -1;
    }
    
    if (y - radius/2 < 0) {
      y = radius/2;
      speedY = speedY * -1;
      vy *= friction;
    }

  }

  void display() {
    
    fill(c0, opp);
    ellipse(x, y, radius, radius);
    noStroke();
    
  }
  
  void lineDraw (float xTemp, float yTemp, float oXTemp, float oYTemp) {
    fill(255,255,255);
    line(xTemp, yTemp, oXTemp, oYTemp);
  }
  
  
}