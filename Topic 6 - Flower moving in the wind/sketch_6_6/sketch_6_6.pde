/*
  Water which moves when a raindrop falls on it.
  made by Wouter Couwenbergh
  June 2018
*/

Water surface;

void setup()
{
    size(2000,1000);
    surface = new Water();
}

void draw()
{
    background(255);
    noStroke();
    fill(#79BBF0);
    surface.run();
}

void mouseClicked()
{
    surface.newDrop();
}