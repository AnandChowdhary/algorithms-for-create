/*
Program by Wouter Couwenbergh & Anand Chowdhary
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
  size(2000, 1000,P2D);
  frameRate(fps);
  imageMode(CENTER);
  setStuff();
}

void draw() 
{
  int frameStart = millis();
  frameTime = 1000/fps;
  background(255);
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
  frameTime = frameTime/100;
  for (int i = 0; i < proj.size(); ++i) 
  {
    proj.get(i).move();
    if (proj.get(i).done)
    {
      proj.remove(i);
    }
  }
}

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
    proj.get(proj.size() - 1).acceleration = PVector.sub(startLocation, new PVector(mouseX, mouseY));
    proj.get(proj.size() - 1).active = true;
    proj.add(new Projectile());
}