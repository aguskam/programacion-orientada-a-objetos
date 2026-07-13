Mover a;
Perseguidor b;

void setup() {
  size(800,600);
  a = new Mover();
  b = new Perseguidor();
}

void draw() {
  background(255);

  a.mover();
  a.mostrar();

  b.perseguir(a.pos);
  b.actualizar();
  b.mostrar();
}

class Mover {
  PVector pos, vel;

  Mover() {
    pos = new PVector(100,300);
    vel = new PVector(2,1.5);
  }

  void mover() {
    pos.add(vel);

    if(pos.x<0||pos.x>width) vel.x*=-1;
    if(pos.y<0||pos.y>height) vel.y*=-1;
  }

  void mostrar() {
    fill(0,0,255);
    ellipse(pos.x,pos.y,30,30);
  }
}

class Perseguidor {
  PVector pos, vel;

  Perseguidor() {
    pos = new PVector(700,500);
    vel = new PVector();
  }

  void perseguir(PVector objetivo) {
    PVector dir = PVector.sub(objetivo,pos);
    dir.normalize();
    dir.mult(0.2);
    vel.add(dir);
    vel.limit(4);
  }

  void actualizar() {
    pos.add(vel);
  }

  void mostrar() {
    fill(255,0,0);
    ellipse(pos.x,pos.y,30,30);
  }
}
