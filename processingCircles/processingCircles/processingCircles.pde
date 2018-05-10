PShape svg;
float r = 0;
int opacity = 15;
int circleNumber = 5;
float circleRadius;
int circleRadiusMax = 50;
color c1 = color(248,112,96);
color c2 = color(86,203,249);
color c3 = color(151,237,151);
color colorz;
color colorz2;
Circle[] circles;
Circle[] circles2;
Circle[] circles3;

void setup() {
  // Load the .svg
  svg = loadShape("yLogo.svg");
  size(900, 900);
  smooth();
  // Create a Circle array
  circles = new Circle[circleNumber];
  circles2 = new Circle[circleNumber];
  circles3 = new Circle[circleNumber];
  // Set the radius and color
  // Draw the circles with parameters
  for (int i=0; i< circleNumber; i++) {
    circleRadius += 1 - randomGaussian();
    colorz = lerpColor(c1, c2, i * 0.1);
    colorz2 = lerpColor(c2, c1, i * 0.1); 
    circles[i]= new Circle(-20, -20, circleRadius, opacity, c1);
    circles2[i]= new Circle(0, 0, circleRadius, opacity, c2);
    circles3[i]= new Circle(20, 20, circleRadius, opacity, c3);
  } 
}

void draw() {
  background(255);
  noStroke();
  r += 0.01;
  // Translate drawing coordinates to the window center
  translate(width/2, height/2);
  pushMatrix();
  rotate(r);
  // Run functions for each Circle
  for (Circle rond : circles) {
    rond.update();
    rond.display();
  }
  popMatrix();
  pushMatrix();
  rotate(r * -1);
  //translate(0, mouseY/20);
  for (Circle rond : circles2) {
    rond.update();
    rond.display();
  }
  popMatrix();
  pushMatrix();
  rotate(r - 180);
  for (Circle rond : circles3) {
    rond.update();
    rond.display();
  }
  popMatrix();
  // Draw the .svg
  //shape(svg, -190, -190, 380, 380);
  
  // Record frame by frame
  //saveFrame("screen-####.jpg");
  
}