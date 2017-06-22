Walker w;

void setup()
{
  size(800,400);
  w = new Walker();
  background(255);
}

void draw()
{
  w.step();       
  w.display();
}