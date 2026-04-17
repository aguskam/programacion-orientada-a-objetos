int cols = 20;   
int rows = 15;  
float[][] distancias;
float anchoCelda;
float altoCelda;

void setup() {
  size(800, 600);
  anchoCelda = width / cols;
  altoCelda = height / rows;
  distancias = new float[cols][rows];
}

void draw() {
  background(0);
  calcularDistancias();
  dibujarGrilla();
}

void calcularDistancias() {
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      float x = i * anchoCelda + anchoCelda / 2;
      float y = j * altoCelda + altoCelda / 2;
      float d = dist(x, y, mouseX, mouseY);
      distancias[i][j] = d;
    }
  }
}

void dibujarGrilla() {
  float maxDist = dist(0, 0, width, height); 
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      float d = distancias[i][j];
      float gris = map(d, 0, maxDist, 255, 0);
      fill(gris);
      noStroke();
      rect(i * anchoCelda, j * altoCelda, anchoCelda, altoCelda);
    }
  }
}
