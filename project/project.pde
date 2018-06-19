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

Catapult c;


void setup() 
{
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
  fill(255, 0, 0);
  stroke(255, 0, 0);
  if (active)
  {
    if (frameStart > endMillis + frameTime && frameStart < (endMillis + frameTime + 2))
    {
      c.move();
    } else
    {
      frameTime = frameTime + (frameStart - endMillis - frameTime);
      c.move();
    }
  }
  c.display();
  endMillis = millis();
}

void mouseClicked()
{
  if (!active)
  {
    active = true;
    done = false;
    c.acceleration = PVector.sub(c.location, new PVector(mouseX, mouseY));
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