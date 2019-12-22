PImage image;
PGraphics newImage;
    int pix = 0,loc;
void setup() {
  size(700,545);
  try {image = loadImage("image.jpg");}
  catch(Exception e) {println(e);}
  background(0);
  newImage = createGraphics(image.width, image.height);
  newImage.beginDraw();
  //La funcion mejor que se ejecute solo una vez
  //monet(img,16);

}

void draw()

{
//monet(image, 16);
  smooth();
  loc = int(random(0,image.width * image.height));
  pix++;
  int y = loc / image.width;
  int x = loc - y * image.width;
  //loadPixels();
  float r = image.pixels[loc] >> 16 & 0xFF;
  float g = image.pixels[loc] >> 8 & 0xFF; 
  float b = image.pixels[loc] & 0xFF;
  noStroke();
  fill(r,g,b,100);
  ellipse(x,y,16,16);
  //stroke(r,g,b);
  //poligon(int(random(3,20)),16,int(random(1,3)),x,y);
  
  if (image.width * image.height == pix || key == 'e' || key == 'E')
  {
  println("Terminado");
  newImage.endDraw();
  newImage.save("newImage.jpg");  
  exit();
  }
}
void poligon(int lados, int radio, int salto, int posX, int posY)

{
  float lstX = 0, lstY = 0;
  //beginShape();
  for(int i = 0; i < lados + 1; i++)
  {
   float grados = (360.0 / lados);
   float X = radio * cos(radians(grados * (i + salto))) + posX;
   float Y = radio * sin(radians(grados * (i + salto))) + posY;
   lstX = radio * cos(radians(grados * (i))) + posX;
   lstY = radio * sin(radians(grados * (i))) + posX;
   line(X,Y,lstX,lstY);
   //endShape();
   //println("e");
  }
}
void monet(PImage img, int pointillize)

{
  
  println("Ancho: " + img.width);
  println("Altura: " + img.height);

  for (int loc = 0;loc < img.width * img.height;loc++)
  {
  smooth();
  int y = loc / img.width;
  int x = loc - y * img.width;
  // Look up the RGB color in the source image
  loadPixels();
  float r = img.pixels[loc] >> 16 & 0xFF;
  float g = img.pixels[loc] >> 8 & 0xFF; 
  float b = img.pixels[loc] & 0xFF;
  noStroke();
  fill(r,g,b,100);
  ellipse(x,y,pointillize,pointillize);

  } 
}