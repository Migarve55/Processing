
void recibir()

{

 if (c != null) cF = false; else cF = true;
 
  //Código para el input 

   if (c != null) {
      if (c.available() > 0) 
      { 
        switch(c.read())
        {
        
        case'M':myTextarea.append("Mensaje desde: " + c.ip() + ": " + c.readString());break; // M de mensaje
        case'U':myTextarea.append("Mensaje de: " + c.readStringUntil(':') + ": " + c.readString());break; // U de usuario, se usa unicamente para clientes que usan un identificador
        case'E':break; // E de Error
        case'D':break; // D de desconexion
        
        default:myTextarea.append("Lectura ni identificada: " + c.ip() + ": " + c.readString());
        
        }
      }
    }

}

void mandar(String out, char m)

{
  
     try 
     {     
     switch(m)  
     {
     case 'M':c.write('M' + out);myTextarea.append("Server: " + output);break;
     case 'U':c.write('U' + UserName + ':' + out);myTextarea.append(UserName + ": " + output);break;
     }
     }
     catch (Exception e) {myTextarea.append("Error al lanzar el mensaje: " + e);}

}