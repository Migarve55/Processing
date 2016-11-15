/**
 * Chain. 
 * 
 * One mass is attached to the mouse position and the other 
 * is attached the position of the other mass. The gravity
 * in the environment pulls down on both. 
 */

Spring2D[] SpringArray;
int chainNumber = 20;

boolean fijada = false;
int stcX, stcY;

float gravity = 5;
float mass = 2.0;

void setup() 
{
  size(640, 360);
  fill(255, 126);
  SpringArray = new Spring2D[chainNumber];
  // Inputs: x, y, mass, gravity
  for(int i = 0; i < chainNumber; i++)
  {
  SpringArray[i] = new Spring2D(0.0, width/2, mass, gravity);}
}

void draw() {
  background(0);
  if (!fijada)
  {
  SpringArray[0].update(mouseX, mouseY);
  SpringArray[0].display(mouseX, mouseY); 
  }
  else
  {
  SpringArray[0].update(stcX, stcY);
  SpringArray[0].display(stcX, stcY);
  }
  for(int i = 1; i < chainNumber; i++)
  {
  SpringArray[i].update(SpringArray[i - 1].x, SpringArray[i - 1].y);
  SpringArray[i].display(SpringArray[i - 1].x, SpringArray[i - 1].y);
  }
}

void mousePressed()

{
  if(fijada)
  {fijada=false;}
  else{
  fijada=true;
  stcX = mouseX; stcY = mouseY;
  }
}

class Spring2D {
  float vx, vy; // The x- and y-axis velocities
  float x, y; // The x- and y-coordinates
  float gravity;
  float mass;
  float radius = 20;
  float stiffness = 0.2;
  float damping = 0.7;
  
  Spring2D(float xpos, float ypos, float m, float g) {
    x = xpos;
    y = ypos;
    mass = m;
    gravity = g;
  }
  
  void update(float targetX, float targetY) {
    // X
    float forceX = (targetX - x) * stiffness;
    float ax = forceX / mass;
    vx = damping * (vx + ax);
    x += vx;
    // Y
    float forceY = (targetY - y) * stiffness;
    forceY += gravity;
    float ay = forceY / mass;
    vy = damping * (vy + ay);
    y += vy;
  }
  
  void display(float nx, float ny) {
    noStroke();
    ellipse(x, y, radius*2, radius*2);
    stroke(255);
    line(x, y, nx, ny);
  }
}