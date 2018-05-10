int numTri = 40;
float r = 0;
Triangle[] triangles;

void setup() {
  size(800, 600);
  triangles = new Triangle[numTri];
  for (int i = 0; i < numTri; i++) {
    triangles[i] = new Triangle(i);
  }
}

void draw() {
  translate(0, 250);
  background(60);
  rotate(r);
  float test = numTri/5;
  for (Triangle t : triangles) {
    test -= 0.2;
    t.runOffset(test);
  }
  if(mousePressed == true){
  r += 0.01;
  }
}

void mousePressed() {
  
}