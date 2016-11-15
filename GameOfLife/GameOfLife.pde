
int cellSize = 10;
cell[][] grid;
boolean[][] cellBuffer;

boolean updateCells = true;

void setup() 

{
  
size(900,600);
grid = new cell[width / cellSize][height / cellSize];
cellBuffer = new boolean[width / cellSize][height / cellSize];

  for (int x = 0;x < width / cellSize;x++) {
    for (int y = 0;y < height / cellSize;y++) {
       grid[x][y] = new cell(x,y,cellSize);
       cellBuffer[x][y] = grid[x][y].alive;
    }
  }

}

void draw()

{
background(255);

  loadBuffer();
  for (int x = 0;x < width / cellSize;x++) {
    for (int y = 0;y < height / cellSize;y++) {
      if (updateCells)grid[x][y].update();
      grid[x][y].display();
    }
  }

}

void keyPressed() 

{

  switch(key) {
  case 'r':
  reset();
  break;
  case 's':
  startRandom(15);
  break;
  case'p':
  updateCells = !updateCells;
  break;
  }

}

void mousePressed()

{

grid[mouseX / cellSize][mouseY / cellSize].alive = !grid[mouseX / cellSize][mouseY / cellSize].alive;

}

void loadBuffer() 

{
 for (int x = 0;x < width / cellSize;x++) {
    for (int y = 0;y < height / cellSize;y++) {
      cellBuffer[x][y] = grid[x][y].alive;
    }
  } 
}

void startRandom(int n)

{
  for (int i = 0;i <= n;i++) {
    int x = int(random(0,width / cellSize));
    int y = int(random(0,height / cellSize));
    grid[x][y].alive = true; 
  }
}

void reset() 

{
  for (int x = 0;x < width / cellSize;x++) {
    for (int y = 0;y < height / cellSize;y++) {
      grid[x][y].alive = false; 
    }
  }
}