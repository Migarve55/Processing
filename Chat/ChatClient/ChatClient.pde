import controlP5.*;
import processing.net.*;

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
String IP = "192.168.1.35"; 

boolean sC = false;
boolean cF = false;
String output = "";

String UserName = "Javier";

void setup()

{

size(970,600);  

            
  
sC = true;  
try {c = new Client(this, IP, PUERTO);} //Inicia el server
catch (Exception e) {println("No se ha podido conectar al server por el error: " + e); sC = false;}

if(sC)println("Server conectado en el puerto: " + PUERTO);
myTextarea.append("Conectado al servidor en el puerto: " + PUERTO + " con la IP: " + IP + "\n\n"); 

}

void draw()

{

 if(sC)recibir(); //Si el server esta funcionando

 background(0);

}

  //Código para el output

void keyPressed()

{
  
  output += key;  
  
   if (keyCode == BACKSPACE && output.length() > 1)output = output.substring(0, output.length() - 2);   // Borrar 
  
   if (key == ENTER && output != "")
   {

     try {mandar(output,'U');}
     catch (Exception e) {myTextarea.append("Error al lanzar el mensaje: " + e);}
     myTextarea.append("Cliente: " + output);
     output = "";

   } 
 
}