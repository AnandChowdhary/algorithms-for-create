/*
  Extends the example Noise1D from the examples of the Nature of code
  to two dimensions.
  made by Wouter Couwenbergh
  June 2018
*/

float xoff;
float xincrement; 
float yoff;
float yincrement;

void setup() {
  size(1000,1000);
  background(0);
  noStroke();
  xoff = random(0,1);
  yoff = random(0,1);
  xincrement = random(0.005,0.01);
  yincrement = random(0.005,0.01);
}

void draw() {
  // Create an alpha blended background
  fill(0, 10);
  rect(0,0,width,height);
  
  //float n = random(0,width);  // Try this line instead of noise
  
  // Get a noise value based on xoff and scale it according to the window's width
  float n = noise(xoff)*width;
  float m = noise(yoff)*height;
  
  // With each cycle, increment xoff
  xoff += xincrement;
  yoff += yincrement;
  
  // Draw the ellipse at the value produced by perlin noise
  fill(200);
  ellipse(n,m,16,16);
}