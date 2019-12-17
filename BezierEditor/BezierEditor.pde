
ArrayList<Vector> vectors;

Vector h = new Vector(50,50,50,500);
Vector b = new Vector(500,50,500,500);

void setup() {

  size(970,620);
  vectors = new ArrayList<Vector>();
  //Editor vectors
  vectors.add(h);
  vectors.add(b);

}

void draw() {
  
  background(255);

  for(Vector vector : vectors) {
    vector.update();
    vector.drawVector();
  }
  
  noFill();
  stroke(#07A3F5);
  bezier(h.pos.x,h.pos.y,h.vec.x,h.vec.y,
         b.pos.x,b.pos.y,b.vec.x,b.vec.y);
  
}