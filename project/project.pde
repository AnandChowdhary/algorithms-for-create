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
float resetPace;
float screenOffset;
float projectileScreenPos;
boolean aim;
boolean fired;
PVector gravity;
PVector startLocation;
PImage cat;
Catapult c;
Background b;
ArrayList<Projectile> proj = new ArrayList<Projectile>();


void setup() 
{
  size(2000, 1000,P2D);
  setStuff();
  frameRate(fps);
}

void draw() 
{
  int frameStart = millis();
  frameTime = 1000/fps;
  background(255);
  translate(screenOffset,0);
  if (!(frameStart > endMillis + frameTime && frameStart < (endMillis + frameTime + 2)))
  {
      frameTime = frameTime + (frameStart - endMillis - frameTime);
  }
  update();
  display();
  endMillis = millis();
  println(screenOffset);
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
  resetPace = 80;
  screenOffset = 0;
  aim = false;
  fired = false;
  gravity = new PVector(0, 9.81);
  startLocation = new PVector(width/4, 3*height/5);
  projectileScreenPos = width - startLocation.x;
  cat = loadImage("catapult.png");
  c = new Catapult();
  b = new Background();
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
      fired = false;
    }
  }
  if (fired)
  {
    if (proj.get(0).location.x > projectileScreenPos)
    {
      screenOffset = -(proj.get(0).location.x - projectileScreenPos);
    }
  }
  else
  {
    if (screenOffset < -resetPace)
    {
      screenOffset += resetPace;
    }
    else
    {
      screenOffset = 0;
    }
  }
}

void display()
{
  b.display();
  for (int i = 0; i < proj.size(); ++i) 
  {
    proj.get(i).display();
  }
  c.display();
}

void mouseReleased()
{
    if(!fired)
    {
      proj.get(proj.size() - 1).acceleration = PVector.sub(startLocation, new PVector(mouseX, mouseY));
      proj.get(proj.size() - 1).active = true;
      proj.add(new Projectile());
      aim = false;
      fired = true;
    }
}

void mousePressed()
{
    if (!fired)
    aim = true;
}