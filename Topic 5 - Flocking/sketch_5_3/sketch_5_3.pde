/*
  Birds that fly around using flocking, with a dog which they avoid.
  made by Wouter Couwenbergh
  June 2018
*/

PImage bird;
Flock f;
Dog doggie;

void setup() 
{
    size(2000,1500);    
    bird = loadImage("bird.png");
    imageMode(CENTER);
    f = new Flock(100);
    doggie = new Dog();
}

void draw() 
{
    background(255);
    f.run();
    doggie.run(mouseX,mouseY);
}