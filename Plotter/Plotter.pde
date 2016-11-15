
import processing.serial.*;
Serial myPort;

String text = "Para manejarlo directamente pulsar 'c' (usar el ratón para activar el lápiz), para analizar la imagen pulsar 'a' \n y para para iniciar el dibujo pulsar 'd'"; 
String estado = "En reposo";

boolean DEBUG = false,analizado,analizando,controlando,lapiz,dibujando,ardD = false; //Ard Disponible;

int[] data = {0,0},imagePlotter;
int lstX,lstY;
float posX = 210,posY = 40;
float canvasSize = 300;

float D,alpha,beta,d = 250;
PVector pos, ver;

PImage image; 

//Brazos

float gamma,omega;

void setup()

{

size(900,600);
pos = new PVector(mouseX,mouseY);
ver = new PVector(0,0);
//float minD = sqrt(2 * sq(canvasSize));
//d = constrain(d,minD,canvasSize);
Conectar();

try {image = loadImage("image.jpg");}
catch(Exception e) {println(e);}

}

void draw()

{

  background(150);
  
  image(image,500,40,canvasSize,canvasSize);
  
  if (!dibujando) {
  if(controlando)drawCanvas(mouseX,mouseY);
  else drawCanvas(lstX,lstY);
  }
  text(text,20,380);
  text("Estado: " + estado + " ,Arduino disponible: " + ardD + " ,Lápiz: " + lapiz,20,420);
   
  if (controlando) { 
  data[0] = int(omega);
  data[1] = int(gamma);
  if(ardD)mandar(data); }
}

void keyPressed()
{
switch(key)
{
case 'c':
if (!(analizando || dibujando)) {
if(controlando){controlando = false;lstX = mouseX;lstY = mouseY;estado = "En reposo";} else {controlando = true;estado = "Controlando con el ratón";}}
break;
case 'a':
if (analizando) {
analizando = true;
estado = "Iniciando analizado de imagen"; 
imagePlotter = analizar(image,240,5);
}
break;
case 'd':
if(analizado && !dibujando){dibujar(imagePlotter);estado = "Iniciando dibujo";}
break; 
}

}

void mousePressed() {lapiz = true;}
void mouseReleased() {lapiz = false;}

void drawCanvas(int msX, int msY)

{

  pos.set(constrain(msX - posX,0.1,canvasSize),constrain(canvasSize - msY + posY,0,canvasSize));
  D = pos.mag()/2;
  alpha = atan(pos.y / pos.x);
  beta = acos(D / d); 
  ver.set(d * cos(alpha + beta),canvasSize + posY - d * sin(alpha + beta));

  //Dibuja el marco
  stroke(255);
  fill(100);
  rect(posX,posY,canvasSize,canvasSize);
  
  stroke(color(80,0,0));
  line(posX,posY + canvasSize,ver.x + posX,ver.y); //1 er brazo
  line(ver.x + posX,ver.y,pos.x + posX,canvasSize - pos.y + posY); //2 brazo

  //Textos
  omega = alpha + beta;
  gamma = PI - 2 * beta;
  fill(80);
  text("1º Brazo: " + str(degrees(omega)),posX + 5,posY + canvasSize + 20);
  text("2º Brazo: " + str(degrees(gamma)),posX + 120,posY + canvasSize + 20);
  
  //debug
  
  if (DEBUG) {
  stroke(color(255,0,0));
  line(posX,posY + canvasSize,pos.x + posX,canvasSize - pos.y + posY);
  stroke(color(0,0,255));
  line(ver.x + posX,ver.y,(D * cos(alpha)) + posX,canvasSize - D * sin(alpha) + posY);
  float h = sqrt(sq(d) - sq(D));
  text("H: " + str(h),posX + 5,posY + canvasSize + 40);
  text("D: " + str(D * 2),posX + 100,posY + canvasSize + 40);
  //float a = PVector.angleBetween(pos,ver);
  //print(degrees(beta)); println(degrees(gamma));
  }

}