int filas = 6;
int columnas = 6;

void setup(){
size(800, 600);
noLoop();
}

void draw(){
background(255);

float anchoCelda = width / float(columnas);
float altoCelda = height / float(filas);

for(int i = 0; i < filas; i++){
  for(int j = 0; j < columnas; j++){
  float x = j*anchoCelda;
  float y = i*altoCelda;
  rect(x, y, anchoCelda, altoCelda);
  }
}
}
