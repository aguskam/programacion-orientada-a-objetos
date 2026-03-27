void setup() {
  size(800, 800);
  rectMode(CENTER);
}

void draw() {
  if (mousePressed) {
    composicion(mouseX, mouseY, 100, 100);
  }
}

void composicion(float posicionX, float posicionY, float ancho, float alto) {
  
  strokeWeight(2);
  
  // cuadrado principal
  fill(255, 30);
  rect(posicionX, posicionY, ancho, alto);
  
  // cuadrados internos
  noFill();
  rect(posicionX, posicionY, ancho/2, alto/2);
  rect(posicionX, posicionY, ancho/4, alto/4);
  rect(posicionX, posicionY, ancho/8, alto/8);
  rect(posicionX, posicionY, ancho/16, alto/16);
}
