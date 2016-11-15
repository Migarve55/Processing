/*

 Versión 1.3 funcional - Programa creado por Miguel Garnacho Vélez en 12 / 2015 - 2016
 
 FUNCIONALIDAD
 
 - Mandar mensajes a través de internet, solo dos usuarios
 - Menu de opciones gráficas 
 - Guardar las opciones
 
 ERRORES:
 
 Caractéres extraños al mandar el mensaje.
 
 FUTURAS MEJORAS:
 
 Opciones de server (Admin)
 Multiconexion

*/

import controlP5.*;
import processing.net.*;

Server s;
Client c;

ControlP5 cp5;
Textarea myTextarea;
Textarea teclado;
Textarea usuarios;
Textarea opciones;

int modo = 1;

//Opciones

color bk = 100,
textC = color(0,255,0),
chatBk = 0,
chatFg = 0;
int PUERTO = 12000;

boolean sF = false;
boolean cF = false;
boolean usandoTeclado;
String output = "";

String UserName = "Miguel";

void setup()

{

size(970,600);  

cargar();
crearInterfaz();  
  
sF = true;  
try {s = new Server(this,PUERTO);} //Inicia el server
catch (Exception e) {println("No se ha podido lanzar el server por el error: " + e); sF = false;}

if(sF)println("Server lanzado en el puerto: " + PUERTO);
myTextarea.append("Servidor lanzado en el puerto: " + PUERTO + " con la IP: " + s.ip() + "\n\n"); 

}

void draw()

{

 if(sF) //Si el server esta funcionando
 {
   
   recibir();

 }  

 display(); // Interfaz
 background(bk);

}

  //Código para el output

void keyPressed()

{
  
  if(keyCode==TAB)modo = 1;
  
  if (usandoTeclado)
  {
  
  output += key;  
  
  if (keyCode == BACKSPACE && output.length() > 1)output = output.substring(0, output.length() - 2); //Borrar
  
   if (key == ENTER && output != "")
   {
     mandar(output, 'U');
     output = "";
   } 
   
  } 
 
}