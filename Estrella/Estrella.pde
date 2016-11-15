

void setup()

{
  //loop();
  size(500,500);
  background(255);
  for (int i = 1;i < 25;i++)
  {
    color c = color(random(0,255),random(0,255),random(0,255));
    stroke(c + 20);
    fill(c);
  poligon(21,i * 20,5,width / 2,height / 2);} //Sides, radious, skip, x pos, y pos
}

void loop()

{
  //poligon(5,80,1,width / 2,height / 2); //Sides, radious, skip, x pos, y pos
  background(255);
} 

void poligon(int lados, int radio, int salto, int posX, int posY)

{
  float lstX = 0, lstY = 0;
  beginShape();
  for(int i = 0; i < lados + 1; i++)
  {
   float grados = (360.0 / lados);
   float X = radio * cos(radians(grados * (i + salto))) + posX;
   float Y = radio * sin(radians(grados * (i + salto))) + posY;
   lstX = radio * cos(radians(grados * (i))) + posX;
   lstY = radio * sin(radians(grados * (i))) + posX;
   line(X,Y,lstX,lstY);
   endShape();
   //println("e");
  }
}