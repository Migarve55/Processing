import processing.serial.*;

Serial myPort;
float rx = 0.0, ry = 0.0;

void setup()  {
  size(640, 360, P3D);
  noStroke();
  fill(204);
  // Open whatever port is the one you're using.
  println("Ports: ");
  for (String ser : Serial.list())
    println("\t" + ser);
  myPort = new Serial(this, Serial.list()[2], 57600); 
  myPort.bufferUntil(';');
  println("Starting");
}

void draw()  {
  background(0);
  lights();
  //Draw cube
  ortho(-width/2, width/2, -height/2, height/2);
  translate(width/2, height/2, 0);
  rotateX(radians(rx)); 
  rotateZ(radians(-ry)); 
  box(160); 
}

void serialEvent(Serial p) { 
  String[] parts = p.readString().split("\t");
  rx = parseFloat(parts[0]);
  ry = parseFloat(parts[1].substring(0, parts[1].length() - 1));
} 