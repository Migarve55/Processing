
node[] nodes;
float G = 0.5;
boolean acG = false;
int numberOfNodes = 1;
node over;

void setup()

{

size(900,600);

nodes = new node[500];
nodes[0] = new node(width / 2,height / 2,20.75,color(0,100,0),nodes);
//nodes[1] = new node(350,300,25.75,color(0,0,100),nodes); 
//nodes[2] = new node(300,200,25.75,color(100,0,0),nodes); 
}

void draw() 

{

  background(240);
  
  
  
for (node n: nodes) {
  if (n != null) {
  if(acG)n.update(G); else n.update(0.0); 
  n.display(); }
}
  fill(0);
  String text = "Gravity: " + str(-G) + " Activated: " + str(acG); 
  text(text,20,20);
  fill(color(100,0,0));
  if (over != null) text("Accel: " + str(over.a.x) + " " + str(over.a.y),20,40);
  
}

void keyPressed() {

  if (key == 'g' || key == 'G') {
    if (acG) acG = false; else acG = true;
  }

}

void mousePressed() {


createNode(mouseX, mouseY,nodes); 

}

void createNode(float tX, float tY, node[] nds) 

{

numberOfNodes++;
nodes[numberOfNodes - 1] = new node(tX,tY,22,color(random(0,255),random(0,255),random(0,255)),nds);


}