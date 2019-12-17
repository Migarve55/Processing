
ArrayList<Point> objects = new ArrayList<Point>();
Radar radar;

Point p = new Point(0,30,0,0.1);

void setup() {

  size(920,670);
  
  objects.add(p);
  
  radar = new Radar(50,50,width-150,height-150);
  
  frameRate(60);
  radar.updateRadar(objects);
  
}

void draw() {
  
  background(0);
  
  p.setVel(map(mouseX,0,width,-1,1),
           map(mouseY,0,height,1,-1)
           );
  println(p.getVel());
  
  for (Point p : objects) {
    p.update();}
  //radar.updateRadar(objects);
  radar.drawRadar();

}