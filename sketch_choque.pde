Mover a, b;

void setup() {
  size(800, 600);

  a = new Mover(250, 100);
  b = new Mover(550, 150);
}

void draw() {
  background(220);

  a.actualizar();
  b.actualizar();

  if (a.colision(b)) {
    a.rebotar(b);
  }

  a.mostrar();
  b.mostrar();
}

void mousePressed() {
  a.seleccionar(mouseX, mouseY);
  b.seleccionar(mouseX, mouseY);
}

void mouseDragged() {
  a.arrastrar(mouseX, mouseY);
  b.arrastrar(mouseX, mouseY);
}

void mouseReleased() {
  a.soltar();
  b.soltar();
}

class Mover {

  PVector pos;
  PVector vel;
  PVector acc;

  float gravedad = 0.25;
  float tam = 60;

  boolean seleccionado = false;

  Mover(float x, float y) {
    pos = new PVector(x, y);
    vel = new PVector(random(-2, 2), 0);
    acc = new PVector();
  }

  void actualizar() {

    if (!seleccionado) {

      aplicarFuerza(new PVector(0, gravedad));

      vel.add(acc);
      pos.add(vel);
      acc.mult(0);

      // Rebote contra los bordes

      if (pos.x < tam/2) {
        pos.x = tam/2;
        vel.x *= -0.8;
      }

      if (pos.x > width - tam/2) {
        pos.x = width - tam/2;
        vel.x *= -0.8;
      }

      if (pos.y < tam/2) {
        pos.y = tam/2;
        vel.y *= -0.8;
      }

      if (pos.y > height - tam/2) {
        pos.y = height - tam/2;
        vel.y *= -0.8;
      }
    }
  }

  void aplicarFuerza(PVector f) {
    acc.add(f);
  }

  boolean colision(Mover otro) {
    float d = dist(pos.x, pos.y, otro.pos.x, otro.pos.y);
    return d < tam/2 + otro.tam/2;
  }

  void rebotar(Mover otro) {

    PVector direccion = PVector.sub(pos, otro.pos);
    direccion.normalize();

    vel = direccion.copy();
    vel.mult(5);

    otro.vel = direccion.copy();
    otro.vel.mult(-5);

    tam *= 0.95;
    otro.tam *= 0.95;

    tam = max(tam, 15);
    otro.tam = max(otro.tam, 15);
  }

  void mostrar() {
    fill(100, 200, 100);
    stroke(0);
    ellipse(pos.x, pos.y, tam, tam);
  }

  void seleccionar(float mx, float my) {
    if (dist(mx, my, pos.x, pos.y) < tam/2) {
      seleccionado = true;
      vel.set(0, 0);
    }
  }

  void arrastrar(float mx, float my) {
    if (seleccionado) {
      pos.set(mx, my);
    }
  }

  void soltar() {
    seleccionado = false;
  }
}
