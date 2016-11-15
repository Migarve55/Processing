
class Point 

{

  float posX, posY;
  String name;
  color Color;
  
  Point(float tX, float tY, String tN, color tC) {posX = tX;posY = tY; name = tN; Color = tC;}

  void display(float z, float cX, float cY) 

  {
  
  float pX = posX * (1 + z / 100) + cX;
  float pY = posY * (1 + z / 100) + cY;
    
  fill(Color);
  rect(pX,pY,2,2);
  fill(0);
  text(name,pX + 5,pY + 5);
  
  }

}

class Rectangle

{

  int posX, posY;
  int sizeX,sizeY;
  String name;
  color Color;
  
  Rectangle(int tX, int tY, int tSX, int tSY, String tN, color tC) {posX = tX;posY = tY;sizeX = tSX;sizeY = tSY; name = tN; Color = tC;}
  
  void display() 

  {
  
  fill(Color);
  rect(posX,posY,sizeX,sizeY);
  fill(0);
  text(name,posX + 5,posY + 5);    
  
  }
  
}