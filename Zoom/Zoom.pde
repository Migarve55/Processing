
float cameraX = 0, cameraY = 0, zoom = 15; //Camara

float fieldX = 1000, fieldY = 1000; //Campo

Point[] points;

void setup() 

{

  size(900,600);
  points = new Point[15];

  for (int i = 0;i < points.length;i++) {
    points[i] = new Point(random(0,1000),random(0,1000),"Lugar " + str(i),color(0,50,0));
  }

}

void draw() 

{

  background(250);
  fill(0);
  text("Zoom: " + str(zoom) + "% " + "Camera: " + str(cameraX) + " " + str(cameraY),5,15);
  
  for (Point p: points) {
    if (p != null)p.display(zoom, cameraX, cameraY);
  }

}

void keyPressed()

{

  switch(key) 
  {
   case 'w': 
   cameraY = constrain(cameraY + 1,0,fieldY);
   break;
   case 's': 
   cameraY = constrain(cameraY - 1,0,fieldY);
   break;
   case 'a': 
   cameraX = constrain(cameraX + 1,0,fieldX);
   break;
   case 'd': 
   cameraX = constrain(cameraX - 1,0,fieldX);
   break;
   // ZOOM     
   case '+':
   zoom = constrain(zoom + 1,0,100);
   break;
   case '-':
   zoom = constrain(zoom - 1,0,100);
   break;
  }

}