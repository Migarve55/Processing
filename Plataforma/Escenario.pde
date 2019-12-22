
class platform

{

PVector size, pos; 
  
platform(PVector temp_size, PVector temp_pos)
{
 size = temp_size;
 pos = temp_pos;
}

void display()

{
fill(0);
rect(pos.x,pos.y,size.x,size.y);
}

}

boolean touchingPlatform(player p,platform pt[])

{

  boolean tch = false;
  for (int i = 0;i < pt.length;i++) //Todos 
  {
   if((p.x.x > pt[i].pos.x && p.x.x < pt[i].pos.x + pt[i].size.x) && (p.x.y - p.playerSize == pt[i].pos.y))
   {tch = true;println("Tocando:" + pt[i]);}   
  }
  return tch;
  
}

platform platformInput(player p,platform pt[])

{
 for (int i = 0;i < pt.length;i++) //Todos 
  {
   if((p.x.x > pt[i].pos.x && p.x.x < pt[i].pos.x + pt[i].size.x) && (p.x.y - p.playerSize == pt[i].pos.y))
   {return pt[i];}   
  }
  return pt[0];
}

void displayMap(platform pt[])

{
 for (int i = 0;i < pt.length;i++)
 {pt[i].display();}
}