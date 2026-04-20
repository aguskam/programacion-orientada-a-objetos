int filas = 10;
int cols = 10;
boolean[][][] datos;

void setup() {
  size(800, 600);
  datos = new boolean[filas][cols][6];
  for (int i = 0; i < filas; i++) {
    for (int j = 0; j < cols; j++) {
      for (int k = 0; k < 6; k++) {
        datos[i][j][k] = random(1) > 0.5;
      }
    }
  }
}

void draw() {
  background(255);
  float w = width / cols;
  float h = height / filas;
  for (int i = 0; i < filas; i++) {
    for (int j = 0; j < cols; j++) {
      float x = j * w;
      float y = i * h;
      boolean[] c = datos[i][j];
      if (c[0]) line(x, y, x + w, y);
      if (c[1]) line(x, y + h, x + w, y + h);
      if (c[2]) line(x, y, x, y + h);
      if (c[3]) line(x + w, y, x + w, y + h);
      if (c[4]) line(x, y, x + w, y + h);
      if (c[5]) line(x + w, y, x, y + h);
    }
  }
}
