
class creature

{
  
  float x,y;
  PVector pos;
  int[][] nodes;
  int[][] strings;
  color Color;
  int radious = 20,stk = 5;

creature(float tempX, float tempY, int[][] tempN, int[][] tempS, color tC)  
{
x = tempX; y = tempY;
nodes = tempN;
strings = tempS;
Color = tC;
}

void display()

{
  
   strokeWeight(stk);
   stroke(100);
  for (int i = 0;i < nodes.length;i++) { //Primero van las cuerdas
   for (int e = 0; e < strings[i].length;e++) {
    line(nodes[i][0] + x,nodes[i][1] + y,nodes[strings[i][e]][0] + x,nodes[strings[i][e]][1] + y); 
   }
  }
  
   stroke(20);
   strokeWeight(1);
   fill(Color);
  for(int i = 0;i < nodes.length;i++) {
   ellipse(nodes[i][0] + x,nodes[i][1] + y,radious,radious);}
}

void update()

{
    /*
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
    */
}

}