class player 

{ 

  PVector x, v, a;
  int playerSize = 10;
  float maxAccel = 0.2;
  float maxVel = 5;
  color playerColor = color(0,0,0);
  boolean tchFloor = false;
  
  player(PVector temp_pos, PVector temp_vel, PVector temp_accel) 
  
  { 
    x = temp_pos;
    v = temp_vel;
    a = temp_accel;
  }

  void display() 
  {      
    
    int floor = height - playerSize / 2;
    
    a.y = g.y;
    
    a.y = constrain(a.y,-5,g.y);
    a.x = constrain(a.x,-maxAccel,maxAccel);

    v.add(a);
    v.x = constrain(v.x,-maxVel,maxVel);

    x.add(v);
    x.x = constrain(x.x,playerSize / 2,width - playerSize / 2);
    
    if (touchingPlatform(this,p))
    {x.y = constrain(x.y,playerSize / 2,floor);} //touchingPlatform(this,p).pos.y
    else
    {x.y = constrain(x.y,playerSize / 2,floor);}
    
    fill(playerColor); 
    ellipse(x.x,x.y,playerSize,playerSize);
  }
  
  void move(int k) 
  {
    boolean touchingFloor = x.y == height - playerSize / 2;
    if (keyPressed)
    {
     switch(k)
     {
      case 'w': //Salto
      if (touchingFloor || touchingPlatform(this,p))v.y = -50;
      break;
      case 'a':
      v.x = -4;
      break;
      case 'd':
      v.x = 4;
      break;
     }
    }
    else
    {v.x = 0;}
  }

}