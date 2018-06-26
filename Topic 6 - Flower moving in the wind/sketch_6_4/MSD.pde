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
  
  void run()
  {
      display();
      update();
  }
  
  void display()
  {
      noStroke();
      fill(0);
      ellipse(location.x,location.y,size,size);
  }
  
  void update()
  {
      force = -force;
      acceleration = force/mass;
      velocity += acceleration;
      level += velocity;
      location.y = level + yPos;
      force = velocity*damper + level*spring;
  }
}