
PVector g;
player ply;
platform[] p;

//Niveles

int[][] platPos = {{100,480},{150,460},{200,440}};

void setup() 

{
  frameRate(60);
  size(700,500);
  g = new PVector(0,4.9);
  p = new platform[platPos.length];
  
  for (int i = 0;i < platPos.length;i++)
  {p[i] = new platform(new PVector(80,10),new PVector(platPos[i][0],platPos[i][1]));}
  //p[i] = new platform(new PVector(80,20),platPos[0][0],platPos[0][1]);
  ply = new player(new PVector(width / 2,height / 2), new PVector(0,0), new PVector(0,0)); 
}

void draw() 

{
  background(255);
  ply.display();
  ply.move(key);
  displayMap(p);
}