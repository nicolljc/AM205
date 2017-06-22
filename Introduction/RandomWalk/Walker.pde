class Walker
{
  int x;
  int y;
  
  Walker()
  {
    x = width/2;
    y = height/2;
  }
  
  void display()
  {
    stroke(0);
    point(x, y);
  }
  
  void step()
  {
    int choice = int(random(10));
    
    if(choice > 4)
    {
        if(x < mouseX)
        {
          x++;
        }
        else
        {
          x--;
        }
        
        if(y < mouseY)
        {
          y++;
        }
        else
        {
          y--;
        }
     }
     else
     {
       switch(choice)
       {
         case 1: 
           x++;
           break;
         case 2: 
           x--; 
           break;
         case 3: 
           y++; 
           break;
         case 4: 
           y--; 
           break;
       }
     } 
  }
}