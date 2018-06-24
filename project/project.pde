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
PImage catpult;
PImage fish;
PImage fish2;
PImage fish3;
PImage fish4;
Catapult c;
Background b;
ArrayList<Projectile> proj = new ArrayList<Projectile>();
ArrayList<Projectile> reserve = new ArrayList<Projectile>();


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
  translate(screenOffset,0);
  if (!(frameStart > endMillis + frameTime && frameStart < (endMillis + frameTime + 2)))
  {
      frameTime = frameTime + (frameStart - endMillis - frameTime);
  }
  display();
  update();
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
  resetPace = 80;
  screenOffset = 0;
  aim = false;
  fired = false;
  gravity = new PVector(0, 9.81);
  startLocation = new PVector(width/4, 3*height/5);
  projectileScreenPos = width - startLocation.x;
  catpult = loadImage("catapult.png");
  fish = loadImage("fish.png");
  fish2 = loadImage("fish2.png");
  fish3 = loadImage("fish3.png");
  fish4 = loadImage("fish4.png");
  c = new Catapult();
  b = new Background();
  fillReserve();
}

void fillReserve()
{
  reserve.add(new Orange());
  reserve.add(new Yellow());
  reserve.add(new Blue());
  reserve.add(new Cyan());
  arangeReserve();
}

void arangeReserve()
{
  for (int i = 0; i < reserve.size(); i++)
  {
    reserve.get(i).location = new PVector(startLocation.x - (i+1)*6*radius,height - 1.5*radius);
  }
}

void update()
{
  frameTime = frameTime/realWorldCorrection;
  for (int i = 0; i < proj.size(); ++i) 
  {
    proj.get(i).update();
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
  if (mousePressed)
  {
    if (proj.size() > 0)
    {
      if (!fired && !proj.get(0).active)
      proj.get(0).location = new PVector(mouseX,mouseY);
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
  for (int i = 0; i < reserve.size(); i++)
  {
    reserve.get(i).display();
  }
  c.display();
}

void mousePressed()
{
    if(!fired)
    {
      aim = true;
      if (reserve.size() > 0)
      {
        proj.add(reserve.get(0));
        reserve.remove(0);
        proj.get(0).location = new PVector(mouseX,mouseY);
        arangeReserve();
      }
      else
      {
        fillReserve();
        proj.add(reserve.get(0));
        reserve.remove(0);
        proj.get(0).location = new PVector(mouseX,mouseY);
        arangeReserve();
      }
    }
}

void mouseReleased()
{
    if(!fired)
    {
      if (proj.size() > 0)
      {
        proj.get(0).location = startLocation.copy();
        proj.get(0).acceleration = PVector.sub(startLocation, new PVector(mouseX, mouseY));
        proj.get(0).active = true;
        aim = false;
        fired = true;
      }
    }
}