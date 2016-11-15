

int[] analizar(PImage img, int checkColor, int offset)
{
int [] dataPlot = {}; 
int loc = 0, i = 0;

img.loadPixels();
while(loc < image.width * image.height) 
{

if (checkColor - offset < image.pixels[loc] && image.pixels[loc] < checkColor + offset)
{dataPlot[i] = loc;i++;}

estado = "Analizando: " + str(map(loc,0,image.width * image.height,0,100)) + "% ";
loc++;
}
return dataPlot;
}

void dibujar(int [] imgPlot)
{
lapiz = false;

  for (int pixel = 0;pixel < imgPlot.length;pixel++) 
  {
   mandar(data);
   delay(50);
   lapiz = true;
   delay(20);
   lapiz = false;
   
   estado = "Dibujando: " + str(map(pixel,0,imgPlot.length,0,100)) + "% ";
  }

}