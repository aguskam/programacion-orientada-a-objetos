int cols = 16;
int rows = 9;
boolean[][] estados;
float anchoCelda;
float altoCelda;

void setup() {
  size(800, 450);
  anchoCelda = width / cols;
  altoCelda = height / rows;
  estados = new boolean[cols][rows];
}

void draw() {
  background(220);
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      float x = i * anchoCelda;
      float y = j * altoCelda;
      if (estados[i][j] == false) {
        fill(255);
        stroke(200);
        rect(x, y, anchoCelda, altoCelda);
      } else {
        dibujarEstampa(x, y, anchoCelda, altoCelda);
      }
    }
  }
}

void mousePressed() {
  int col = int(mouseX / anchoCelda);
  int fila = int(mouseY / altoCelda);
  if (col >= 0 && col < cols && fila >= 0 && fila < rows) {
    estados[col][fila] = !estados[col][fila];
  }
}

void dibujarEstampa(float x, float y, float w, float h) {
  fill(0);
  rect(x, y, w, h);
  fill(255);
  ellipse(x + w/2, y + h/2, w * 0.5, h * 0.5);
  stroke(255);
  line(x, y, x + w, y + h);
  line(x + w, y, x, y + h);
}
