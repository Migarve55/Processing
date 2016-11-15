
float spin = 0.0;

PVector x; //Posición

void setup() {
  size(640, 360, P3D);
  noStroke();
  
  x = new PVector(0,height / 2,(height/2) / tan(PI/6));
}

void draw() {
  background(51);
  
  camera(x.x, x.y, x.z, width/2, height/2, 0, 0, 1, 0);
  
  if (mousePressed) {
    lights();
  }
  ambientLight(6,5,100);
  directionalLight(0, 255, 0, width/2, height/2, 0);
  pointLight(255, 0, 0, 200, 100, 400);
  spin += 0.01;
  
  pushMatrix();
  translate(width/2, height/2, 0);
  //rotateX(PI/9);
  rotateY(PI/5 + spin);
  box(150);
  popMatrix();
}


void keyPressed()

{
  switch(key)
  
  {
  case'w':
  x.add(new PVector(1,0,0));
  break;
  case'a':  
  break;  
  case's':  
  x.add(new PVector(-1,0,0));
  break; 
  case'd':  
  break;  
  }
}