

void Conectar()

{
  
  int t,p = 0;                //Numero del puerto para la string
  
  int serialNum = Serial.list().length;
  if (serialNum > 0)println("El número de puertos disponibles es: " + serialNum);else println("No hay puertos disponibles");
  
  for (int i = 0; i < serialNum; i++)
  {
    
  try {myPort = new Serial(this, Serial.list()[i], 9600);} //El puerto depende de la arduino
  catch(Exception e) {println("Ha habido el siguiente error abriendo el puerto: " + e); break;}
  delay(500); // Le da tiempo a la arduino a conectarse
  
  println("Esperando por la arduino en el puerto: " + Serial.list()[i]);
  
  t = millis();
  while((millis() - t) < 3000) //Espera tres segundos probando el puerto
  {
  if (myPort.read() == 'P') 
  {myPort.write('E'); ardD = true; p = i; break;} //Cuando detecta P de "Probando" manda E de "Eco" y cierra el bucle
  }
  if (ardD)break;
  println("No hay una arduino en el puerto: " + Serial.list()[i]);
  myPort.stop(); //Cierra el puerto
  }
  
  if (ardD) {println("Conectado a la arduino en el puerto: " + Serial.list()[p]);}
  else {println("No se detecta ninguna arduino");}
  
}  

void mandar(int[] array_data)

{
  if (ardD) {
  myPort.write('%');
  for(int i = 0;i < array_data.length;i++) {
  myPort.write(str(array_data[i]));
  myPort.write(',');
  }
  myPort.write('\n'); //salto
  }
}  