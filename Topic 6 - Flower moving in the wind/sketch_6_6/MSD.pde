//a single droplet of water of the watersurface

class MSD
{
  PVector location;
  float yPos;
  float level;
  float velocity;
  float acceleration;
  float force;
  float mass;
  float spring;
  float damper;
  float size;
  
  public MSD(float xPos, float yPos_, float mass_, float spring_, float damper_, float force_, float size_)
  {
      location = new PVector(xPos,yPos_);
      yPos = yPos_;
      level = 0;
      velocity = 0;
      acceleration = 0;
      mass = mass_;
      spring = spring_;
      damper = damper_;
      force = force_;
      size = size_;
  }
  
  void run(float f1, float f2)
  {
      display();
      update(f1,f2);
  }
  
  void display()
  {
      //noStroke();
      //fill(0);
      //ellipse(location.x,location.y,size,size);
      //adds a new vertex to the water surface
      vertex(location.x,location.y);
  }
  
  //update the location of the droplet
  void update(float f1, float f2)
  {
      force = -force + f1 + f2;
      acceleration = force/mass;
      velocity += acceleration;
      level += velocity;
      location.y = level + yPos;
      force = velocity*damper + level*spring;
  }
}