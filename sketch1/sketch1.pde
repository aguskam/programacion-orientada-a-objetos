float Radio; float xc,yc;
void setup(){
size(800,600);
Radio= random(100,400);
xc=random(width); yc= random(height);
}
void draw(){
  if(TocaC(xc, yc, Radio)) fill(255,0,0);
  else fill(255);
  background(#B4A9A9);
circle(xc, yc,Radio*2);

}
boolean TocaC(float x, float y, float r ){
  

float d= dist(mouseX,mouseY,x, y);
if(d>r) return false;
else return true;
}
