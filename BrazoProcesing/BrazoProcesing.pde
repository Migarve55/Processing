import processing.serial.*;
Serial myPort;

int var1, var2, var3;
boolean c = false;

void setup()

{
  
  size(970,600);
  
  Serial.list();
 
  myPort = new Serial(this, "COM3", 9600);
  
  println("Esperando por la arduino");
  while(!c)
  {
  if (myPort.read() == 'P') {myPort.write('E'); c = true;} //Cuando detecta P de "Probando" manda E de "Eco"
  }
  println("Conectado a la arduino");
  
}

void draw()

{
  var1 = mouseX;
  var2 = mouseY;
  if (myPort.read() == 'A')
  {
  myPort.write(var1);
  myPort.write(var2);
  myPort.write(var3);
  println(var1 + "\t" + var2 + "\t" + var3);
  }
  background(0);
}