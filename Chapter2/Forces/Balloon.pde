class Balloon
{
  // Forces
  PVector v;      // Velocity
  PVector f;      // Floatation
  PVector r;      // Resistance
  PVector l;      // Location
  PVector a;      // Acceleration
  PVector wind;   // Wind force
  
  // Balloon
  float w;        // Width of the balloon
  float h;        // Heighth of the balloon
  float ribbonl;  // Ribbon length
  float maxV;     // Maximum velocity
  float ribbonsw; // Ribbon swing

  int array;
  
  //color of the balloon
  color c;

  Balloon(int array_)
  {
    // Velocity PVector
    v = new PVector(0, 0);
    
    // Float PVector
    f = new PVector(0, random(-0.02));
    maxV = 2;
    w = random(15) + 30;
    h = random(10) + w * 1.33;
  
    // Location PVector
    l = new PVector(random(width), random(height/2) + height * .5);
    ribbonl = 100;
    ribbonsw = 50;
    array = array_;
    c = color(random(255), random(255), random(255));
  }

  void update()
  {
    // Wind PVector
    wind = new PVector((noise(1, frameCount/200) - 0.3) * 0.01, 
                       (noise(2, frameCount/200) - 0.3) * 0.01);
  
    // Acceleration PVector
    a = PVector.add(f, wind);
 
    // Print a.x and a.y
    v.add(a);
    l.add(v);
  
    // print v.y
    v.limit(2);
  
    if(v.y > maxV )
    {
      v.y = maxV;
    }
    else if(v.y < -maxV)
    {
      v.y = -maxV;
    }
  }
  
  void render()
  {
    pushMatrix();
    translate(l.x, l.y + h/2);
    
    // Ribbon
    stroke(255);
    strokeWeight(1);
    noFill();
    bezier(0,0,0, 
          noise(1, array, frameCount/500.0) * ribbonl,
          noise(2, array, frameCount/500.0) * ribbonl, 
          noise(3, array, frameCount/500.0) * ribbonl, 
          noise(4, array, frameCount/500.0) * ribbonl, 
          noise(5, array, frameCount/500.0) * ribbonl);
    
    // Balloon
    fill(c);
    noStroke();
    ellipse(0, -h/2, w, h);
    popMatrix();
  }

  void checkCollision()
  {
    if(l.y < h/2)
    {
      v.y = v.y * -0.8;
      f.y = f.y * 0.8;
      if(v.y < 0.02 && -0.02 < v.y)
      {
        v.y = 0;
        f.y = 0;
        l.y = h/2;
      }
    }

    // Pring v.y
    if(l.x < w/2 || l.x > width - w/2)
    {
      v.x = v.x - 0.6;
    }
  }
}