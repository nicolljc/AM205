Balloon[] balloon = new Balloon[5];

void setup()
{
  size(600, 400);
  smooth();
  
  for(int i = 0; i < balloon.length; i++)
  {
    balloon[i]= new Balloon(i);
  }
}

void draw()
{
  background(27);
  stroke(153);
  rect(0, 0, 0, 0);

  for(int i=0; i < balloon.length; i++)
  {
    balloon[i].render();
    balloon[i].update();
    balloon[i].checkCollision();
  }
}