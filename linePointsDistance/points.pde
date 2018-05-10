class Points {
  PVector circle;
  PVector acceleration;
  int r;
  PVector speed;
  
  Points(int xTemp, int yTemp, int rTemp, float sTemp){
    circle = new PVector (xTemp, yTemp);
    r = rTemp;
    speed = new PVector (sTemp, sTemp);
  }
  
  void display() {
    fill(66);
    noStroke();
    ellipseMode(RADIUS);
    ellipse(circle.x, circle.y, r, r);
  }
  
  void update(){
    circle.add(speed);
    if(circle.x >= width - r/2 || circle.x <= r/2){
      speed.x *= -1;
    }
    if(circle.y >= width - r/2 || circle.y <= r/2){
      speed.y *= -1;
    }   
  }
}