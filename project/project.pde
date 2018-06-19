/*
Program by Wouter Couwenbergh & Anand Chowdhary
*/

PImage cat;

int radius;
PVector gravity;
float airResistance;
float bounceResistance;
boolean active = false;
boolean done = false;
int endMillis = 0;
int fps = 60;
float frameTime;
PVector startLocation;

Catapult c;
ArrayList<Projectile> proj = new ArrayList<Projectile>();


void setup() 
{
  startLocation = new PVector(width/4, 3*height/5);
  size(2000, 1000);
  frameRate(fps);
  radius = 10;
  gravity = new PVector(0, 9.81);
  airResistance = 0.99;
  bounceResistance = 0.75;
  frameTime = 1000/fps;
  c = new Catapult();
  cat = loadImage("catapult.png");
  imageMode(CENTER);
}

void draw() 
{
  int frameStart = millis();
  frameTime = 1000/fps;
  background(255);
  if (active)
  {
    if (frameStart > endMillis + frameTime && frameStart < (endMillis + frameTime + 2))
    {
      for (int i = 0; i < proj.size(); ++i) 
      {
        proj.get(i).move();
      }
      //c.move();
    } 
    else
    {
      frameTime = frameTime + (frameStart - endMillis - frameTime);
      for (int i = 0; i < proj.size(); ++i) 
      {
        proj.get(i).move();
      }
      //c.move();
    }
  }
  c.display();
  for (int i = 0; i < proj.size(); ++i) 
  {
    proj.get(i).display();
  }
  endMillis = millis();
}


void mouseClicked()
{
  if (!active)
  {
    active = true;
    done = false;
    proj.add(new Projectile(PVector.sub(c.location, new PVector(mouseX, mouseY))));
    endMillis = millis();
  }
}

void keyPressed()
{
  if (key == 'r' || key == 'R')
  {
    if (done)
    {
      active = false;
      c.location = new PVector(width/4, 3*height/5);
    }
  }
}