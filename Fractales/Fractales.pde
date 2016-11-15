
Rama[] r;
int ramas = 1;
int maxRamas = 500;

int bk = 0;

void setup() 
{
 size(960,700);
 frameRate(30);
 r = new Rama[maxRamas];
 r[0] = new Rama(1,width / 2,height);
 background(bk);
}

void draw() 
{
  for (int i = 0;i < ramas;i++) {
  r[i].display(); }
  if (r[0].ypos < 1.0)
  {reset();}
}

void keyPressed()

{
if (key == 'r' || key == 'R')
{reset();}
}

class Rama { 
  int der;
  float xpos,ypos;
  float last_xpos, last_ypos;

  // The Constructor is defined with arguments.
  Rama(int d, float tempXpos, float tempYpos) { 
    der = d;
    last_xpos = tempXpos;
    last_ypos = tempYpos;
  }

  void display() 
  {
    stroke(0);
    //Dibuja la rama
    xpos = last_xpos + random(-20,20);
    ypos = last_ypos - random(10);    
    stroke(color(random(0,255),random(0,255),random(0,255)));
    line(last_xpos,last_ypos,xpos,ypos);
    //Crea otro objeto que las dibuja
    if (int(random(0,10)) == 1 && ramas < maxRamas)
    {  
    ramas += der;
    r[ramas - 1] = new Rama(der,xpos,ypos);
    /*for(int i = ramas - der;i < ramas + 1;i++) {
    r[i - 1] = new Rama(der,xpos,ypos); }*/
    //println("Nueva rama creada!");
    }
    last_xpos = xpos; last_ypos = ypos; 
  }

}

void reset()

{ 
 for(int i = 0; i < ramas;i++){ 
 r[i].last_xpos = width / 2;r[i].last_ypos = height;}
 for(int i = 1; i < ramas;i++){ 
 r[i] = null;}
 ramas = 1;
 println("Reset");
 background(bk);
}