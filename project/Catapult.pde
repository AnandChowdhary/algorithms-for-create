class Catapult
{
  PVector location;

  public Catapult()
  {
    location = startLocation.copy();
  }

  void display()
  {
    fill(255, 0, 0);
    if (!active)
    {
      stroke(0);
      strokeWeight(10);
      line(mouseX, mouseY, location.x+width/34, location.y);
      line(mouseX, mouseY, location.x-width/34, location.y);
    }
    else
    {

    }
    image(cat,width/4,height-height/4,width/16,height/2);      
  }

  void move()
  {
    
  }
}