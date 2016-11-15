
String[] loadData = new String[5];

void cargar()

{
  try
  {
  loadData = loadStrings("settings.txt");
  
  bk = int(loadData[0]);
  textC = int(loadData[1]);
  chatBk = int(loadData[2]);
  chatFg = int(loadData[3]);
  
  PUERTO = int(loadData[4]);
  
  println("Opciones cargadas");
  }
  catch (Exception e)
  {println("No se ha podido cargar el archivo por el error: " + e);}
}

void guardar()

{
  try
  {
  loadData[0] = str(bk);
  loadData[1] = str(textC);
  loadData[2] = str(chatBk);
  loadData[3] = str(chatFg);
  
  loadData[4] = str(PUERTO);

  saveStrings("settings.txt", loadData);
  
  println("Opciones guardadas");
  }
  catch (Exception e)
  {println("No se ha podido guardar en el archivo por el error: " + e);}
}