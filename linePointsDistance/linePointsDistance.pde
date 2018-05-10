//
//
//

int  radius = 3;
int unit = 25;
Points[] circles;
//PShader blur;

void setup() {
  size(500, 500);
  //fullScreen();
  smooth(8);
  circles = new Points[unit];
  for (int i = 0; i < unit; i++) {
    circles[i] = new Points(int(random(radius/2, width - radius/2)), 
    int(random(radius/2, height - radius/2)), radius, random(0.2, 0.5));
    if (i % 2 != 0) {
      circles[i].speed.x *= -1;
      circles[i].speed.y *= -1;
    }
  }
  circles[0].circle.x = width/2;
  circles[0].circle.y = height/2;
  circles[0].r = radius*2;
  //blur = loadShader("blur.glsl");
}


void draw() {
  background(255);
  println(frameRate);
  for (int i = 0; i < circles.length; i++) {
    for (int j = i + 1; j < circles.length; j++) {
      if(circles[i].circle.dist(circles[j].circle) < 200){
        traceLine(circles[i], circles[j]);
      }
    }
  }
  
  for (Points object : circles) {
    //filter(blur);
    object.display();
    object.update();
  }
  circles[0].speed.x = 0;
  circles[0].speed.y = 0;
  
}

void traceLine(Points p1, Points p2) {
  stroke(50, 240, 50);
  line(p1.circle.x, p1.circle.y, p2.circle.x, p2.circle.y);
}