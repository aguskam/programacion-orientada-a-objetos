int max = 10;        
float[] xs = new float[max];
float[] ys = new float[max];
int indice = 0;        
int cantidad = 0;      

void setup() {
  size(800, 600);
}

void draw() {
  background(255);
  for (int i = 0; i < cantidad; i++) {
    ellipse(xs[i], ys[i], 20, 20);
  }
}

void mousePressed() {
  xs[indice] = mouseX;
  ys[indice] = mouseY;
  indice = (indice + 1) % max;
  if (cantidad < max) {
    cantidad++;
  }
}
