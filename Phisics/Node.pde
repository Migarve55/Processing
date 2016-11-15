

class node 

{

PVector f = new PVector(0,0); // Fisica
PVector a = new PVector(0,0);
PVector v = new PVector(0,0);
PVector x = new PVector(0,0);
PVector[] forces;
float mass;

color Color;

node[] attachedNodes;
  
node (float tempX,float tempY, float tempM, color tempC, node[] tempAttach)

{
x = new PVector(tempX,tempY);
Color = tempC;
mass = tempM;
attachedNodes = tempAttach;
forces  = new PVector[attachedNodes.length];
}

void update(float g) 
{
//Calcula todas las fuerzas
f.set(0,0);
for(int i = 0;i < numberOfNodes;i++)  
{
if (attachedNodes[i] != this) {
float angle = atan(attachedNodes[i].x.x / attachedNodes[i].x.y); 
PVector externalForce = new PVector(attachedNodes[i].mass * g * cos(angle),attachedNodes[i].mass * g * sin(angle));
f.add(externalForce); }
} 
if (x.y + (mass * 1.2 / 2) >= height) {f.set(f.x,-mass * g);}
//Aceleracion
a.x = f.x / mass;
a.y = f.y / mass + g;
//Ecuaciones del MRUA
//a.set(0,4.5);
v.add(a);
x.add(v);
x.y = constrain(x.y,0 + mass * 1.2 / 2,height - mass * 1.2 / 2);
x.x = constrain(x.x,0 + mass * 1.2 / 2,width - mass * 1.2 / 2);
//println(v.y);
}

void display() {
  
for (node n: attachedNodes)  
  {
    if (n != null) {
   strokeWeight(8);
   stroke(100);
   line(x.x,x.y,n.x.x,n.x.y); }
  }

strokeWeight(1);
stroke(0);
if (x.dist(new PVector(mouseX,mouseY)) <= mass * 1.2/2) { 
fill(Color - 50);
over = this;
} 
else fill(Color);
ellipse(x.x,x.y,mass * 1.2,mass * 1.2);
}

void addJoin(node newNode) 

{

 node[] attachedNode = (node[]) append(attachedNodes, newNode);

}

}