
ArrayList<Point> objects = new ArrayList<Point>();
Radar radar;

void setup() {

  size(920,670);
  
  //Generates a few objects
  for (int i = 0; i < 6;i++) {
    objects.add(new Point(0,i*25));
  }
  
  objects.add(new Point(0,30,0,0.1));
  
  radar = new Radar(50,50,width-150,height-150);
  
  frameRate(60);
  radar.updateRadar(objects);
  
}

void draw() {
  
  background(0);
  for (Point p : objects) {
    p.update();}
  radar.updateRadar(objects);
  radar.drawRadar();

}