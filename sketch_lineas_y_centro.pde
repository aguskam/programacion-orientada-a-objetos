int cant = 5;

void setup() {
  size(800, 600);
}

void draw() {
  background(255);
  stroke(0); // color negro
  
  for (int i = 0; i < cant; i++) {
    float x = i * width / (cant - 1);
    line(x, 0, width/2, height/2);
    line(x, height, width/2, height/2);
  }
}
