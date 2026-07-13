final int CANTIDAD = 15;

Movil[] moviles = new Movil[CANTIDAD];

void setup() {
  size(800, 600);

  for (int i = 0; i < CANTIDAD; i++) {
    moviles[i] = new Movil(width/2, height/2);
  }
}

void draw() {
  background(240);

  // Cada móvil sigue al siguiente
  for (int i = 0; i < CANTIDAD - 1; i++) {
    moviles[i].seguir(moviles[i + 1].pos);
  }

  // El último sigue al mouse
  moviles[CANTIDAD - 1].seguir(new PVector(mouseX, mouseY));

  // Actualizar y mostrar
  for (int i = 0; i < CANTIDAD; i++) {
    moviles[i].actualizar();
    moviles[i].mostrar();
  }
}

class Movil {

  PVector pos;
  PVector vel;
  PVector acc;

  float velocidadMax = 4;
  float fuerzaMax = 0.2;
  float tam = 20;

  Movil(float x, float y) {
    pos = new PVector(x, y);
    vel = new PVector();
    acc = new PVector();
  }

  void seguir(PVector objetivo) {

    PVector direccion = PVector.sub(objetivo, pos);

    float distancia = direccion.mag();

    if (distancia > 1) {

      direccion.normalize();
      direccion.mult(velocidadMax);

      PVector fuerza = PVector.sub(direccion, vel);
      fuerza.limit(fuerzaMax);

      aplicarFuerza(fuerza);
    }
  }

  void aplicarFuerza(PVector fuerza) {
    acc.add(fuerza);
  }

  void actualizar() {

    vel.add(acc);
    vel.limit(velocidadMax);

    pos.add(vel);

    acc.mult(0);
  }

  void mostrar() {
    fill(50, 150, 255);
    stroke(0);
    ellipse(pos.x, pos.y, tam, tam);
  }
}
