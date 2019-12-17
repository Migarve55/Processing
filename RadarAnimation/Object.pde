/**
* This class is a demo to use the radar
*/

class Point {
  private PVector position = new PVector(0,0);
  private PVector velocity = new PVector(0,0);
  
  public Point(float x, float y) {
    this.position = new PVector(x, y);
  }
  
  public Point(float x, float y, float vx, float vy) {
    this.position = new PVector(x, y);
    this.velocity = new PVector(vx, vy);
  }
  
  public void setPos(float x, float y) {
    position.x = x;
    position.x = y;
  }
  
  public void setVel(float x, float y) {
    velocity.x = x;
    velocity.y = y;
  }
  
  public PVector getPos() {return position;}
  public PVector getVel() {return velocity;}
  
  public void update() {
    position.x += velocity.x;
    position.y += velocity.y;
  }
}