void setup() {
  size(800, 600);
  objeto = new Mover(width/2, height/2);
}

void draw() {
  background(220);
  if (mousePressed) {
    PVector fuerza = PVector.sub(new PVector(mouseX, mouseY), objeto.pos);
    fuerza.normalize();
    fuerza.mult(0.3);
    objeto.aplicarFuerza(fuerza);
  }
  
  objeto.actualizar();
  objeto.mostrar();
}

class Mover {
  PVector pos;
  PVector vel;
  PVector acc;
  float angulo = 0;
  float velAngular = 0;
  Mover(float x, float y) {
    pos = new PVector(x, y);
    vel = new PVector();
    acc = new PVector();
  }

  void aplicarFuerza(PVector fuerza) {
    acc.add(fuerza);
    velAngular += fuerza.mag() * 0.05;
  }
  
  void actualizar() {
    vel.add(acc);
    pos.add(vel);
    vel.mult(0.98);
    velAngular *= 0.98;
    angulo += velAngular;
    acc.mult(0);
    if (vel.mag() < 0.05) {
      vel.set(0, 0);
    }

    if (abs(velAngular) < 0.001) {
      velAngular = 0;
    }

    if (pos.x < 0) {
      pos.x = 0;
      vel.x *= -1;
    }

    if (pos.x > width) {
      pos.x = width;
      vel.x *= -1;
    }

    if (pos.y < 0) {
      pos.y = 0;
      vel.y *= -1;
    }

    if (pos.y > height) {
      pos.y = height;
      vel.y *= -1;
    }
  }

  void mostrar() {
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(angulo);
    rectMode(CENTER);
    fill(50, 150, 255);
    stroke(0);
    rect(0, 0, 80, 40);
    fill(255, 0, 0);
    triangle(40, 0, 20, -10, 20, 10);
    popMatrix();
  }
}
