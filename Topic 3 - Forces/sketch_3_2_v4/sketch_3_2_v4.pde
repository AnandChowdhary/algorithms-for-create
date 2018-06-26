/*
  Shoots a ball from a catapult. the movement is dependend on millis, 
  framerate should thus not affect the trajectory of the projectile.
  made by Wouter Couwenbergh
  June 2018
*/

PImage cat;

int radius;
PVector gravity;
float airResistance;
float bounceResistance;
int endMillis = 0;
int fps = 60;
float frameTime;
PVector startLocation;

Catapult c;
ArrayList<Projectile> proj = new ArrayList<Projectile>();


void setup() 
{
  size(2000, 1000);
  frameRate(fps);
  imageMode(CENTER);
  setStuff();
}

void draw() 
{
  //gets the time at the beginning of the frame
  int frameStart = millis();
  //sets the value for how long the frame should take
  frameTime = 1000/fps;
  background(255);
  //checks if the previous frame ran long or not, if it did it adds more time to the frameTime
  //to correct for this.
  if (!(frameStart > endMillis + frameTime && frameStart < (endMillis + frameTime + 2)))
  {
      frameTime = frameTime + (frameStart - endMillis - frameTime);
  }
  update();
  display();
  endMillis = millis();
}

void setStuff()
{
  startLocation = new PVector(width/4, 3*height/5);
  radius = 10;
  gravity = new PVector(0, 9.81);
  airResistance = 0.99;
  bounceResistance = 0.75;
  frameTime = 1000/fps;
  c = new Catapult();
  cat = loadImage("catapult.png");
  proj.add(new Projectile());
}

void update()
{
  //corrects the simulation in relation to the real world
  frameTime = frameTime/100;
  //moves all the balls and also checks if they can be removed
  for (int i = 0; i < proj.size(); ++i) 
  {
    proj.get(i).move();
    if (proj.get(i).done)
    {
      proj.remove(i);
    }
  }
}

//displays everything
void display()
{
  for (int i = 0; i < proj.size(); ++i) 
  {
    proj.get(i).display();
  }
  c.display();
}

void mouseClicked()
{ 
    //adds a new projectile to the list and gives it an acceleration depedend on how far you pull the catapult back
    proj.get(proj.size() - 1).acceleration = PVector.sub(startLocation, new PVector(mouseX, mouseY));
    proj.get(proj.size() - 1).active = true;
    proj.add(new Projectile());
}