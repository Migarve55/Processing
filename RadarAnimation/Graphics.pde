
class Radar {

  private color lineColor = color(0,185,20);
  private int radious;
  private float xCorner,yCorner, xPos, yPos,h,w;
  private ArrayList<RadarPoint> list = new ArrayList<RadarPoint>();
  
  //Drawing options
  private int radarStrips = 4; // Always add 1
  private double radarLineIncrease = 1.4;
  
  //Drawing animation variables
  private int initialDegree = 45+180;
  private int finalDegree = 135+180;
  private float radarPosition = initialDegree;
  
  //In world variables
  protected PVector position = new PVector(0,0);
  protected int distance = 100; 
  
  Radar(int xPos, int yPos, int w, int h) {
  
  this.xPos = xPos;
  this.yPos = yPos;
  this.h = h;
  this.w = w;
  xCorner = xPos + (w / 2);
  yCorner = yPos + h;
  radious = h*2 - 80;
  
  }
  
public void updateRadar(ArrayList<Point> objects) {
  list.clear();
  for(Point obj : objects) {
    //Variables to do calculations
    PVector p = new PVector(obj.getPos().x - position.x,obj.getPos().y - position.x);
    float d = dist(position.x,position.y,obj.getPos().x,obj.getPos().y);
    float angle = PVector.angleBetween(new PVector(1,0),p);
    //println(String.format("Object with coords: %.3f %.3f has an angle to radar of: %f at a distance of %.3f",obj.getPos().x,obj.getPos().y,degrees(angle),d));
    //println(String.format("%b %b %b",d <= distance,angle >= radians(initialDegree),angle <= radians(finalDegree)));
    if (d <= distance && angle >= radians(initialDegree-180) && angle <= radians(finalDegree-180)) { //If it is near enought
      //Translate it to graphic coordiantes inside radar
      float r = map(d,0,distance,0,radious/2);
      float newX = r*cos(angle) + xCorner;
      float newY = -r*sin(angle) + yCorner;
      list.add(new RadarPoint(newX,newY));
    }
  }
}

private boolean isInSigth(Point obj) {
  PVector p = new PVector(obj.getPos().x - position.x,obj.getPos().y - position.x);
  float angle = PVector.angleBetween(new PVector(1,0),p);
  float d = dist(position.x,position.y,obj.getPos().x,obj.getPos().y);
  if (d <= distance && angle > radians(initialDegree) && angle < radians(finalDegree)) {
    return true;}
  return false;
}
  
public void drawRadar() {
  
  //Draw the main frame
  noFill();
  stroke(lineColor);
  strokeWeight(3);
  textSize(20);
  rect(xPos,yPos,xPos+w,yPos+h);
  arc(xCorner,yCorner,radious,radious,radians(initialDegree),radians(finalDegree),PIE);
  strokeWeight(1);
  for(int i = 0; i <= radarStrips;i++) {
    int section = radious / radarStrips;
    noFill();
    arc(xCorner,yCorner,section*i,section*i,radians(initialDegree),radians(finalDegree));
    fill(lineColor);
    text(str(i*distance/radarStrips)+"m",section/2*i*cos(radians(finalDegree))+xCorner+10,section/2*i*sin(radians(finalDegree))+yCorner+10);}
  //Radar line;
  strokeWeight(2);
  line(radious/2*cos(radians(radarPosition))+xCorner,radious/2*sin(radians(radarPosition))+yCorner,xCorner,yCorner);
  if (radarPosition < finalDegree) {
    radarPosition += radarLineIncrease;}
  else {
    radarPosition = initialDegree;}
    //updateRadar();}
  //Draw the objects
  for(RadarPoint rp : list) {
    PVector l = new PVector(cos(radians(radarPosition)),sin(radians(radarPosition)));
    PVector p = new PVector(-xCorner + rp.x,-yCorner + rp.y);
    if (degrees(PVector.angleBetween(l,p)) < 2) { //If its in position 
       rp.makeVisible();} //Make it visible
    rp.update();
    }
  //Draw the text
  fill(lineColor);
  text(String.format("OIR: %d",list.size()),xPos+20,yPos+25);
  text(String.format("ESC: %.2f",radarPosition),xPos+20,yPos+45);
}

}

class RadarPoint {

  //Drawing settings
  private color pointColor = color(0,185,20);
  private int initialResonance = 100;
  private float decreaseFactor = 0.00005;
  //Internal variables
  private int resonance = 0;
  public float x, y;
  
  RadarPoint(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  void update() {
    if (resonance > 0) {
      resonance -= decreaseFactor;
      stroke(pointColor,map(resonance,0,100,0,255));
      strokeWeight(10);
      point(x,y);}
  }
  void makeVisible() {
    resonance = initialResonance;
  }

}