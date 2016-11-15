
class cell
{

  boolean alive = false;
  color colorDead = color(100);
  color colorAlive = color(0,200,0);
  int X, Y, size;
  
  cell(int tempX, int tempY, int tempSize) 
  {
  X = tempX;
  Y = tempY;
  size = tempSize;
  }
  
  void display() { 
    stroke(20);
    if(alive)fill(colorAlive);else fill(colorDead);
    rect(X * size,Y * size,size,size);}
    
  void update() { //Beaheviour
  
  //Se carga el buffer
  
  int cA = 0; //Cuanta las celulas alrededor
  for (int x = -1;x < 2;x++) {
    for (int y = -1;y < 2;y++) {
      if (x != 0 || y != 0) {
        if(cellBuffer[constrain(X + x,0,width / cellSize - 1)][constrain(Y + y,0,height / cellSize - 1)]) cA++; }
    }
  }
  //if(cA != 0)println(cA);
  if (alive) {
    if (cA < 2 || cA > 3)alive = false;
  } 
  else {
    if (cA == 3)alive = true;} 
  
  }

}