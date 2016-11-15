
void crearInterfaz()

{
  
  cp5 = new ControlP5(this);
  
   /* cp5.addTab("chatTab")
     .setColorBackground(bk)
     .setColorLabel(textC)
     .setColorActive(color(255,128,0))
     .setLabel("Chat")
     .setId(1)
     ;
     
    cp5.addTab("usuariosTab")
     .setColorBackground(bk)
     .setColorLabel(textC)
     .setColorActive(color(255,128,0))
     .setLabel("Usuarios")
     .setId(2)
     ;  
     
    cp5.addTab("opcionesTab")
     .setColorBackground(bk)
     .setColorLabel(textC)
     .setColorActive(color(255,128,0))
     .setLabel("")
     .setId(3)
     ;  */
  
  cp5.addColorWheel("texto" , 50 , 260 , 200 ).setRGB(textC);
  cp5.addColorWheel("fondo" , 260 , 260 , 200 ).setRGB(chatBk);
   
  cp5.addButton("guardar")
     .setValue(0)
     .setPosition(50,500)
     .setSize(100,20)
     ;
     
  cp5.addButton("cambiarUsuario")
     .setValue(0)
     .setPosition(160,500)
     .setSize(100,20)
     ;   
  
  ButtonBar b = cp5.addButtonBar("bar")
     .setPosition(0, 0)
     .setSize(width, 20)
     .addItems(split("a b c"," "))
     ;
     
    b.changeItem("a","text","Chat");
    b.changeItem("b","text","Usuarios");
    b.changeItem("c","text","Opciones");   

  myTextarea = cp5.addTextarea("chat")
                  .setPosition(50,50)
                  .setSize(width - 100,height - 120) 
                  .setFont(createFont("console",12))
                  .setLineHeight(14)
                  .setColor(textC)
                  .setColorBackground(chatBk)
                  .setColorForeground(chatFg);
                  ;
                  
   teclado = cp5.addTextarea("teclado")
                  .setPosition(50,550)
                  .setSize(width - 100,20) 
                  .setFont(createFont("console",12))
                  .setLineHeight(14)
                  .setColor(textC)
                  .setColorBackground(chatBk)
                  .setColorForeground(chatFg);
                  ;  
                  
   usuarios = cp5.addTextarea("usuarios")
                  .setPosition(50,50)
                  .setSize(width - 100,height - 220)
                  .setFont(createFont("console",12))
                  .setLineHeight(14)
                  .setColor(textC)
                  .setColorBackground(chatBk)
                  .setColorForeground(chatFg);
                  ;  
                  
   opciones = cp5.addTextarea("opciones")
                  .setPosition(50,50)
                  .setSize(width - 100,height - 420)
                  .setFont(createFont("arial",12))
                  .setLineHeight(14)
                  .setColor(textC)
                  .setColorBackground(chatBk)
                  .setColorForeground(chatFg);
                  ;                
                  
   /*//cp5.getController("chat").moveTo("chatTab");
   //cp5.getController("teclado").moveTo("chatTab");    
   
   //cp5.getController("usuarios").moveTo("usuariosTab");    
   
   //cp5.getController("opciones").moveTo("opcionesTab");    
   cp5.getController("texto").moveTo("opcionesTab");    
   cp5.getController("fondo").moveTo("opcionesTab");    
   cp5.getController("guardar").moveTo("opcionesTab");    */
                  
}           

void display()

{

switch (modo)

{

case 1: // Chat
usandoTeclado = true;
myTextarea.show();
usuarios.hide();
opciones.hide();
cp5.get(ColorWheel.class,"texto").hide();
cp5.get(ColorWheel.class,"fondo").hide();
cp5.get(Button.class,"guardar").hide();
cp5.get(Button.class,"cambiarUsuario").hide();

teclado.setText(output);
break;

case 2: //Usuarios
usandoTeclado = false;
myTextarea.hide();
usuarios.show();
opciones.hide();
cp5.get(ColorWheel.class,"texto").hide();
cp5.get(ColorWheel.class,"fondo").hide();
cp5.get(Button.class,"guardar").hide();
cp5.get(Button.class,"cambiarUsuario").hide();

if (cF)
{
try {usuarios.setText("Puerto usado:" + PUERTO + "\n IP del cliente: " + c.ip());}
catch (Exception e) {/*usuarios.append("Error: " + e);*/}
}
else {usuarios.setText("No hay clientes");}

break;

case 3: //Opciones
myTextarea.hide();
usuarios.hide();
opciones.show();
cp5.get(ColorWheel.class,"texto").show();
cp5.get(ColorWheel.class,"fondo").show();
cp5.get(Button.class,"guardar").show();
cp5.get(Button.class,"cambiarUsuario").show();

opciones.setText
("\nPuerto usado:" + PUERTO 
+ "\n IP del servidor: " + s.ip()
+ "\n Nombre de usuario: " + UserName
+ "\n\nOpciones gráficas: "
+ "\nColor de fondo: " + bk
+ "\nColor de texto: " + textC
+ "\nColor de fondo de la consola: " + chatBk
+ "\nColor del borde: " + chatFg
);

break;

default:
println("Error en el display: " + modo);

} //Switch

if (usandoTeclado) teclado.show(); else teclado.hide();

textC = cp5.get(ColorWheel.class,"texto").getRGB();
chatBk = cp5.get(ColorWheel.class,"fondo").getRGB();

//Actualiza los colores

myTextarea.setColor(textC);
teclado.setColor(textC);
usuarios.setColor(textC);
opciones.setColor(textC);

myTextarea.setColorBackground(chatBk);
teclado.setColorBackground(chatBk);
usuarios.setColorBackground(chatBk);
opciones.setColorBackground(chatBk);
  
} //Void

public void guardar(int theValue) {guardar();}

void bar(int n) {modo = n + 1;}

//void sel(int n) {colorM = n + 1;}

public void cambiarUsuario(int theValue)

{
  
boolean c = false;
println("Intruduze el nuevo nombre de usuario");  
usandoTeclado = true;  
teclado.show();
while (!c) {if(key == ENTER){UserName = output;c = true;}}
println("Nombre de usuario cambiado a: " + UserName);
teclado.hide();
usandoTeclado = false;  

}