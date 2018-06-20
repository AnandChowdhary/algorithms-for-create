/*
Program by Wouter Couwenbergh & Anand Chowdhary
*/



int fps;
int endMillis;
int realWorldCorrection;
int radius;
float airResistance;
float bounceResistance;
float frameTime;
boolean aim;
PVector gravity;
PVector startLocation;
PImage cat;
Catapult c;
ArrayList<Projectile> proj = new ArrayList<Projectile>();


void setup() 
{
  size(2000, 1000);
  setStuff();
  frameRate(fps);
  imageMode(CENTER);
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
  fps = 60;
  endMillis = 0;
  realWorldCorrection = 100;
  radius = 10;
  airResistance = 0.99;
  bounceResistance = 0.75;
  frameTime = 1000/fps;
  aim = false;
  gravity = new PVector(0, 9.81);
  startLocation = new PVector(width/4, 3*height/5);
  cat = loadImage("catapult.png");
  c = new Catapult();
  proj.add(new Projectile());
}

void update()
{
  frameTime = frameTime/realWorldCorrection;
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

void mouseReleased()
{
    proj.get(proj.size() - 1).acceleration = PVector.sub(startLocation, new PVector(mouseX, mouseY));
    proj.get(proj.size() - 1).active = true;
    proj.add(new Projectile());
    aim = false;
}

void mousePressed()
{
    aim = true;
}