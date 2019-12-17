
class Vector {

  public PVector pos; 
  public PVector vec; 
  public boolean dragging = false;
  //Color
  private final color POINT_COLOR = color(#22D313);
  private final color LINE_COLOR = color(#E00909);
  private final color MOUSE_OVER_COLOR = color(#2A9820);
  private final color MOUSE_CLICKED_COLOR = color(#145007);
  private color CURRENT_COLOR;
  //Drawing options
  private final float POINT_DIAMETER = 25.0;
  
  public Vector(float x, float y, float vx, float vy) {
  
    pos = new PVector(x, y);
    vec = new PVector(vx, vy);
    CURRENT_COLOR = POINT_COLOR;
    
  }
  
  public void drawVector() {
    stroke(#E00909);
    line(pos.x,pos.y,vec.x,vec.y);
    noStroke();
    fill(#22D313);
    ellipse(pos.x,pos.y,POINT_DIAMETER,POINT_DIAMETER);
    ellipse(vec.x,vec.y,POINT_DIAMETER,POINT_DIAMETER);
  }
  
  public void update() {
      if(!mousePressed) {
        dragging = false;}   
      if (isOverBottom() || dragging) {
        CURRENT_COLOR = MOUSE_OVER_COLOR;
        if(mousePressed) {
          CURRENT_COLOR = MOUSE_CLICKED_COLOR;
          dragging = true;
          pos.x = mouseX;
          pos.y = mouseY;}
      }
      else if (isOverHead() || dragging) {
        CURRENT_COLOR = MOUSE_OVER_COLOR;
        if(mousePressed) {
          CURRENT_COLOR = MOUSE_CLICKED_COLOR;
          dragging = true;
          vec.x = mouseX;
          vec.y = mouseY;}
      }
      else {
        CURRENT_COLOR = POINT_COLOR;}
  }
  
  public boolean isOverBottom() {
    if(pos.dist(new PVector(mouseX, mouseY)) <= POINT_DIAMETER/2) {
      return true;}
    return false;
  }
  public boolean isOverHead() {
    if(vec.dist(new PVector(mouseX, mouseY)) <= POINT_DIAMETER/2) {
      return true;}
    return false;
  }

}