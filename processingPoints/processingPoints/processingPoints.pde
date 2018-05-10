PImage img;
PShape svg;
int opacity = 155;
int pointsNumber = 1500;
int pointsRadius = 2;
float speedX = 0.4;
float speedY = 0.6;
color c1 = color(102, 178, 255);
color c2 = color(255, 70, 50);
color white = color(255, 255, 255);
color colorz;
int count = 0;
Points[] Pointss = new Points[pointsNumber];

void setup() {
  size(800, 600);
  smooth();

  img = loadImage("grass2.jpg");
  svg = loadShape("yLogo.svg");

  for (int i=0; i<Pointss.length; i++) {

    float randomX = random(pointsRadius, width-pointsRadius);
    float randomY = random(pointsRadius, height-pointsRadius);

    count += 1;

    if (count == 1) {
      colorz = c1;
      speedX *= -1;
    } else if(count == 2) {
      colorz = c2;
      speedY *= -1;
    } else if (count == 3) {
      colorz = c1;
      speedX += 0.5;
      count = 0;
    }

    Pointss[i] = new Points(randomX, randomY, speedX, speedY, pointsRadius, opacity, colorz, i, Pointss);   
  }
 
}

void draw() {
  background(20);

  // Load jpg
  //image(img, 0, 0);

  for (Points rond : Pointss) {
    rond.collide();
    rond.update();
    rond.display();
  }

  //fill(white, 255);
  //ellipse(0, 0, 320, 320);


  // Load svg
  //shape(svg, -190, -190, 380, 380);

  // Record frame by frame
  //saveFrame("screen-####.jpg");
}