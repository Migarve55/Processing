
lapiz[] l;
int lapices = 1;
int maxLap = 500;
int posibilidad = 100;

int bk = 0;

void setup() 
{
 size(960,700);
 noFill();
 //frameRate(60);
 l = new lapiz[maxLap];
 l[0] = new lapiz(width / 2,height / 2,10,color(0,200,0)); //Inicio (X,Y), longitud, y color
 stroke(255);
 background(bk);
}

void draw() 
{
  for (int i = 0;i < lapices;i++) {
  l[i].display(); }
  if (l[0].xpos < 0)
  {reset();}
}

void keyPressed()

{
if (key == 'r' || key == 'R')
{reset();}
}

class lapiz { 

  float xpos,ypos,angulo;
  float last_xpos, last_ypos,last_angulo = 0, radio;
  color lc;

  // The Constructor is defined with arguments.
  lapiz(float tempXpos, float tempYpos, float rad, color tmpLc) { 
    last_xpos = tempXpos;
    last_ypos = tempYpos;
    radio = rad;
    lc = tmpLc;
  }

  void display() 
  {
    stroke(255);
    //Dibuja la rama
    if (int(random(0,2)) == 1) // Decide si ir hor o ver
    {xpos = last_xpos + random(-radio,radio);ypos = last_ypos;}
    else
    {ypos = last_ypos + random(-radio,radio);xpos = last_xpos;}
    stroke(lc);
    line(last_xpos,last_ypos,xpos,ypos);
    //Crea otro objeto que las dibuja
    if (int(random(0,posibilidad)) == posibilidad - 1 && lapices < maxLap)
    {  
    lapices += 1;
    l[lapices - 1] = new lapiz(xpos,ypos,radio,lc);
    //l[lapices - 1] = null;
    }
    last_xpos = xpos; last_ypos = ypos; last_angulo = angulo;
  }

}

void reset()

{ 
 for(int i = 0; i < lapices;i++){ 
 l[i].last_xpos = width / 2;l[i].last_ypos = height / 2;}
 for(int i = 1; i < lapices;i++){ 
 l[i] = null;}
 lapices = 1;
 println("Reset");
 background(bk);
}

  //angulo = radians(random(0,360));
    //arc(width / 2,height / 2,radio,radio,last_angulo,angulo);
    //line(radio * cos(last_angulo) + width / 2,radio * sin(last_angulo) + height / 2,(radio + 10) * cos(last_angulo) + width / 2,(radio + 10) * sin(last_angulo) + height / 2);
    //radio += 10;
    //line(radio * cos(last_angulo) + width / 2,radio * sin(last_angulo) + height / 2,radio * cos(angulo) + width / 2,radio * sin(angulo) + height / 2);