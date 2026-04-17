int cant = 20;
float[] valores;
float anchoBarra;

void setup() {
  size(800, 400);
  valores = new float[cant];
  anchoBarra = width / cant;
}

void draw() {
  background(30);
  for (int i = 0; i < cant; i++) {
    float x = i * anchoBarra;
    float h = valores[i];
    fill(100, 200, 255);
    rect(x, height - h, anchoBarra - 2, h);
  }
}

void mouseDragged() {
  int indice = int(mouseX / anchoBarra);
  if (indice >= 0 && indice < cant) {
    float h = height - mouseY;
    h = constrain(h, 0, height);
    valores[indice] = h;
  }
}
