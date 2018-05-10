ArrayList<Triangle> triangles;

void setup() {
  size(800, 600);
  triangles = new ArrayList<Triangle>();
}

void draw() {
  background(0);
  translate(0, 60);
  float timer = second();
  
  for (int i = 0; i < triangles.size(); i++) {
    Triangle t = triangles.get(i);
    if (t.offsetY > height) {
      triangles.remove(i);
    }
    t.run();
  }
  if ((timer % 3) == 0) {
    triangles.add(new Triangle(0));
  }
  if ((timer % 5) == 0){
    triangles.add(new Triangle(1));
  }
  //println("Num of triangles: ", triangles.size());
  println(timer);
}

void mousePressed() {
  //triangles.add(new Triangle(0));
  println("Num of triangles: ", triangles.size());
}

void keyPressed() {
  triangles.add(new Triangle(1));
}