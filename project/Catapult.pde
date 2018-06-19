class Catapult
{
  PVector location;
  PVector velocity;
  PVector acceleration;
  float deceleration;

  public Catapult()
  {
    location = new PVector(width/4, 3*height/5);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    deceleration = 0.8;
  }

  void display()
  {
    ellipse(location.x, location.y, radius, radius);
    if (!active)
      line(mouseX, mouseY, location.x, location.y);
  }

  void move()
  {
    frameTime = frameTime/100;
    if (location.x >= width - radius/2)
    {
      velocity.x = -bounceResistance * velocity.x;
      location.x = width - radius/2;
    }
    if (location.x <= radius/2)
    {
      velocity.x = -bounceResistance * velocity.x;
      location.x = radius/2;
    }
    if (location.y >= height - radius/2)
    {
      velocity.y = -bounceResistance * velocity.y;
      location.y = height - radius/2;
    }
    if (location.y <= radius/2)
    {
      velocity.y = -bounceResistance * velocity.y;
      location.y = radius/2;
    }
    if (acceleration.mag() > 1)
    {
      velocity.add(PVector.mult(acceleration, frameTime));
      acceleration.mult(deceleration);
    }
    location.add(PVector.mult(velocity, frameTime));
    velocity.add(PVector.mult(gravity, frameTime));
    velocity.mult(airResistance);

    if (velocity.y < 0.2 && location.y > (height - radius))
    {
      velocity.y = 0;
      if (velocity.x < 0.02 && location.y > (height - radius))
      {
        velocity.x = 0;
        location.y = height - radius/2;
        done = true;
      }
    }
  }
}