
creature[] creatures; 

int MaxCreatures = 1, generation = 0;
String species = "";

void setup()

{
  
 size(900,600);
creatures = new creature[MaxCreatures];

// Crea el primero aleatorio
restart();

}

void draw()

{
  
  background(200);

  for (creature c: creatures) { 
  c.display();
  }
  fill(0);
  text("Species:" + species + " Gen: "+ str(generation),20,20);

}

void keyPressed() {if(key == 'r' || key == 'R')restart();}

void restart() 

{

creatures[0] = null;
// Crea el primero aleatorio
int number_of_nodes = int(random(2,10));
int maxSize = 120;
int[][] newNodes, newStrings;
newNodes = new int[number_of_nodes + 1][2];
newStrings = new int[number_of_nodes + 1][number_of_nodes + 1];

for (int i = 0;i <= number_of_nodes;i++) {

newNodes[i][0] = int(random(-maxSize,maxSize));
newNodes[i][1] = int(random(-maxSize,maxSize));
for (int e = 0;e <= int(random(1,number_of_nodes));e++) { 
newStrings[i][e] = int(random(0,number_of_nodes));}

}

creatures[0] = new creature(width / 2,height / 2,newNodes,newStrings,color(random(0,255),random(0,255),random(0,255)));
species = "S" + str(number_of_nodes + 1) + "A" + str(max(newStrings[0]));
generation++;

}